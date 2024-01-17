import 'package:base_project/export.dart';

class RpThongTinGheState extends BaseState<RpThongTinGheState> {
 BlocLoadingStatus? loadingStatus;
  String? errMessage;
  bool? isSuccess;
  RpThongTinGheState({
    this.loadingStatus,
    this.errMessage,
    this.isSuccess,
  });
  @override
  RpThongTinGheState copyWith(
      {required RpThongTinGheState stateChange}) {
    return RpThongTinGheState(
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
      errMessage: stateChange.errMessage ?? errMessage,
      isSuccess: stateChange.isSuccess ?? isSuccess,
    );
  }

  @override
  RpThongTinGheState hideLoading(RpThongTinGheState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpThongTinGheState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
      isSuccess: false,
    ));
  }

  @override
  RpThongTinGheState loading(RpThongTinGheState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpThongTinGheState(
      loadingStatus: BlocLoadingStatus.show,
      errMessage: "",
      isSuccess: false,
    ));
  }

  @override
  RpThongTinGheState init() {
    return RpThongTinGheState(
      errMessage: "",
      loadingStatus: BlocLoadingStatus.nothing,
      isSuccess: false,
    );
  }

  RpThongTinGheState setErr(
      RpThongTinGheState stateCurrent, String err) {
    return stateCurrent.copyWith(
        stateChange:
            RpThongTinGheState(isSuccess: false, errMessage: err));
  }

  RpThongTinGheState updateSuccess(RpThongTinGheState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpThongTinGheState(
      isSuccess: true,
    ));
  }
}
