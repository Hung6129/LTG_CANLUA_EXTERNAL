import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'rp_thong_tin_phieu_can_event.dart';
import 'rp_thong_tin_phieu_can_state.dart';

class RpThongTinPhieuCanBloc
    extends Bloc<RpThongTinPhieuCanEvent, RpThongTinPhieuCanState> {
  ICanLuaRepository canLuaRepository = di.sl();
  CLDatabase db = di.sl();
  RpThongTinPhieuCanBloc() : super(RpThongTinPhieuCanState().init()) {
    on<InitEvent>(_init);
    on<UpdateRpThongTinPhieuCanEvent>(_update);
  }

  void _init(InitEvent event, Emitter<RpThongTinPhieuCanState> emit) async {
    emit(state.init());
  }

  void _update(UpdateRpThongTinPhieuCanEvent event,
      Emitter<RpThongTinPhieuCanState> emit) async {
    emit(state.loading(state));
    try {
      SoPhieuFilterModel? sp =
          await db.updateThongTinChungTicket(event.sophieu);

      emit(state.hideLoading(state));

      if (sp != null) {
        canLuaRepository.updatePhieuCan(event.sophieu);
        emit(state.updateSuccess(state));
      } else {
        emit(state.setErr(state, "Đã có lỗi vui lòng thử lai."));
      }
    } on ApiExceptionEntity catch (e) {
      emit(state.setErr(state, e.message));
      emit(state.hideLoading(state));
    }
  }
}
