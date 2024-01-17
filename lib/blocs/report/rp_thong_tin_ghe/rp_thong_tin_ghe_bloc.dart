import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'rp_thong_tin_ghe_event.dart';
import 'rp_thong_tin_ghe_state.dart';

class RpThongTinGheBloc extends Bloc<RpThongTinGheEvent, RpThongTinGheState> {
  ICanLuaRepository canLuaRepository = di.sl();
  CLDatabase db = di.sl();
  RpThongTinGheBloc() : super(RpThongTinGheState().init()) {
    on<InitEvent>(_init);
    on<UpdateRpThongTinGheEvent>(_update);
  }

  void _init(InitEvent event, Emitter<RpThongTinGheState> emit) async {
    emit(state.init());
  }

  void _update(
      UpdateRpThongTinGheEvent event, Emitter<RpThongTinGheState> emit) async {
    emit(state.loading(state));
    try {
      SoPhieuFilterModel? sp = await db.updateThongTinGHETicket(event.sophieu);

      emit(state.hideLoading(state));
      if (sp != null) {
        canLuaRepository.updateGhePhieuCan(event.sophieu);
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
