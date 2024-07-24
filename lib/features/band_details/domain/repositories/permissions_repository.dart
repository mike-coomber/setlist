import 'package:setlist/features/band_details/domain/entities/permissions.dart';

abstract class PermissionsRepository {
  Future<Permissions> getPermissions({required String roleId});
}
