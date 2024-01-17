// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
// ignore_for_file: depend_on_referenced_packages

part 'scale_weight_request_model.g.dart';

@JsonSerializable()
class ScaleWeightRequestModel {
  String? id_canlua;
  String? name;
  String? soPhieuCan;
  int? idLocalDB;
  num? idenct;
  String? mand;
  String? maghe;
  String? makhuruong;
  List<DataBean>? data;

  ScaleWeightRequestModel(
      {this.id_canlua,
      this.name,
      this.soPhieuCan,
      this.idLocalDB,
      this.idenct,
      this.mand,
      this.makhuruong,
      this.maghe,
      this.data});

  factory ScaleWeightRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ScaleWeightRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleWeightRequestModelToJson(this);

  BagRiceEntity convertToBagRice() {
    return BagRiceEntity(
        id_canlua: id_canlua,
        name_canlua: name,
        idenct: idenct,
        mand: mand,
        idLocalDB: idLocalDB,
        makhuruong: makhuruong,
        id: data?.first.id,
        weight: data?.first.weight,
        name: data?.first.name);
  }

  @override
  String toString() {
    return 'ScaleWeightRequestModel(id_canlua: $id_canlua, name: $name, soPhieuCan: $soPhieuCan, idenct: $idenct, mand: $mand, maghe: $maghe, makhuruong: $makhuruong, data: $data)';
  }
}

@JsonSerializable()
class DataBean {
  String? name;
  double? weight;
  num? id;
  DataBean({this.name, this.weight, this.id});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}
