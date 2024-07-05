import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/db_consts.dart';
import 'package:setlist/core/firebase_utils.dart';
import 'package:setlist/features/dashboard/data/models/band_model.dart';
import 'package:setlist/features/dashboard/domain/entities/band.dart';
import 'package:setlist/features/dashboard/domain/entities/membership.dart';

abstract class BandRemoteDataSource {
  Future<List<Band>> getBands({required List<Membership> memberships});

  Future<String> createBand({required String bandName});

  Future<void> addMembership({required String bandId, required String membershipId});
}

class BandRemoteDataSourceImpl extends BandRemoteDataSource {
  BandRemoteDataSourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<void> addMembership({required String bandId, required String membershipId}) {
    final docRef = _db.collection(kMusicianPath).doc(bandId);

    return firebaseUpdate(
      docRef,
      {
        "memberships": FieldValue.arrayUnion([membershipId]),
      },
    );
  }

  @override
  Future<String> createBand({required String bandName}) {
    final collectionRef = _db.collection(kBandPath);

    final newBand = BandModel(membershipIds: [], name: bandName);

    return firebaseAdd(collectionRef, newBand.toJson());
  }

  @override
  Future<List<Band>> getBands({required List<Membership> memberships}) async {
    final bandIds = memberships.map((membership) => membership.bandId);

    final collectionRef = _db.collection(kBandPath).where(FieldPath.documentId, whereIn: bandIds);

    return (await collectionRef.get())
        .docs
        .map(
          (doc) => BandModel.fromJson(doc.data()),
        )
        .toList();
  }
}
