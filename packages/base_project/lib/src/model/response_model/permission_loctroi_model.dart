import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'permission_loctroi_model.g.dart';

@JsonSerializable()
class PermissionLoctroiModel {
  String? appId;
  String? menuId;
  String? menuName;
  String? parentMenuId;
  bool? status;

  PermissionLoctroiModel({this.appId, this.menuId, this.menuName, this.parentMenuId, this.status});

  factory PermissionLoctroiModel.fromJson(Map<String, dynamic> json) => _$PermissionLoctroiModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionLoctroiModelToJson(this);
}

