// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';

class HomeState extends BaseState<HomeState> {
  BlocLoadingStatus? loadingStatus;
  int? indexTab;
  String? err;
  //!use in tab report
  bool? isAutoFilterReport;

  HomeState({
    this.loadingStatus,
    this.indexTab,
    this.isAutoFilterReport,
    this.err,
  });

  @override
  HomeState copyWith({required HomeState stateChange}) {
    return HomeState(
        loadingStatus: stateChange.loadingStatus ?? loadingStatus,
        indexTab: stateChange.indexTab ?? indexTab,
        isAutoFilterReport:
            stateChange.isAutoFilterReport ?? isAutoFilterReport,
        err: stateChange.err ?? err);
  }

  @override
  HomeState hideLoading(HomeState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: HomeState(loadingStatus: BlocLoadingStatus.hide, err: ""));
  }

  @override
  HomeState init() {
    return HomeState(
      loadingStatus: BlocLoadingStatus.nothing,
      err: "",
      indexTab: 0,
    );
  }

  @override
  HomeState loading(HomeState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: HomeState(loadingStatus: BlocLoadingStatus.show, err: ""));
  }

  HomeState setErr({required HomeState state, required String err}) {
    return state.copyWith(stateChange: HomeState(err: err));
  }

  HomeState setIndexTab({required HomeState state, required int index}) {
    return state.copyWith(stateChange: HomeState(indexTab: index, err: ""));
  }

  HomeState setAutoLoadReport(
      {required HomeState state, required bool isAutoFilterReport}) {
    return state.copyWith(
        stateChange:
            HomeState(isAutoFilterReport: isAutoFilterReport, err: ""));
  }
}
