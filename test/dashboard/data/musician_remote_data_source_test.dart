import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/features/dashboard/data/datasources/musician_remote_data_source.dart';

const musicianId = 'music123';
const musicianName = 'mike';

void main() {
  late MusicianRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    dataSourceImpl = MusicianRemoteDataSourceImpl(firebaseDatabase: MockFirebaseDatabase());
  });

  test('Should create a musician', () async {
    await dataSourceImpl.createMusician(name: musicianName, id: musicianId);
  });

  test('Should fetch the created musician', () async {
    final musician = await dataSourceImpl.getMusician(id: musicianId);
    expect(musician.id, musicianId);
  });
}
