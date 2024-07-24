import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:setlist/core/data/db_consts.dart';
import 'package:setlist/core/data/firebase_utils.dart';
import 'package:setlist/features/band_details/data/models/permissions_model.dart';
import 'package:setlist/features/band_details/domain/entities/permissions.dart';

abstract class PermissionsRemoteDatasource {
  Future<Permissions> getPermissions({required String roleId});
}

class PermissionsRemoteDatasourceImpl implements PermissionsRemoteDatasource {
  final FirebaseFirestore _db;

  PermissionsRemoteDatasourceImpl({
    FirebaseFirestore? firebaseDatabase,
  }) : _db = firebaseDatabase ?? FirebaseFirestore.instance;

  @override
  Future<Permissions> getPermissions({required String roleId}) {
    final docRef = _db.collection(kPermissoinsPath).doc(roleId);

    return firebaseGet(docRef: docRef, converter: PermissionsModel.fromJson);
  }
}
