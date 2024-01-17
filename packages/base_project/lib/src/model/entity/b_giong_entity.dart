import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'b_giong_entity.g.dart';

@JsonSerializable()
class BGiongEntity {
  String? maloaict;
  String? macaytrong;
  String? magiong;
  String? tengiong;
  String? gionglichcanhtac;

  BGiongEntity({this.maloaict, this.macaytrong, this.magiong, this.tengiong, this.gionglichcanhtac});

  factory BGiongEntity.fromJson(Map<String, dynamic> json) => _$BGiongEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BGiongEntityToJson(this);
}

