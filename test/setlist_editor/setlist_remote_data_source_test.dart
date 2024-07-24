import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/core/data/datasources/band_remote_data_source.dart';
import 'package:setlist/features/setlist_editor/data/datasources/setlist_remote_datasource.dart';
import 'package:setlist/features/setlist_editor/domain/entities/setlist_event.dart';

const setlistName = 'setlist';
const songName = 'song';

main() {
  late SetlistRemoteDatasourceImpl setlistdataSourceImpl;
  late BandRemoteDataSourceImpl bandDataSourceImpl;
  late String bandId;
  late String setlistId;

  setUp(() async {
    setlistdataSourceImpl = SetlistRemoteDatasourceImpl(
      firebaseDatabase: FakeFirebaseFirestore(),
    );
    bandDataSourceImpl = BandRemoteDataSourceImpl(
      firebaseDatabase: FakeFirebaseFirestore(),
    );

    bandId = (await bandDataSourceImpl.createBand(bandName: 'band')).id;
    setlistId = await setlistdataSourceImpl.addSetlist(
      setlistName: setlistName,
      events: [
        SetlistEvent(
          name: 'event',
          notes: 'notes',
          length: 100,
          songId: null,
          order: 1,
        ),
      ],
      bandId: bandId,
    );
  });

  test('Should get the created setlist', () async {
    final setlist = await setlistdataSourceImpl.getSetlist(setlistId: setlistId, bandId: bandId);

    expect(setlist.name, setlistName);
    expect(setlist.events.length == 1, true);
    expect(setlist.events.first.name == 'event', true);
  });
}
