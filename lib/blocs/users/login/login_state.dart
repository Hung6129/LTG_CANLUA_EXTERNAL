// ignore: implementation_imports
import 'package:base_project/src/base_project.dart';

class LoginState extends BaseState<LoginState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  bool? hidePassword;
  bool? isSuccess;
  String? username, password;
  LoginState(
      {this.loadingStatus,
      this.errMessage,
      this.hidePassword,
      this.isSuccess,
      this.password,
      this.username});

  @override
  LoginState hideLoading(LoginState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: LoginState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }

  @override
  LoginState loading(LoginState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: LoginState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  LoginState init() {
    return LoginState(
        loadingStatus: BlocLoadingStatus.nothing,
        errMessage: "",
        isSuccess: false,
        hidePassword: true);
  }

  @override
  LoginState copyWith({required LoginState stateChange}) {
    return LoginState(
        loadingStatus: stateChange.loadingStatus ?? loadingStatus,
        errMessage: stateChange.errMessage ?? errMessage,
        isSuccess: stateChange.isSuccess ?? isSuccess,
        username: stateChange.username ?? username,
        password: stateChange.password ?? password,
        hidePassword: stateChange.hidePassword ?? hidePassword);
  }

  LoginState showHidePassword(
      LoginState stateCurrent, bool isShowHidePassword) {
    return stateCurrent.copyWith(
        stateChange: LoginState(
      hidePassword: isShowHidePassword,
      errMessage: "",
    ));
  }

  LoginState err(LoginState stateCurrent, String err) {
    return stateCurrent.copyWith(stateChange: LoginState(errMessage: err));
  }

  LoginState setUserPass(LoginState state, String user, String pass) {
    return state.copyWith(
        stateChange: LoginState(username: user, password: pass));
  }

  LoginState successLolgin(LoginState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: LoginState(
      isSuccess: true,
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }
}
