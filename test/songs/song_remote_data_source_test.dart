import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/core/data/datasources/band_remote_data_source.dart';
import 'package:setlist/features/songs/data/datasources/song_remote_datasource.dart';

main() {
  late BandRemoteDataSourceImpl bandDataSourceImpl;
  late SongRemoteDataSourceImpl songDataSourceImpl;
  late String bandId;

  setUp(() async {
    bandDataSourceImpl = BandRemoteDataSourceImpl(
      firebaseDatabase: FakeFirebaseFirestore(),
    );
    songDataSourceImpl = SongRemoteDataSourceImpl(
      firebaseDatabase: FakeFirebaseFirestore(),
    );

    bandId = (await bandDataSourceImpl.createBand(bandName: 'band')).id;
  });

  test('Should correctly add a song to the band', () async {
    await songDataSourceImpl.addSong(
      songName: 'song',
      artist: 'artist',
      duration: 100,
      bandId: bandId,
    );

    final songs = await songDataSourceImpl.getSongs(bandId: bandId);

    expect(songs.length == 1, true);
    expect(songs.first.name == 'song', true);
  });
}
