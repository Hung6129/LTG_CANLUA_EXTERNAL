import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';

abstract class RpThongTinGheEvent {}

class InitEvent extends RpThongTinGheEvent {}

class UpdateRpThongTinGheEvent extends RpThongTinGheEvent {
  SoPhieuFilterModel sophieu;
  UpdateRpThongTinGheEvent({
    required this.sophieu,
  });
}
