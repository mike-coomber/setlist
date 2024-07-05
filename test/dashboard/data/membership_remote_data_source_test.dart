import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setlist/features/dashboard/data/datasources/membership_remote_data_source.dart';
import 'package:setlist/features/dashboard/domain/entities/role.dart';

main() {
  late MembershipRemoteDataSourceImpl dataSourceImpl;

  setUp(() async {
    dataSourceImpl = MembershipRemoteDataSourceImpl(firebaseDatabase: FakeFirebaseFirestore());
  });

  test('Should create a new membership and return an id', () async {
    final membershipId = await dataSourceImpl.createMembership(
      musicianId: 'musician123',
      bandId: 'band123',
      role: Role.founder(),
    );

    expect(membershipId.isNotEmpty, true);
  });
}
