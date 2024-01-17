import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;

import 'rp_filter_event.dart';
import 'rp_filter_state.dart';

class RpFilterBloc extends Bloc<RpFilterEvent, RpFilterState> {
  ICanLuaRepository canLuaRepository = di.sl();
  CLDatabase db = di.sl();
  RpFilterBloc() : super(RpFilterState().init()) {
    on<InitEvent>(_init);
    on<LoadDataRpFilterEvent>(_loadData);
  }

  void _init(InitEvent event, Emitter<RpFilterState> emit) async {
    emit(state.init());
  }

  void _loadData(
      LoadDataRpFilterEvent event, Emitter<RpFilterState> emit) async {
    emit(state.setErr(state, ""));
    emit(state.loading(state));
    try {
      List<SoPhieuFilterModel> sp = [];
      if (event.tuCan) {
        // print(event.formDate);
        // print(DateTimeHelper.getDate(event.formDate,
        //     format: DateFormats.dd_MM_YYYY));
        sp = await db.getTicketBetweenDate(
            DateTimeHelper.getDate(event.formDate,
                format: DateFormats.dd_MM_YYYY),
            DateTimeHelper.getDate(event.toDate,
                format: DateFormats.dd_MM_YYYY));
    
        //* cập nhật thông tin chung của phiếu cân (tính toán tổng sl v.v..)
        for (var element in sp) {
          element = (await db.updateThongTinChungTicket(element))!;
        }

      } else {
        sp = await canLuaRepository.getPhieuTuCan(
            denNgay: event.toDate, tuNgay: event.formDate, tuCan: event.tuCan);
      }

      emit(state.hideLoading(state));
      emit(state.setSoPhieu(state, sp));
    } on ApiExceptionEntity catch (e) {
      emit(state.hideLoading(state));
      emit(state.setErr(state, e.message));
    }
  }
}
