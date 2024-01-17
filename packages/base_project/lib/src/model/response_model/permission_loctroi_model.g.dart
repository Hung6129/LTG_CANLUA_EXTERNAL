// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_loctroi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionLoctroiModel _$PermissionLoctroiModelFromJson(
        Map<String, dynamic> json) =>
    PermissionLoctroiModel(
      appId: json['appId'] as String?,
      menuId: json['menuId'] as String?,
      menuName: json['menuName'] as String?,
      parentMenuId: json['parentMenuId'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$PermissionLoctroiModelToJson(
        PermissionLoctroiModel instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'menuId': instance.menuId,
      'menuName': instance.menuName,
      'parentMenuId': instance.parentMenuId,
      'status': instance.status,
    };
