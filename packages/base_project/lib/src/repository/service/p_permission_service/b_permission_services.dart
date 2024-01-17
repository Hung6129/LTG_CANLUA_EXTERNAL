// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:retrofit/retrofit.dart';

part 'b_permission_services.g.dart';

@RestApi(baseUrl: BaseRepository.baseURLChotGia)
abstract class BPermissionService {
  factory BPermissionService(Dio dio, {String baseUrl}) = _BPermissionService;

  @GET("User/GetUserPermissionList/{username}")
  Future<List<PermissionLoctroiModel>> getPermission(@Path() String username);

 
}
