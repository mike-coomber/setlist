import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/data/firebase_utils.dart';
import 'package:setlist/core/data/models/band_model.dart';
import 'package:setlist/core/domain/entities/band.dart';

abstract class BandRemoteDataSource {
  Future<Band> getBand({required String bandId});

  Future<List<Band>> getBands({required List<String> bandIds});

  Future<Band> createBand({required String bandName});

  Future<void> deleteBand({required String bandId});
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

  @override
  Future<void> deleteBand({required String bandId}) {
    final docRef = _db.collection(kBandPath).doc(bandId);

    return firebaseDelete(docRef: docRef);
  }
}
