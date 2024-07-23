import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/data/firebase_utils.dart';
import 'package:setlist/features/songs/data/models/song_model.dart';
import 'package:setlist/features/songs/domain/entities/song.dart';

abstract class SongRemoteDataSource {
  Future<Song> getSong({required String songId, required String bandId});

  Future<List<Song>> getSongs({required String bandId});

  Future<void> addSong({
    required String songName,
    required String artist,
    required int duration,
    required String bandId,
  });

  Future<void> deleteSong({required String songId, required String bandId});
}

class SongRemoteDataSourceImpl extends SongRemoteDataSource {
  SongRemoteDataSourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<void> addSong({
    required String songName,
    required String artist,
    required int duration,
    required String bandId,
  }) {
    final docRef = _db.collection(kBandPath).doc(bandId).collection(kSongsPath).doc();

    final newSong = SongModel(name: songName, artist: artist, duration: duration);

    return firebaseSet(docRef: docRef, data: newSong.toJson());
  }

  @override
  Future<void> deleteSong({required String songId, required String bandId}) {
    // TODO: implement deleteSong
    throw UnimplementedError();
  }

  @override
  Future<Song> getSong({required String songId, required String bandId}) {
    final docRef = _db.collection(kBandPath).doc(bandId).collection(kSongsPath).doc(songId);

    return firebaseGet(docRef: docRef, converter: SongModel.fromJson);
  }

  @override
  Future<List<Song>> getSongs({required String bandId}) {
    final collectionRef = _db.collection(kBandPath).doc(bandId).collection(kSongsPath);

    return firebaseQuery(query: collectionRef, converter: SongModel.fromJson);
  }
}
