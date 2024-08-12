import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/data/firebase_utils.dart';
import 'package:setlist/features/setlist_editor/data/models/setlist_event_model.dart';
import 'package:setlist/features/setlist_editor/data/models/setlist_model.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';

abstract class SetlistRemoteDatasource {
  Future<void> addSetlist({
    required String setlistName,
    required List<SetlistEvent> events,
    required String bandId,
  });

  Future<Setlist> getSetlist({required String setlistId, required String bandId});

  Future<List<Setlist>> getSetlists({required String bandId});
}

class SetlistRemoteDatasourceImpl extends SetlistRemoteDatasource {
  SetlistRemoteDatasourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<String> addSetlist({
    required String setlistName,
    required List<SetlistEvent> events,
    required String bandId,
  }) async {
    final docRef = _db.collection(kBandPath).doc(bandId).collection(kSetlistsPath).doc();

    final data = SetlistModel(
      name: setlistName,
      id: docRef.id,
      events: events.map((e) => SetlistEventModel.fromEntity(e)).toList(),
    ).toJson();

    await firebaseSet(docRef: docRef, data: data);

    return docRef.id;
  }

  @override
  Future<Setlist> getSetlist({required String setlistId, required String bandId}) async {
    final docRef = _db.collection(kBandPath).doc(bandId).collection(kSetlistsPath).doc(setlistId);

    return await firebaseGet(docRef: docRef, converter: SetlistModel.fromJson);
  }

  @override
  Future<List<Setlist>> getSetlists({required String bandId}) async {
    final collectionRef = _db.collection(kBandPath).doc(bandId).collection(kSetlistsPath);

    return await firebaseQuery(query: collectionRef, converter: SetlistModel.fromJson);
  }
}
