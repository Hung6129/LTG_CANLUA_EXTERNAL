import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/constants/loctroi_helper.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/scale_weight_request_model.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';

import 'splash_screen_event.dart';
import 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  IBMasterDataRepository makeDealRepository = di.sl();
  ICanLuaRepository canLuaRepository = di.sl();
  IBCustomerRepository customerRepository = di.sl();
  IBLoginRepository loginRepository = di.sl();
  CLDatabase db = di.sl();
  SplashScreenBloc({SplashScreenState? state})
      : super(state ?? SplashScreenState().init()) {
    on<InitSplashScreenEvent>(_initEvent);
    on<LoadDataSplashScreenEvent>(_loadData);
    on<SyncDataSplashScreenEvent>(_syncData);
  }

  _initEvent(
      InitSplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    emit(state.init());
  }

  //! đồng bộ data offline lên server
  _syncData(
      SyncDataSplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    List<SoPhieuFilterModel> spNeedSync = await db.getLstSpNotSync();
    List<BagRiceEntity> bagNeedSync = await db.getBagRicesNotSync();
    List<BagRicesEntryDelete> bagNeedDel = await db.getBagRicesDelete();
    List<ScaleWeightRequestModel> requestSvaeBagRices = [];
    Log.info("SplashScreenBloc._syncData",
        "spNeedSync:${spNeedSync.length} bagNeedSync:${bagNeedSync.length} bagNeedDel:${bagNeedDel.length}");
    if (bagNeedSync.isNotEmpty || spNeedSync.isNotEmpty) {
      if (bagNeedSync.isNotEmpty) {
        requestSvaeBagRices = bagNeedSync
            .map((e) => ScaleWeightRequestModel(
                id_canlua: e.id_canlua,
                soPhieuCan: e.sophieucan!,
                idLocalDB: e.idLocalDB,
                data: [DataBean(weight: double.tryParse('${e.weight}') ?? 0)]))
            .toList();
      }
      //* sync data insert thiếu
      canLuaRepository.syncData(spNeedSync, requestSvaeBagRices);
    }
    //* delete data
    if (bagNeedDel.isNotEmpty) {
      List<String> soPhieuCans =
          bagNeedDel.map((e) => e.sophieucan).toSet().toList();

      for (var e in soPhieuCans) {
        List<num> idBagDel = bagNeedDel
            .where((element) => element.sophieucan == e)
            .map((e) => e.idOnlineBaoLua ?? 0)
            .toSet()
            .toList();
        idBagDel.removeWhere((element) => element == 0);
        String idCanlua = bagNeedDel
            .where((element) => element.sophieucan == e)
            .map((e) => e.idCanLua)
            .first;

        if (idBagDel.isNotEmpty) {
          Log.info("SyncDataSplashScreenEvent.canLuaRepository.delCanLua",
              "$idBagDel, $e, $idCanlua");
          canLuaRepository.delCanLua(idBagDel, e, idCanlua).then((value) {
            //* lấy ra danh sách id local db các bao lúa để gọi del khi sync thành công
            List<int> idLocalBagriceDel = bagNeedDel
                .where((element) => element.sophieucan == e)
                .map((e) => e.id)
                .toList();
            db.deleteQueueBagriceDelete(idLocalBagriceDel);
          });
        }
      }
    }
  }

  ///check đã login chưa , nếu chưa đẩy về trang login
  ///get các data cần để run app như:
  /// - set user login type
  _loadData(
      LoadDataSplashScreenEvent event, Emitter<SplashScreenState> emit) async {
    var token = await PrefHelper.getStringF(TOKEN_LOGIN);
    if (token.isEmpty) {
      emit(state.setRedirect(state, SplashScreenRedirect.login));
    } else {
      int userType = await PrefHelper.getIntF(USER_TYPE);
      try {
        var dpDB = await db.getDiaPhuong();
        if (dpDB.isEmpty) {
          dsDiaPhuong = await customerRepository.getDiaPhuongs(type: "");
          db.insertMultipleDiaPhuong(dsDiaPhuong);
        } else {
          dsDiaPhuong = dpDB;
        }
        dsTinh = dsDiaPhuong.where((e) => e.mapl == 'T').toList();

        // permissonsLocTroi = await loginRepository.getPermissions();
        emit(state.setRedirect(state, SplashScreenRedirect.home));
        LocTroiHelper.userLoginType = getUserType(userType);
      } on ApiExceptionEntity catch (e) {
        if (e.errCode == 403) {
          emit(state.setRedirect(state, SplashScreenRedirect.login));
        } else {
          LocTroiHelper.userLoginType = getUserType(userType);
          emit(state.setRedirect(state, SplashScreenRedirect.home));
        }
      }
    }
  }
}
