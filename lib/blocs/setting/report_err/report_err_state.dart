import 'package:base_project/export.dart' as b;

class ReportErrState extends b.BaseState<ReportErrState> {
  b.BlocLoadingStatus? loadingStatus;
  String? errMessage;
  bool? isSendSuccess;

  ReportErrState(
      {this.loadingStatus, this.errMessage, this.isSendSuccess = false});

  @override
  ReportErrState copyWith({required ReportErrState stateChange}) {
    return ReportErrState(
        errMessage: stateChange.errMessage ?? errMessage,
        isSendSuccess: stateChange.isSendSuccess ?? isSendSuccess,
        loadingStatus: stateChange.loadingStatus ?? loadingStatus);
  }

  @override
  ReportErrState hideLoading(ReportErrState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ReportErrState(
            loadingStatus: b.BlocLoadingStatus.hide, isSendSuccess: false));
  }

  @override
  ReportErrState init() {
    return ReportErrState(
        errMessage: "",
        loadingStatus: b.BlocLoadingStatus.nothing,
        isSendSuccess: false);
  }

  @override
  ReportErrState loading(ReportErrState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ReportErrState(
            loadingStatus: b.BlocLoadingStatus.show, isSendSuccess: false));
  }

  ReportErrState setErr(ReportErrState stateCurrent, String err) {
    return stateCurrent.copyWith(
        stateChange: ReportErrState(errMessage: err, isSendSuccess: false));
  }

  ReportErrState setSuccess(ReportErrState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ReportErrState(isSendSuccess: true));
  }
}
