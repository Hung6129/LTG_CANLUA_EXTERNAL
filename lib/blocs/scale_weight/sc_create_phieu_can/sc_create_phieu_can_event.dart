import 'package:base_project/export.dart';

abstract class ScCreatePhieuCanEvent {}

class InitEvent extends ScCreatePhieuCanEvent {}

class SelectTinhScCreatePhieuCanEvent extends ScCreatePhieuCanEvent {
  BDiaPhuongEntity tinh;
  SelectTinhScCreatePhieuCanEvent({
    required this.tinh,
  });
}

class SelectHuyenScCreatePhieuCanEvent extends ScCreatePhieuCanEvent {
  BDiaPhuongEntity huyen;
  SelectHuyenScCreatePhieuCanEvent({
    required this.huyen,
  });
}

class SelectXaScCreatePhieuCanEvent extends ScCreatePhieuCanEvent {
  BDiaPhuongEntity xa;
  SelectXaScCreatePhieuCanEvent({
    required this.xa,
  });
}

class GetTinhScCreatePhieuCanEvent extends ScCreatePhieuCanEvent {}

class GetHuyenScCreatePhieuCanEvent extends ScCreatePhieuCanEvent {
  String idTinh;
  GetHuyenScCreatePhieuCanEvent({
    required this.idTinh,
  });
}

class GetXaScCreatePhieuCanEvent extends ScCreatePhieuCanEvent {
  String idHuyen;
  GetXaScCreatePhieuCanEvent({
    required this.idHuyen,
  });
}

class CreateCreatePhieuCanEvent extends ScCreatePhieuCanEvent {
  String khuRuong, ngayCan, soPhieu, ghiChu,ngaycanstr;
  BDiaPhuongEntity tinh, huyen, xa;
  CreateCreatePhieuCanEvent({
    required this.khuRuong,
    required this.ngayCan,
    required this.soPhieu,
    required this.tinh,
    required this.huyen,
    required this.xa, 
    required this.ghiChu,
    required this.ngaycanstr,
  });
}
