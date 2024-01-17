import 'package:base_project/export.dart';

abstract class RegisterEvent {}

class InitEvent extends RegisterEvent {}

class ShowHidePassRegisterEvent extends RegisterEvent {}

class ShowHideRePassRegisterEvent extends RegisterEvent {}

class SelectTinhRegisterEvent extends RegisterEvent {
  BDiaPhuongEntity tinh;
  SelectTinhRegisterEvent({
    required this.tinh,
  });
}

class SelectHuyenRegisterEvent extends RegisterEvent {
  BDiaPhuongEntity huyen;
  SelectHuyenRegisterEvent({
    required this.huyen,
  });
}

class SelectXaRegisterEvent extends RegisterEvent {
  BDiaPhuongEntity xa;
  SelectXaRegisterEvent({
    required this.xa,
  });
}

class GetTinhRegisterEvent extends RegisterEvent {}

class GetHuyenRegisterEvent extends RegisterEvent {
  String idTinh;
  GetHuyenRegisterEvent({
    required this.idTinh,
  });
}
class GetXaRegisterEvent extends RegisterEvent {
  String idHuyen;
  GetXaRegisterEvent({
    required this.idHuyen,
  });
}
