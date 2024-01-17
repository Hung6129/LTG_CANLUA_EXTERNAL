import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  LoginModel({
    this.email  ,
  this.isExternal,
  this.userName,
  this.password,
  this.token,
  this.isMobile,
  this.version, 
  
  });

  String? userName;
  String? password;
  String? token;
  String? email;
  bool? isMobile;
  bool? isExternal;
  String? version;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
