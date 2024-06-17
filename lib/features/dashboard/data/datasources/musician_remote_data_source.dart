import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';

import '../models/musician_model.dart';

abstract class MusicianRemoteDataSource {
  Future<Musician> getMusician({required String id});

  Future<Musician> createMusician({required String name, required String id});
}

class MusicianRemoteDataSourceImpl extends MusicianRemoteDataSource {
  MusicianRemoteDataSourceImpl({
    FirebaseDatabase? firebaseDatabase,
  }) : _database = firebaseDatabase ?? FirebaseDatabase.instance;

  final FirebaseDatabase _database;

  @override
  Future<Musician> createMusician({required String name, required String id}) async {
    final ref = _database.ref("musicians/$id");
    try {
      await ref.set({'name': name, 'memberships': [], 'id': id});
      return Musician(id: id, name: name, memberships: []);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Musician> getMusician({required String id}) async {
    final ref = _database.ref();
    final snapshot = await ref.child('musicians/$id').get();

    if (snapshot.exists) {
      return MusicianModel.fromJson(snapshot.value as Map<String, dynamic>);
    } else {
      throw Error();
    }
  }
}
