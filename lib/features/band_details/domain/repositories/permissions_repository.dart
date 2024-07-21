import 'package:setlist/features/band_details/domain/models/permissions.dart';

abstract class PermissionsRepository {
  Future<Permissions> getPermissions({required String roleId});
}
