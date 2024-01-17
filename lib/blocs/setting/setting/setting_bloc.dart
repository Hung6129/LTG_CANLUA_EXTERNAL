// ignore: implementation_imports
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'setting_event.dart';
import 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  ICanLuaRepository canLuaRepository = di.sl();
  CLDatabase db = di.sl();
  SettingBloc() : super(SettingState().init()) {
    on<InitEvent>(_init);
    on<SyncDataSettingEvent>(_syncData);
  }

  void _init(InitEvent event, Emitter<SettingState> emit) async {
    emit(state.init());
    String username = await PrefHelper.getStringF(USERNAME),
        fullname = await PrefHelper.getStringF(FULLNAME),
        email = await PrefHelper.getStringF(EMAIL);
    LoginRepsonseModel userCurrent = LoginRepsonseModel(
        email: email, fullName: fullname, userName: username);
    emit(state.setUserCurrent(state, userCurrent));
    String version = await AppBuildHelper.getAppCurrentVersion();
    emit(state.setVersionCode(state, version));
  }

  void _syncData(SyncDataSettingEvent event, Emitter<SettingState> emit) async {
    emit(state.loading(state));
    try {
      DateTime fromDate = DateTime.now().subtract(const Duration(days: 3650));
      DateTime toDate = DateTime.now();
      String toDateStr = DateTimeHelper.getDateStrByDateTime(toDate,
          format: DateFormats.dd_MM_YYYY);
      String fromDateStr = DateTimeHelper.getDateStrByDateTime(fromDate,
          format: DateFormats.dd_MM_YYYY);

      List<SoPhieuFilterModel> spOnline = await canLuaRepository.getPhieuTuCan(
          tuNgay: fromDateStr, denNgay: toDateStr, tuCan: true);
      List<SoPhieuFilterModel> spOffline =
          await db.getTicketBetweenDate(fromDate, toDate);
      List<String> maSPOfflines = [];
      List<SoPhieuFilterModel> spOnlineNotInsertLocal = [];

      if (spOffline.isNotEmpty) {
        maSPOfflines = spOffline.map((e) => e.sophieucan!).toList();
        spOnlineNotInsertLocal = spOnline
            .where((element) => !maSPOfflines.contains(element.sophieucan))
            .toList();
      } else {
        spOnlineNotInsertLocal = spOnline;
      }

      // print(spOnlineNotInsertLocal.map((e) => e.sophieucan));
      for (var sp in spOnlineNotInsertLocal) {
        sp.isNotSync = false;
        sp.canluaList =
            await canLuaRepository.getBagRices(sp.sophieucan!, false, true);
        for (var cl in sp.canluaList!) {
          cl.isNotSync = false;
        }
      }
      await db.insertMultipleSP(spOnlineNotInsertLocal, false);
      // print('spOnline: ${spOnline.length}\n $spOnline');
      // print('\n\n');
      // print("\n-------------------------------------------\n");
      // print("spOffline2222: $spOffline");
      emit(state.hideLoading(state));
    } on ApiExceptionEntity catch (e) {
      emit(state.err(state, e.message));
      // print(e.message);
      emit(state.hideLoading(state));
    }
  }
}
