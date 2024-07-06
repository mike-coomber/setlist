import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/features/dashboard/data/datasources/membership_remote_data_source.dart';
import 'package:setlist/features/dashboard/domain/entities/role.dart';

const musicianId = 'musician123';

main() {
  late MembershipRemoteDataSourceImpl dataSourceImpl;
  late String membershipId;

  setUp(() async {
    dataSourceImpl = MembershipRemoteDataSourceImpl(firebaseDatabase: FakeFirebaseFirestore());
    membershipId = await dataSourceImpl.createMembership(
      musicianId: musicianId,
      bandId: 'band123',
      role: Role.founder(),
    );
  });

  test('Should create a new membership and return an id', () async {
    expect(membershipId.isNotEmpty, true);
  });

  test('Should be able to fetch the created membership with the musician id', () async {
    final memberships = await dataSourceImpl.getMemberships(userId: musicianId);

    expect(memberships.isNotEmpty, true);
    expect(memberships.first.musicianId, musicianId);
  });
}
