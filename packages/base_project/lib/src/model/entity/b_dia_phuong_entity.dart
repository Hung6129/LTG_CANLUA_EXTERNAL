// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'b_dia_phuong_entity.g.dart';

@JsonSerializable()
class BDiaPhuongEntity {
  String? madp;
  String? tendp;
  String? tenkhac;
  String? tentat;
  String? vungnl;
  String? mapl;
  String? dinhvi;
  String? trangthai;
  String? modifiedon;
  String? modifiedby;
  num? iden;
  String? makvfc;
  String? machinhanh;
  String? mavung;
  bool? chatbot;

  BDiaPhuongEntity(
      {this.madp,
      this.tendp,
      this.tenkhac,
      this.tentat,
      this.vungnl,
      this.mapl,
      this.dinhvi,
      this.trangthai,
      this.modifiedon,
      this.modifiedby,
      this.iden,
      this.makvfc,
      this.machinhanh,
      this.mavung,
      this.chatbot});

  factory BDiaPhuongEntity.fromJson(Map<String, dynamic> json) =>
      _$BDiaPhuongEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BDiaPhuongEntityToJson(this);

  @override
  String toString() {
    return 'BDiaPhuongEntity(madp: $madp, tendp: $tendp, tenkhac: $tenkhac, tentat: $tentat, vungnl: $vungnl, mapl: $mapl, dinhvi: $dinhvi, trangthai: $trangthai, modifiedon: $modifiedon, modifiedby: $modifiedby, iden: $iden, makvfc: $makvfc, machinhanh: $machinhanh, mavung: $mavung, chatbot: $chatbot)';
  }
}
