// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'bag_rice_entity.g.dart';

@JsonSerializable()
class BagRiceEntity {
  String? id_canlua;
  String? name_canlua;
  String? sophieu;
  String? sophieucan;
  String? maghe;
  num? idenct;
  String? mand;
  String? makhuruong;
  String? name;
  num? weight;
  String? createdon;
  String? createdby;
  String? modifiedon;
  String? modifiedby;
  bool? trangthai;
  bool? noibo;
  num? id;
  bool isChecked;
  bool? isNotSync;
  int? idLocalDB;

  BagRiceEntity(
      {this.id_canlua,
      this.name_canlua,
      this.sophieu,
      this.sophieucan,
      this.idenct,
      this.mand,
      this.makhuruong,
      this.name,
      this.weight,
      this.maghe,
      this.createdon,
      this.createdby,
      this.modifiedon,
      this.modifiedby,
      this.trangthai,
      this.noibo,
      this.id,
      this.isNotSync,
      this.idLocalDB,
      this.isChecked = false});

  factory BagRiceEntity.fromJson(Map<String, dynamic> json) =>
      _$BagRiceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BagRiceEntityToJson(this);
}
