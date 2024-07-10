import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/core/data/datasources/band_remote_data_source.dart';
import 'package:setlist/core/errors.dart';

const bandName = 'band123';
const membershipId = 'membership123';

main() {
  late BandRemoteDataSourceImpl dataSourceImpl;
  late String bandId;

  setUp(() async {
    dataSourceImpl = BandRemoteDataSourceImpl(
      firebaseDatabase: FakeFirebaseFirestore(),
    );

    bandId = (await dataSourceImpl.createBand(bandName: bandName)).id;
  });

  test('The created band should have the correct name and an ID', () async {
    final createdBand = await dataSourceImpl.getBand(bandId: bandId);

    expect(createdBand.name, bandName);
    expect(bandId.isNotEmpty, true);
  });

  test('Should correctly fetch a list of bands with matching ids', () async {
    final bands = await dataSourceImpl.getBands(bandIds: [bandId]);

    expect(bands.length == 1, true);
    expect(bands.first.name == bandName, true);
  });

  test('Should correctly delete the band', () async {
    await dataSourceImpl.deleteBand(bandId: bandId);

    expect(
      () async => await dataSourceImpl.getBand(bandId: bandId),
      throwsA(
        isA<DataNotFoundError>,
      ),
    );
  });
}
