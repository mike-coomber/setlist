import 'package:setlist/features/band_details/data/datasources/permissions_remote_datasource.dart';
import 'package:setlist/features/band_details/domain/models/permissions.dart';
import 'package:setlist/features/band_details/domain/repositories/permissions_repository.dart';

class PermissionsRepositoryImpl extends PermissionsRepository {
  final PermissionsRemoteDatasource remoteDataSource;

  PermissionsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Permissions> getPermissions({
    required String roleId,
  }) async {
    return remoteDataSource.getPermissions(roleId: roleId);
  }
}
