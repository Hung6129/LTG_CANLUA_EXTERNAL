import 'package:base_project/export.dart';

abstract class SmsOTBEvent {}

class InitEvent extends SmsOTBEvent {} 

class SubmitSmsOTBEvent extends SmsOTBEvent {
  String sodienthoai;
  String matkhau;
  String hoten;
  BDiaPhuongEntity tinh;
  BDiaPhuongEntity huyen;
  BDiaPhuongEntity xa;
  SubmitSmsOTBEvent({
    required this.sodienthoai,
    required this.matkhau,
    required this.hoten,
    required this.tinh,
    required this.huyen,
    required this.xa,
  });
}
