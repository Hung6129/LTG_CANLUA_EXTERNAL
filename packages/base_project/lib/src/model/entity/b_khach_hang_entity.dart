import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'b_khach_hang_entity.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class BKhachHangEntity extends Equatable {
  String? makhach;
  String? tenkhach;

  BKhachHangEntity({this.makhach, this.tenkhach});

  factory BKhachHangEntity.fromJson(Map<String, dynamic> json) =>
      _$BKhachHangEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BKhachHangEntityToJson(this);

  @override 
  List<Object?> get props => [makhach];
}
