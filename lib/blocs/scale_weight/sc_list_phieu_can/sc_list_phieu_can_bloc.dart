import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'sc_list_phieu_can_event.dart';
import 'sc_list_phieu_can_state.dart';

class ScListPhieuCanBloc
    extends Bloc<ScListPhieuCanEvent, ScListPhieuCanState> {
  final ICanLuaRepository canLuaRepository = di.sl();
  final CLDatabase _db = di.sl();
  ScListPhieuCanBloc() : super(ScListPhieuCanState().init()) {
    on<InitScListPhieuCanState>(_init);
    on<LoadDataScListPhieuCanEvent>(_loadData);
  }

  void _init(
      InitScListPhieuCanState event, Emitter<ScListPhieuCanState> emit) async {
    emit(state.init());
  }

  void _loadData(LoadDataScListPhieuCanEvent event,
      Emitter<ScListPhieuCanState> emit) async {
    emit(state.loading(state));
    // Log.debug("ScListPhieuCanBloc", "_loadData");
    try { 
      var result = await _db.getLastTicket();
      Log.debug("_loadData", result);
      emit(state.setSoPhieu(state, result));
      emit(state.hideLoading(state));
    } catch (e) {
      // Log.debug("_loadData", e);
      emit(state.hideLoading(state));
      // emit(state.setErr(state, e.message));
    }
  }
}
