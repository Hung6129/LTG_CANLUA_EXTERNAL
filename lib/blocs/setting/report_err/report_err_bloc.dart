import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'report_err_event.dart';
import 'report_err_state.dart';

class ReportErrBloc extends Bloc<ReportErrEvent, ReportErrState> {
  // IScaleWeightRepository scaleWeightRepository = di.sl();
  ICanLuaRepository canLuaRepository = di.sl();
  ReportErrBloc() : super(ReportErrState().init()) {
    on<InitEvent>(_init);
    on<SendReportErrEvent>(_sendErr);
  }

  void _init(InitEvent event, Emitter<ReportErrState> emit) async {
    emit(state.init());
  }

  void _sendErr(SendReportErrEvent event, Emitter<ReportErrState> emit) async {
    emit(state.loading(state));
    try {
      bool isSuccess = await canLuaRepository.feedBack(event.content);

      emit(state.hideLoading(state));
      if (isSuccess) {
        emit(state.setSuccess(state));
      } else {
        emit(state.setErr(state, "Đã có lỗi cân. Vui lòng thử lại !!"));
      }
    } on ApiExceptionEntity catch (e) {
      emit(state.setErr(state, e.message));
      emit(state.hideLoading(state));
    }
  }
}
