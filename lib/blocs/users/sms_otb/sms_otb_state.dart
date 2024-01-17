import 'package:base_project/export.dart';

class SmsOTBState extends BaseState<SmsOTBState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage, verificationId;
  bool? isSentOTB;
  bool? isSuccess;
  SmsOTBState(
      {this.loadingStatus,
      this.errMessage,
      this.isSuccess,
      this.isSentOTB,
      this.verificationId});

  @override
  SmsOTBState copyWith({required SmsOTBState stateChange}) {
    return SmsOTBState(
      isSuccess: stateChange.isSuccess ?? isSuccess,
      isSentOTB: stateChange.isSentOTB ?? isSentOTB,
      errMessage: stateChange.errMessage ?? errMessage,
      verificationId: stateChange.verificationId ?? verificationId,
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
    );
  }

  @override
  SmsOTBState hideLoading(SmsOTBState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: SmsOTBState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }

  @override
  SmsOTBState loading(SmsOTBState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: SmsOTBState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  SmsOTBState init() {
    return SmsOTBState(
        errMessage: "",
        loadingStatus: BlocLoadingStatus.nothing,
        isSentOTB: false,
        verificationId: "",
        isSuccess: false);
  }

  SmsOTBState setErr(SmsOTBState stateCurrent, String err) {
    return stateCurrent.copyWith(stateChange: SmsOTBState(errMessage: err));
  }

  SmsOTBState setRegisterSuccess(SmsOTBState stateCurrent) {
    return stateCurrent.copyWith(stateChange: SmsOTBState(isSuccess: true));
  }

  SmsOTBState sentOTB(SmsOTBState stateCurrent, String verificationId) {
    return stateCurrent.copyWith(
        stateChange:
            SmsOTBState(isSentOTB: true, verificationId: verificationId));
  }
}
