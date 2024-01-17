// ignore_for_file: avoid_renaming_method_parameters

import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';

class ScCreatePhieuCanState extends BaseState<ScCreatePhieuCanState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  List<BDiaPhuongEntity>? lstTinh;
  BDiaPhuongEntity? tinhSelected;
  List<BDiaPhuongEntity>? lstHuyen;
  BDiaPhuongEntity? huyenSelected;
  List<BDiaPhuongEntity>? lstXa;
  BDiaPhuongEntity? xaSelected;
  SoPhieuFilterModel? soPhieu;
  bool? isSuccess;
  ScCreatePhieuCanState({
    this.loadingStatus,
    this.errMessage,
    this.lstHuyen,
    this.lstTinh,
    this.lstXa,
    this.huyenSelected,
    this.tinhSelected,
    this.xaSelected,
    this.soPhieu,
    this.isSuccess,
  });
  @override
  ScCreatePhieuCanState hideLoading(ScCreatePhieuCanState state) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
      isSuccess: false,
    ));
  }

  @override
  ScCreatePhieuCanState loading(ScCreatePhieuCanState state) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(
            loadingStatus: BlocLoadingStatus.show,
            isSuccess: false,
            errMessage: ""));
  }

  @override
  ScCreatePhieuCanState init() {
    return ScCreatePhieuCanState(
        loadingStatus: BlocLoadingStatus.nothing,
        errMessage: "",
        lstHuyen: [],
        lstTinh: [],
        lstXa: [],
        huyenSelected: null,
        xaSelected: null,
        isSuccess: false,
        tinhSelected: null);
  }

  @override
  ScCreatePhieuCanState copyWith({required ScCreatePhieuCanState stateChange}) {
    return ScCreatePhieuCanState(
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
      errMessage: stateChange.errMessage ?? errMessage,
      huyenSelected: stateChange.huyenSelected ?? huyenSelected,
      lstHuyen: stateChange.lstHuyen ?? lstHuyen,
      lstTinh: stateChange.lstTinh ?? lstTinh,
      lstXa: stateChange.lstXa ?? lstXa,
      tinhSelected: stateChange.tinhSelected ?? tinhSelected,
      xaSelected: stateChange.xaSelected ?? xaSelected,
      soPhieu: stateChange.soPhieu ?? soPhieu,
      isSuccess: stateChange.isSuccess ?? isSuccess,
    );
  }

  ScCreatePhieuCanState err(ScCreatePhieuCanState state, String err) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(
      errMessage: err,
      isSuccess: false,
    ));
  }

  ScCreatePhieuCanState setLstTinh(
      ScCreatePhieuCanState state, List<BDiaPhuongEntity> tinhs) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(lstTinh: tinhs, errMessage: ""));
  }

  ScCreatePhieuCanState setLstHuyen(
      ScCreatePhieuCanState state, List<BDiaPhuongEntity> huyens) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(lstHuyen: huyens, errMessage: ""));
  }

  ScCreatePhieuCanState setLstXa(
      ScCreatePhieuCanState state, List<BDiaPhuongEntity> xas) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(lstXa: xas, errMessage: ""));
  }

  ScCreatePhieuCanState selectTinh(
      ScCreatePhieuCanState state, BDiaPhuongEntity tinh) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(tinhSelected: tinh, errMessage: ""));
  }

  ScCreatePhieuCanState selectHuyen(
      ScCreatePhieuCanState state, BDiaPhuongEntity huyen) {
    return state.copyWith(
        stateChange:
            ScCreatePhieuCanState(huyenSelected: huyen, errMessage: ""));
  }

  ScCreatePhieuCanState selectXa(
      ScCreatePhieuCanState state, BDiaPhuongEntity xa) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(xaSelected: xa, errMessage: ""));
  }

  ScCreatePhieuCanState setSoPhieu(
      ScCreatePhieuCanState state, SoPhieuFilterModel soPhieu) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(soPhieu: soPhieu, errMessage: ""));
  }

  ScCreatePhieuCanState setSuccess(ScCreatePhieuCanState state) {
    return state.copyWith(
        stateChange: ScCreatePhieuCanState(isSuccess: true, errMessage: ""));
  }
}
