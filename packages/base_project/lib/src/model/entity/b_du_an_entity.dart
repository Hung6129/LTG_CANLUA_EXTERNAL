// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'b_du_an_entity.g.dart';

@JsonSerializable()
class BDuAnEntity {
  String? maduan;
  String? tenduan;

  BDuAnEntity({this.maduan, this.tenduan});

  factory BDuAnEntity.fromJson(Map<String, dynamic> json) => _$BDuAnEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BDuAnEntityToJson(this);
}

