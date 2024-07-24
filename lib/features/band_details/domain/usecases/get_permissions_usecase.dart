import 'package:setlist/features/band_details/domain/entities/permissions.dart';
import 'package:setlist/features/band_details/domain/repositories/permissions_repository.dart';

class GetPermissionsUsecase {
  final PermissionsRepository permissionsRepository;

  GetPermissionsUsecase({required this.permissionsRepository});

  Future<Permissions> call({required String roleId}) {
    return permissionsRepository.getPermissions(roleId: roleId);
  }
}
