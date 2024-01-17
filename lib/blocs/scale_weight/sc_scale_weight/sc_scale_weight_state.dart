import 'package:base_project/export.dart';

import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';

class ScScaleWeightState implements BaseState<ScScaleWeightState> {
  List<BagRiceEntity>? bags;
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  double? weight;
  bool? isCloseSuccess;
  bool? isShowInputBottom;
  bool? isScrollBottom;
  ScScaleWeightState({
    this.bags,
    this.loadingStatus,
    this.errMessage,
    this.weight,
    this.isCloseSuccess,
    this.isScrollBottom,
    this.isShowInputBottom,
  });
  @override
  ScScaleWeightState copyWith({required ScScaleWeightState stateChange}) {
    return ScScaleWeightState(
        errMessage: stateChange.errMessage ?? errMessage,
        loadingStatus: stateChange.loadingStatus ?? loadingStatus,
        weight: stateChange.weight ?? weight,
        isCloseSuccess: stateChange.isCloseSuccess ?? isCloseSuccess,
        isShowInputBottom: stateChange.isShowInputBottom ?? isShowInputBottom,
        isScrollBottom: stateChange.isScrollBottom ?? isScrollBottom,
        bags: stateChange.bags ?? bags);
  }

  @override
  ScScaleWeightState init() {
    return ScScaleWeightState(
        bags: [],
        errMessage: "",
        isCloseSuccess: false,
        isScrollBottom: false,
        isShowInputBottom: false,
        loadingStatus: BlocLoadingStatus.nothing);
  }

  @override
  ScScaleWeightState hideLoading(ScScaleWeightState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ScScaleWeightState(
            loadingStatus: BlocLoadingStatus.hide,
            isScrollBottom: false,
            isCloseSuccess: false,
            errMessage: ""));
  }

  @override
  ScScaleWeightState loading(ScScaleWeightState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ScScaleWeightState(
            loadingStatus: BlocLoadingStatus.show,
            isScrollBottom: false,
            isCloseSuccess: false,
            errMessage: ""));
  }

  ScScaleWeightState setErr(ScScaleWeightState stateCurrent, String err) {
    return stateCurrent.copyWith(
        stateChange: ScScaleWeightState(
      errMessage: err,
      isCloseSuccess: false,
      isScrollBottom: false,
    ));
  }

  ScScaleWeightState setBags(
      ScScaleWeightState stateCurrent, List<BagRiceEntity> bags) {
    return stateCurrent.copyWith(
        stateChange: ScScaleWeightState(
      bags: bags,
      errMessage: "",
      isScrollBottom: true,
      isCloseSuccess: false,
    ));
  }

  ScScaleWeightState setWeight(ScScaleWeightState state, double? weight) {
    return state.copyWith(
        stateChange: ScScaleWeightState(weight: weight, isCloseSuccess: false));
  }

  ScScaleWeightState setShowInputBottom(ScScaleWeightState state) {
    return state.copyWith(
        stateChange: ScScaleWeightState(
            weight: weight,
            isShowInputBottom: !isShowInputBottom!,
            isScrollBottom: true));
  }

  ScScaleWeightState setScrollBottom(ScScaleWeightState state) {
    return state.copyWith(
        stateChange: ScScaleWeightState(weight: weight, isScrollBottom: true));
  }
}
