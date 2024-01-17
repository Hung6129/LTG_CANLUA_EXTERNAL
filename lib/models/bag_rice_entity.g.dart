// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_rice_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BagRiceEntity _$BagRiceEntityFromJson(Map<String, dynamic> json) =>
    BagRiceEntity(
      id_canlua: json['id_canlua'] as String?,
      name_canlua: json['name_canlua'] as String?,
      sophieu: json['sophieu'] as String?,
      sophieucan: json['sophieucan'] as String?,
      idenct: json['idenct'] as num?,
      mand: json['mand'] as String?,
      makhuruong: json['makhuruong'] as String?,
      name: json['name'] as String?,
      weight: json['weight'] as num?,
      maghe: json['maghe'] as String?,
      createdon: json['createdon'] as String?,
      createdby: json['createdby'] as String?,
      modifiedon: json['modifiedon'] as String?,
      modifiedby: json['modifiedby'] as String?,
      trangthai: json['trangthai'] as bool?,
      noibo: json['noibo'] as bool?,
      id: json['id'] as num?,
      isNotSync: json['isNotSync'] as bool?,
      idLocalDB: json['idLocalDB'] as int?,
      isChecked: json['isChecked'] as bool? ?? false,
    );

Map<String, dynamic> _$BagRiceEntityToJson(BagRiceEntity instance) =>
    <String, dynamic>{
      'id_canlua': instance.id_canlua,
      'name_canlua': instance.name_canlua,
      'sophieu': instance.sophieu,
      'sophieucan': instance.sophieucan,
      'maghe': instance.maghe,
      'idenct': instance.idenct,
      'mand': instance.mand,
      'makhuruong': instance.makhuruong,
      'name': instance.name,
      'weight': instance.weight,
      'createdon': instance.createdon,
      'createdby': instance.createdby,
      'modifiedon': instance.modifiedon,
      'modifiedby': instance.modifiedby,
      'trangthai': instance.trangthai,
      'noibo': instance.noibo,
      'id': instance.id,
      'isChecked': instance.isChecked,
      'isNotSync': instance.isNotSync,
      'idLocalDB': instance.idLocalDB,
    };
