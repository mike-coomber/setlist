import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/db_consts.dart';
import 'package:setlist/core/firebase_utils.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';

import '../models/musician_model.dart';

abstract class MusicianRemoteDataSource {
  Future<Musician> getMusician({required String id});

  Future<Musician> createMusician({required String name, required String id});

  Future<void> addMembership({required musicianId, required membershipId});
}

class MusicianRemoteDataSourceImpl extends MusicianRemoteDataSource {
  MusicianRemoteDataSourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<Musician> createMusician({required String name, required String id}) async {
    final newMusician = MusicianModel(id: id, name: name, memberships: []);
    final docRef = _db.collection(kMusicianPath).doc(id);

    await firebaseSet(docRef, newMusician.toJson());

    return newMusician;
  }

  @override
  Future<Musician> getMusician({required String id}) async {
    final docRef = _db.collection(kMusicianPath).doc(id);

    return MusicianModel.fromJson(await firebaseGet(docRef));
  }

  @override
  Future<void> addMembership({required musicianId, required membershipId}) async {
    final docRef = _db.collection(kMusicianPath).doc(musicianId);

    return firebaseUpdate(
      docRef,
      {
        "memberships": FieldValue.arrayUnion([membershipId]),
      },
    );
  }
}
