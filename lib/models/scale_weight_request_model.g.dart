// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scale_weight_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScaleWeightRequestModel _$ScaleWeightRequestModelFromJson(
        Map<String, dynamic> json) =>
    ScaleWeightRequestModel(
      id_canlua: json['id_canlua'] as String?,
      name: json['name'] as String?,
      soPhieuCan: json['soPhieuCan'] as String?,
      idLocalDB: json['idLocalDB'] as int?,
      idenct: json['idenct'] as num?,
      mand: json['mand'] as String?,
      makhuruong: json['makhuruong'] as String?,
      maghe: json['maghe'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScaleWeightRequestModelToJson(
        ScaleWeightRequestModel instance) =>
    <String, dynamic>{
      'id_canlua': instance.id_canlua,
      'name': instance.name,
      'soPhieuCan': instance.soPhieuCan,
      'idLocalDB': instance.idLocalDB,
      'idenct': instance.idenct,
      'mand': instance.mand,
      'maghe': instance.maghe,
      'makhuruong': instance.makhuruong,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) => DataBean(
      name: json['name'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      id: json['id'] as num?,
    );

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'id': instance.id,
    };
