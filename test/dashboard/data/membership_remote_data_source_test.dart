import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/core/data/datasources/membership_remote_data_source.dart';
import 'package:setlist/core/domain/entities/role.dart';

const musicianId = 'musician123';
const bandId = 'band123';

main() {
  late MembershipRemoteDataSourceImpl dataSourceImpl;
  late String membershipId;

  setUp(() async {
    dataSourceImpl = MembershipRemoteDataSourceImpl(firebaseDatabase: FakeFirebaseFirestore());
    membershipId = await dataSourceImpl.createMembership(
      musicianId: musicianId,
      bandId: bandId,
      role: Role.founder(),
    );
  });

  test('Should create a new membership and return an id', () async {
    expect(membershipId.isNotEmpty, true);
  });

  test('Should be able to fetch the created membership with the musician id', () async {
    final memberships = await dataSourceImpl.getMembershipsFromUserId(userId: musicianId);

    expect(memberships.isNotEmpty, true);
    expect(memberships.first.musicianId, musicianId);
  });

  test('Should be able to fetch the created membership with the band id', () async {
    final memberships = await dataSourceImpl.getMembershipsFromBandId(bandId: bandId);

    expect(memberships.isNotEmpty, true);
    expect(memberships.first.bandId, bandId);
  });
}
