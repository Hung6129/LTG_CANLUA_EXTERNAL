import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';

class RpFilterState extends BaseState<RpFilterState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  List<SoPhieuFilterModel>? soPhieus;
  RpFilterState({
    this.loadingStatus,
    this.errMessage,
    this.soPhieus,
  });
  @override
  RpFilterState copyWith({required RpFilterState stateChange}) {
    return RpFilterState(
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
      soPhieus: stateChange.soPhieus ?? soPhieus,
      errMessage: stateChange.errMessage ?? errMessage,
    );
  }

  @override
  RpFilterState hideLoading(RpFilterState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpFilterState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }

  @override
  RpFilterState loading(RpFilterState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: RpFilterState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  RpFilterState init() {
    return RpFilterState(
      errMessage: "",
      loadingStatus: BlocLoadingStatus.nothing,
    );
  }

  RpFilterState setErr(RpFilterState stateCurrent, String err) {
    return stateCurrent.copyWith(stateChange: RpFilterState(errMessage: err));
  }

  RpFilterState setSoPhieu(
      RpFilterState stateCurrent, List<SoPhieuFilterModel> soPhieus) {
    return stateCurrent.copyWith(
        stateChange: RpFilterState(soPhieus: soPhieus));
  }
}
