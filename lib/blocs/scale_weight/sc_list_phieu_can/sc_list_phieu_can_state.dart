import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';

class ScListPhieuCanState extends BaseState<ScListPhieuCanState> {
  BlocLoadingStatus? loadingStatus;
  String? errMessage;
  SoPhieuFilterModel? soPhieu;
  ScListPhieuCanState({
    this.loadingStatus,
    this.errMessage,
    this.soPhieu,
  });
  @override
  ScListPhieuCanState hideLoading(ScListPhieuCanState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange: ScListPhieuCanState(
      loadingStatus: BlocLoadingStatus.hide,
      errMessage: "",
    ));
  }

  @override
  ScListPhieuCanState loading(ScListPhieuCanState stateCurrent) {
    return stateCurrent.copyWith(
        stateChange:
            ScListPhieuCanState(loadingStatus: BlocLoadingStatus.show));
  }

  @override
  ScListPhieuCanState init() {
    return ScListPhieuCanState(
      loadingStatus: BlocLoadingStatus.nothing,
      errMessage: "",
    );
  }

  @override
  ScListPhieuCanState copyWith({required ScListPhieuCanState stateChange}) {
    return ScListPhieuCanState(
      loadingStatus: stateChange.loadingStatus ?? loadingStatus,
      errMessage: stateChange.errMessage ?? errMessage,
      soPhieu: stateChange.soPhieu ?? soPhieu,
    );
  }

  ScListPhieuCanState err(ScListPhieuCanState stateCurrent, String err) {
    return stateCurrent.copyWith(
        stateChange: ScListPhieuCanState(errMessage: err));
  }

  ScListPhieuCanState setSoPhieu(
      ScListPhieuCanState stateCurrent, SoPhieuFilterModel soPhieu) {
    return stateCurrent.copyWith(
        stateChange: ScListPhieuCanState(soPhieu: soPhieu, errMessage: ""));
  }
}
