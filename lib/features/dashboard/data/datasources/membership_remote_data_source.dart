import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/db_consts.dart';
import 'package:setlist/core/firebase_utils.dart';
import 'package:setlist/features/dashboard/data/models/membership_model.dart';
import 'package:setlist/features/dashboard/data/models/role_model.dart';
import 'package:setlist/features/dashboard/domain/entities/membership.dart';

import '../../domain/entities/role.dart';

abstract class MembershipRemoteDataSource {
  Future<String> createMembership({
    required String musicianId,
    required String bandId,
    required Role role,
  });

  Future<List<Membership>> getMembershipsFromUserId({required String userId});

  Future<List<Membership>> getMembershipsFromBandId({required String bandId});

  Stream<List<Membership>> membershipUpdateNotifier({required String userId});
}

class MembershipRemoteDataSourceImpl extends MembershipRemoteDataSource {
  MembershipRemoteDataSourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<String> createMembership({required String musicianId, required String bandId, required Role role}) {
    final collectionRef = _db.collection(kMembershipPath);

    final newMembership = MembershipModel(
      bandId: bandId,
      musicianId: musicianId,
      role: RoleModel.fromEntity(role),
    );

    return firebaseAdd(collectionRef: collectionRef, data: newMembership.toJson());
  }

  @override
  Future<List<Membership>> getMembershipsFromUserId({required String userId}) async {
    final query = _db.collection(kMembershipPath).where(
          'musicianId',
          isEqualTo: userId,
        );

    return firebaseGetMultipleFromQuery(
      query: query,
      converter: MembershipModel.fromJson,
    );
  }

  @override
  Future<List<Membership>> getMembershipsFromBandId({required String bandId}) async {
    final query = _db.collection(kMembershipPath).where(
          'bandId',
          isEqualTo: bandId,
        );

    return firebaseGetMultipleFromQuery(
      query: query,
      converter: MembershipModel.fromJson,
    );
  }

  @override
  Stream<List<Membership>> membershipUpdateNotifier({required String userId}) {
    final collectionRef = _db.collection(kMembershipPath).where(
          'musicianId',
          isEqualTo: userId,
        );

    return collectionRef.snapshots().map(
          (snapshot) => parseDocs(
            docs: snapshot.docs,
            converter: MembershipModel.fromJson,
          ),
        );
  }
}
