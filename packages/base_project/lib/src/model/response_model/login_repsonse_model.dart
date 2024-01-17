import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'login_repsonse_model.g.dart';

@JsonSerializable()
class LoginRepsonseModel {
  String? userName;
  String? sodienthoai;
  String? hoten;
  String? fullName;
  String? diachi;
  String? phone;
  String? email;
  String? tinh;
  String? huyen;
  String? xa;
  String? tentinh;
  String? tenhuyen;
  String? tenxa;
  String? token;
  dynamic mobile;
  String? appid;
  String? errorMessage;
  num? userType;
  num? iden;

  LoginRepsonseModel(
      {this.userName,
      this.fullName,
      this.phone,
      this.email,
      this.token,
      this.mobile,
      this.appid,
      this.diachi,
      this.hoten,
      this.iden,
      this.huyen,
      this.sodienthoai,
      this.tenhuyen,
      this.tentinh,
      this.tenxa,
      this.tinh,
      this.xa,
      this.errorMessage,
      this.userType});

  factory LoginRepsonseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRepsonseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRepsonseModelToJson(this);
}
