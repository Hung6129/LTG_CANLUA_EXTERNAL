// import 'package:dio/dio.dart';
// import 'dart:developer';

// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:retrofit/retrofit.dart';

part 'b_login_services.g.dart';

@RestApi(baseUrl: BaseRepository.baseURLLogin)
abstract class BLoginService {
  factory BLoginService(Dio dio, {String baseUrl}) = _BLoginService;

  @POST("api/User/LoginV2")
  Future<LoginRepsonseModel> login(@Body() Map<String, dynamic> body);

  @POST("api/User/Register")
  Future<LoginRepsonseModel> register(@Body() Map<String, dynamic> body);

  @GET("api/User/GetUserPermissionList/{username}/DVNN")
  Future<List<PermissionLoctroiModel>> getPermission(@Path() String username);

  @POST("api/User/ForgotPasswordCanLua")
  Future<bool> changePass(@Body() Map<String, dynamic> body);
}
