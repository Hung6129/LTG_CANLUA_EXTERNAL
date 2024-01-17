// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';

class SettingState extends BaseState<SettingState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage, versionCode;
  LoginRepsonseModel? loginRepsonseModel;
  SettingState({
    this.loadingStatus,
    this.errMessage,
    this.versionCode,
    this.loginRepsonseModel,
  });
  @override
  SettingState copyWith({required SettingState stateChange}) {
    return SettingState(
      errMessage: stateChange.errMessage ?? errMessage,
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
      versionCode: stateChange.versionCode ?? versionCode,
      loginRepsonseModel: stateChange.loginRepsonseModel ?? loginRepsonseModel,
    );
  }

  @override
  SettingState hideLoading(SettingState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: SettingState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }

  @override
  SettingState loading(SettingState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: SettingState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  SettingState init() {
    return SettingState(
      errMessage: "",
      loadingStatus: BlocLoadingStatus.nothing,
    );
  }

  SettingState err(SettingState stateCurrent, String err) {
    return stateCurrent.copyWith(stateChange: SettingState(errMessage: err));
  }

  SettingState setVersionCode(SettingState stateCurrent, String versionCode) {
    return stateCurrent.copyWith(
        stateChange: SettingState(versionCode: versionCode));
  }

  SettingState setUserCurrent(
      SettingState stateCurrent, LoginRepsonseModel loginRepsonseModel) {
    return stateCurrent.copyWith(
        stateChange: SettingState(loginRepsonseModel: loginRepsonseModel));
  }
}
