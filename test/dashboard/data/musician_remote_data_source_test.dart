import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/core/errors.dart';
import 'package:setlist/features/dashboard/data/datasources/musician_remote_data_source.dart';

const musicianId = 'music123';
const musicianName = 'mike';

void main() {
  late MusicianRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    dataSourceImpl = MusicianRemoteDataSourceImpl(firebaseDatabase: FakeFirebaseFirestore());
  });

  test('Should create and fetch a new musician', () async {
    await dataSourceImpl.createMusician(name: musicianName, id: musicianId);

    final musician = await dataSourceImpl.getMusician(id: musicianId);
    expect(musician.id, musicianId);
  });

  test('Should throw a DataNotFound error if no musician exists', () async {
    expect(
      () async => await dataSourceImpl.getMusician(id: 'musician_doesnt_exist'),
      throwsA(
        isA<DataNotFoundError>(),
      ),
    );
  });
}
