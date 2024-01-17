// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart'; 
class SplashScreenState extends BaseState<SplashScreenState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  SplashScreenRedirect? redirect;
  SplashScreenState({this.loadingStatus, this.errMessage, this.redirect});

  @override
  SplashScreenState hideLoading(SplashScreenState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: SplashScreenState(loadingStatus: BlocLoadingStatus.hide));
  }

  @override
  SplashScreenState loading(SplashScreenState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: SplashScreenState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  SplashScreenState init() {
    return SplashScreenState(
        loadingStatus: BlocLoadingStatus.nothing,
        errMessage: "",
        redirect: SplashScreenRedirect.noThing);
  }

  @override
  SplashScreenState copyWith({required SplashScreenState stateChange}) {
    return SplashScreenState(
        loadingStatus: stateChange.loadingStatus ?? loadingStatus,
        errMessage: stateChange.errMessage ?? errMessage,
        redirect: stateChange.redirect ?? redirect);
  }

  SplashScreenState setRedirect(
      SplashScreenState state, SplashScreenRedirect redirect) {
    return state.copyWith(stateChange: SplashScreenState(redirect: redirect));
  }
}
