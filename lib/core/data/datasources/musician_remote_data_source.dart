import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/data/firebase_utils.dart';
import 'package:setlist/core/domain/entities/musician.dart';

import '../models/musician_model.dart';

abstract class MusicianRemoteDataSource {
  Future<Musician> getMusician({required String id});

  Future<Musician> createMusician({required String name, required String id});

  Future<List<Musician>> getMusicians({required List<String> musicianIds});
}

class MusicianRemoteDataSourceImpl extends MusicianRemoteDataSource {
  MusicianRemoteDataSourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<Musician> createMusician({required String name, required String id}) async {
    final newMusician = MusicianModel(id: id, name: name);
    final docRef = _db.collection(kMusicianPath).doc(id);

    await firebaseSet(docRef: docRef, data: newMusician.toJson());

    return newMusician;
  }

  @override
  Future<Musician> getMusician({required String id}) async {
    final docRef = _db.collection(kMusicianPath).doc(id);

    return firebaseGet(docRef: docRef, converter: MusicianModel.fromJson);
  }

  @override
  Future<List<Musician>> getMusicians({required List<String> musicianIds}) {
    final query = _db.collection(kMusicianPath).where(
          FieldPath.documentId,
          whereIn: musicianIds,
        );

    return firebaseGetMultipleFromQuery(
      query: query,
      converter: MusicianModel.fromJson,
    );
  }
}
