import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'b_nong_dan_entity.g.dart';

@JsonSerializable()
class BNongDanEntity {
  String? mand;
  String? tennd;

  BNongDanEntity({this.mand, this.tennd});

  factory BNongDanEntity.fromJson(Map<String, dynamic> json) => _$BNongDanEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BNongDanEntityToJson(this);
}

