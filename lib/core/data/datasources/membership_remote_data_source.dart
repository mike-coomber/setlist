import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/data/firebase_utils.dart';
import 'package:setlist/core/data/models/membership_model.dart';
import 'package:setlist/core/domain/entities/membership.dart';

abstract class MembershipRemoteDataSource {
  Future<String> createMembership({required Membership membership});

  Future<void> createMemeberships({required List<Membership> memberships});

  Future<List<Membership>> getMembershipsFromMusicianId({required String userId});

  Future<List<Membership>> getMembershipsFromBandId({required String bandId});

  Stream<List<Membership>> membershipUpdateNotifier({required String userId});
}

class MembershipRemoteDataSourceImpl extends MembershipRemoteDataSource {
  MembershipRemoteDataSourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  @override
  Future<String> createMembership({required Membership membership}) {
    final collectionRef = _db.collection(kMembershipPath);

    final newMembership = MembershipModel.fromEntity(membership);

    return firebaseAdd(collectionRef: collectionRef, data: newMembership.toJson());
  }

  @override
  Future<void> createMemeberships({required List<Membership> memberships}) {
    final batch = _db.batch();

    for (final membership in memberships) {
      final docRef = _db.collection(kMembershipPath).doc();
      final data = MembershipModel.fromEntity(membership).toJson();
      batch.set(docRef, data);
    }

    return firebaseCommitBatch(batch: batch);
  }

  @override
  Future<List<Membership>> getMembershipsFromMusicianId({required String userId}) async {
    final query = _db.collection(kMembershipPath).where(
          'musicianId',
          isEqualTo: userId,
        );

    return firebaseQuery(
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

    return firebaseQuery(
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
