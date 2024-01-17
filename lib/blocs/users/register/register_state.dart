import 'package:base_project/export.dart';

class RegisterState extends BaseState<RegisterState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  bool? hidePassword;
  bool? hideRePassword;
  List<BDiaPhuongEntity>? lstTinh;
  BDiaPhuongEntity? tinhSelected;
  List<BDiaPhuongEntity>? lstHuyen;
  BDiaPhuongEntity? huyenSelected;
  List<BDiaPhuongEntity>? lstXa;
  BDiaPhuongEntity? xaSelected;
  RegisterState({
    this.loadingStatus,
    this.errMessage,
    this.hidePassword,
    this.hideRePassword,
    this.lstHuyen,
    this.lstTinh,
    this.lstXa,
    this.huyenSelected,
    this.tinhSelected,
    this.xaSelected,
  });
  @override
  RegisterState hideLoading(RegisterState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }

  @override
  RegisterState loading(RegisterState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  RegisterState init() {
    return RegisterState(
        loadingStatus: BlocLoadingStatus.nothing,
        errMessage: "",
        lstHuyen: [],
        lstTinh: [],
        lstXa: [],
        huyenSelected: null,
        xaSelected: null,
        tinhSelected: null,
        hidePassword: true,
        hideRePassword: true);
  }

  @override
  RegisterState copyWith({required RegisterState stateChange}) {
    return RegisterState(
        loadingStatus: stateChange.loadingStatus ?? loadingStatus,
        errMessage: stateChange.errMessage ?? errMessage,
        hideRePassword: stateChange.hideRePassword ?? hideRePassword,
        huyenSelected: stateChange.huyenSelected ?? huyenSelected,
        lstHuyen: stateChange.lstHuyen ?? lstHuyen,
        lstTinh: stateChange.lstTinh ?? lstTinh,
        lstXa: stateChange.lstXa ?? lstXa,
        tinhSelected: stateChange.tinhSelected ?? tinhSelected,
        xaSelected: stateChange.xaSelected ?? xaSelected,
        hidePassword: stateChange.hidePassword ?? hidePassword);
  }

  RegisterState showHidePassword(
      RegisterState stateCurrent, bool isShowHidePassword) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(
      hidePassword: isShowHidePassword,
      errMessage: "",
    ));
  }

  RegisterState showHideRePassword(
      RegisterState stateCurrent, bool isShowHideRePassword) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(
      hideRePassword: isShowHideRePassword,
      errMessage: "",
    ));
  }

  RegisterState err(RegisterState stateCurrent, String err) {
    return stateCurrent.copyWith(stateChange: RegisterState(errMessage: err));
  }

  RegisterState setLstTinh(
      RegisterState stateCurrent, List<BDiaPhuongEntity> tinhs) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(lstTinh: tinhs, errMessage: ""));
  }

  RegisterState setLstHuyen(
      RegisterState stateCurrent, List<BDiaPhuongEntity> huyens) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(lstHuyen: huyens, errMessage: ""));
  }

  RegisterState setLstXa(
      RegisterState stateCurrent, List<BDiaPhuongEntity> xas) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(lstXa: xas, errMessage: ""));
  }

  RegisterState selectTinh(RegisterState stateCurrent, BDiaPhuongEntity tinh) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(tinhSelected: tinh, errMessage: ""));
  }

  RegisterState selectHuyen(
      RegisterState stateCurrent, BDiaPhuongEntity huyen) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(huyenSelected: huyen, errMessage: ""));
  }

  RegisterState selectXa(RegisterState stateCurrent, BDiaPhuongEntity xa) {
    return stateCurrent.copyWith(
        stateChange: RegisterState(xaSelected: xa, errMessage: ""));
  }
}
