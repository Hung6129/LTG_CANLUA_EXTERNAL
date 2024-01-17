import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';

abstract class RpThongTinPhieuCanEvent {}

class InitEvent extends RpThongTinPhieuCanEvent {}

class UpdateRpThongTinPhieuCanEvent extends RpThongTinPhieuCanEvent {
  SoPhieuFilterModel sophieu;
  UpdateRpThongTinPhieuCanEvent({
    required this.sophieu,
  });
}
