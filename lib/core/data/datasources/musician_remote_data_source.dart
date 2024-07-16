import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/data/firebase_utils.dart';
import 'package:setlist/core/domain/entities/musician.dart';

import '../models/musician_model.dart';

abstract class MusicianRemoteDataSource {
  Future<Musician> getMusician({required String id});

  Future<Musician> createMusician({required String name, required String id});

  Future<List<Musician>> getMusicians({required List<String> musicianIds});

  Future<List<Musician>> searchMusicians({
    required String searchStr,
    required List<String> currentMemberMusicianIds,
  });
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

    return firebaseQuery(
      query: query,
      converter: MusicianModel.fromJson,
    );
  }

  @override
  Future<List<Musician>> searchMusicians({
    required String searchStr,
    required List<String> currentMemberMusicianIds,
  }) {
    final strFrontCode = searchStr.substring(0, searchStr.length - 1);
    final strEndCode = searchStr.characters.last;
    final limit = strFrontCode + String.fromCharCode(strEndCode.codeUnitAt(0) + 1);

    final query = _db
        .collection(kMusicianPath)
        .where(
          FieldPath.documentId,
          whereNotIn: currentMemberMusicianIds,
        )
        .where('name', isGreaterThanOrEqualTo: searchStr)
        .where('name', isLessThan: limit);

    return firebaseQuery(
      query: query,
      converter: MusicianModel.fromJson,
    );
  }
}
