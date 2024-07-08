import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/db_consts.dart';
import 'package:setlist/core/firebase_utils.dart';
import 'package:setlist/features/dashboard/data/models/band_model.dart';
import 'package:setlist/features/dashboard/domain/entities/band.dart';

abstract class BandRemoteDataSource {
  Future<Band> getBand({required String bandId});

  Future<List<Band>> getBands({required List<String> bandIds});

  Future<Band> createBand({required String bandName});
}

class BandRemoteDataSourceImpl extends BandRemoteDataSource {
  BandRemoteDataSourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<Band> createBand({required String bandName}) async {
    final docRef = _db.collection(kBandPath).doc();

    final newBand = BandModel(
      memberships: [],
      name: bandName,
      id: docRef.id,
    );

    await firebaseSet(docRef: docRef, data: newBand.toJson());

    return newBand;
  }

  @override
  Future<List<Band>> getBands({required List<String> bandIds}) async {
    final query = _db.collection(kBandPath).where(
          FieldPath.documentId,
          whereIn: bandIds,
        );

    return firebaseGetMultipleFromQuery(
      query: query,
      converter: BandModel.fromJson,
    );
  }

  @override
  Future<Band> getBand({required String bandId}) async {
    final docRef = _db.collection(kBandPath).doc(bandId);

    return firebaseGet(docRef: docRef, converter: BandModel.fromJson);
  }
}
