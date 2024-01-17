// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';

abstract class IBLoginRepository {
  Future<LoginRepsonseModel?> login(
      {required String username, required String password});

  Future<List<PermissionLoctroiModel>> getPermissions();

  Future<LoginRepsonseModel?> register({
    required String sodienthoai,
    required String matkhau,
    required String hoten,
    required String tinh,
    required String tentinh,
    required String huyen,
    required String tenhuyen,
    required String xa,
    required String tenxa,
  });

  Future<bool?> changePass(
      {required String sodienthoai, required String matkhau});
}
