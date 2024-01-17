import 'package:base_project/export.dart';

class ForgetPasswordState extends BaseState<ForgetPasswordState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  bool? hidePassword1, hidePassword2;
  bool? isSuccess;
  ForgetPasswordState({
    this.loadingStatus,
    this.errMessage,
    this.hidePassword1,
    this.hidePassword2,
    this.isSuccess,
  });

  @override
  ForgetPasswordState hideLoading(ForgetPasswordState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ForgetPasswordState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }

  @override
  ForgetPasswordState loading(ForgetPasswordState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange:
            ForgetPasswordState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  ForgetPasswordState init() {
    return ForgetPasswordState(
      loadingStatus: BlocLoadingStatus.nothing,
      errMessage: "",
      isSuccess: false,
      hidePassword1: true,
      hidePassword2: true,
    );
  }

  @override
  ForgetPasswordState copyWith({required ForgetPasswordState stateChange}) {
    return ForgetPasswordState(
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
      errMessage: stateChange.errMessage ?? errMessage,
      isSuccess: stateChange.isSuccess ?? isSuccess,
      hidePassword1: stateChange.hidePassword1 ?? hidePassword1,
      hidePassword2: stateChange.hidePassword2 ?? hidePassword2,
    );
  }

  ForgetPasswordState showHidePassword1(
      ForgetPasswordState stateCurrent, bool isShowHidePassword) {
    return stateCurrent.copyWith(
        stateChange: ForgetPasswordState(
      hidePassword1: isShowHidePassword,
      errMessage: "",
    ));
  }

  ForgetPasswordState showHidePassword2(
      ForgetPasswordState stateCurrent, bool isShowHidePassword) {
    return stateCurrent.copyWith(
        stateChange: ForgetPasswordState(
      hidePassword2: isShowHidePassword,
      errMessage: "",
    ));
  }

  ForgetPasswordState err(ForgetPasswordState stateCurrent, String err) {
    return stateCurrent.copyWith(
        stateChange: ForgetPasswordState(errMessage: err));
  }

  ForgetPasswordState success(ForgetPasswordState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ForgetPasswordState(
      isSuccess: true,
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }
}
