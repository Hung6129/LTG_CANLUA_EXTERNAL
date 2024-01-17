import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'b_so_phieu_entity.g.dart';

@JsonSerializable()
class BSoPhieuEntity {
  String? sophieu;
  String? tentinh;
String? tenhuyen;
  String? tenxa;
  String? xa;

  BSoPhieuEntity({this.sophieu, this.tentinh, this.tenhuyen, this.tenxa, this.xa});

  factory BSoPhieuEntity.fromJson(Map<String, dynamic> json) => _$BSoPhieuEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BSoPhieuEntityToJson(this);
}

