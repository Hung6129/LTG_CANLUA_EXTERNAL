import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'b_ghe_entity.g.dart';

@JsonSerializable()
class BGheEntity {
  String? maghe;
  String? tenghe;
  String? tenkhac;
  String? sophuongtien;
  String? madoighe;
  String? tendoighe;
  String? tenchughe;
  String? dienthoaichughe;
  String? cmnd;
  String? ngaycap;
  String? noicap;
  num? loaighe;
  bool? trangthai;
  String? createdon;
  String? createdby;
  String? modifiedon;
  String? modifiedby;
  num? iden;
  dynamic tenloaighe;
  dynamic ngaycapstr;

  BGheEntity({this.maghe, this.tenghe, this.tenkhac, this.sophuongtien, this.madoighe, this.tendoighe, this.tenchughe, this.dienthoaichughe, this.cmnd, this.ngaycap, this.noicap, this.loaighe, this.trangthai, this.createdon, this.createdby, this.modifiedon, this.modifiedby, this.iden, this.tenloaighe, this.ngaycapstr});

  factory BGheEntity.fromJson(Map<String, dynamic> json) => _$BGheEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BGheEntityToJson(this);
}

