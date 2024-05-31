import 'package:firebase_database/firebase_database.dart';
import 'package:setlist/features/dashboard/domain/entities/musician.dart';

abstract class MusicianRemoteDataSource {
  Future<Musician> getMusician({required String id});

  Future<Musician> createMusician({required String name});
}

class MusicianRemoteDataSourceImpl extends MusicianRemoteDataSource {
  MusicianRemoteDataSourceImpl({
    FirebaseDatabase? firebaseDatabase,
  }) : _database = firebaseDatabase ?? FirebaseDatabase.instance;

  final FirebaseDatabase _database;

  @override
  Future<Musician> createMusician({required String name}) {
    // TODO: implement createMusician
    throw UnimplementedError();
  }

  @override
  Future<Musician> getMusician({required String id}) {
    // TODO: implement getMusician
    throw UnimplementedError();
  }
}
