import 'package:base_project/export.dart';

class RpThongTinPhieuCanState extends BaseState<RpThongTinPhieuCanState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  bool? isSuccess;
  RpThongTinPhieuCanState({
    this.loadingStatus,
    this.errMessage,
    this.isSuccess,
  });
  @override
  RpThongTinPhieuCanState copyWith(
      {required RpThongTinPhieuCanState stateChange}) {
    return RpThongTinPhieuCanState(
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
      errMessage: stateChange.errMessage ?? errMessage,
      isSuccess: stateChange.isSuccess ?? isSuccess,
    );
  }

  @override
  RpThongTinPhieuCanState hideLoading(RpThongTinPhieuCanState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpThongTinPhieuCanState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
      isSuccess: false,
    ));
  }

  @override
  RpThongTinPhieuCanState loading(RpThongTinPhieuCanState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpThongTinPhieuCanState(
      loadingStatus: BlocLoadingStatus.show,
      errMessage: "",
      isSuccess: false,
    ));
  }

  @override
  RpThongTinPhieuCanState init() {
    return RpThongTinPhieuCanState(
      errMessage: "",
      loadingStatus: BlocLoadingStatus.nothing,
      isSuccess: false,
    );
  }

  RpThongTinPhieuCanState setErr(
      RpThongTinPhieuCanState stateCurrent, String err) {
    return stateCurrent.copyWith(
        stateChange:
            RpThongTinPhieuCanState(isSuccess: false, errMessage: err));
  }

  RpThongTinPhieuCanState updateSuccess(RpThongTinPhieuCanState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpThongTinPhieuCanState(
      isSuccess: true,
    ));
  }
}
