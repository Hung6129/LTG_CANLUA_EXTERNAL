// ignore_for_file: non_constant_identifier_names, must_be_immutable
// ignore_for_file: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'b_htx_entity.g.dart';

@JsonSerializable()
class BHtxEntity extends Equatable {
  String? mahtx_tht;
  String? tenhtx_tht;

  BHtxEntity({this.mahtx_tht, this.tenhtx_tht});

  factory BHtxEntity.fromJson(Map<String, dynamic> json) =>
      _$BHtxEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BHtxEntityToJson(this);

  @override 
  List<Object?> get props => [mahtx_tht];
}
