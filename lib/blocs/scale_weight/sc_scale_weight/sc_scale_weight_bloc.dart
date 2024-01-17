import 'package:base_project/export.dart';
import 'package:drift/drift.dart';
import 'package:loctroi_canlua_external/constants/loctroi_helper.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';

import 'sc_scale_weight_event.dart';
import 'sc_scale_weight_state.dart';

class ScScaleWeightBloc extends Bloc<ScScaleWeightEvent, ScScaleWeightState> {
  final CLDatabase _db = di.sl();
  final ICanLuaRepository canLuaRepository = di.sl();
  ScScaleWeightBloc() : super(ScScaleWeightState().init()) {
    on<InitEvent>(_init);
    on<SelectScScaleWeightEvent>(_selectBag);
    on<InitLstBagEvent>(_initBags);
    on<SetWeightScScaleWeightEvent>(setWeight);
    on<SaveWeightScScaleWeightEvent>(_saveWeight);
    on<DelScScaleWeightEvent>(_delWeight);
    on<ShowBottomScScaleWeightEvent>(_showBottom);
  }

  void _init(InitEvent event, Emitter<ScScaleWeightState> emit) async {
    emit(state.init());
  }

  void _initBags(
      InitLstBagEvent event, Emitter<ScScaleWeightState> emit) async {
    if (event.isLocTroiCan == true) {
      List<BagRiceEntity> bagsOnline = await canLuaRepository.getBagRices(
          event.soPhieuCan,
          event.isLocTroiCan == true,
          !(event.isLocTroiCan == true));
      emit(state.setBags(state, bagsOnline));
    } else {
      List<BagRiceEntity> bags =
          await _db.getAllBagRiceBySoPhieu(event.soPhieuCan);

      emit(state.setBags(state, bags));
    }
    //* Gọi ngầm nếu có mạng sẽ lấy các bao online
    // List<BagRiceEntity> bagsOnline = await canLuaRepository.getBagRices(
    //     event.soPhieuCan,
    //     event.isLocTroiCan == true,
    //     !(event.isLocTroiCan == true));
    // //* kiểm tra nếu các bao online chưa tồn tại trong danh sách đã load thì thêm vào
    // var idOnlineInLstOffline = bags.map((e) => e.id).toList();
    // var bagOnlineNotInOffline =
    //     bagsOnline.where((e) => !idOnlineInLstOffline.contains(e.id)).toList();
    // bags.addAll(bagOnlineNotInOffline);
    // emit(state.setBags(state, bags));
  }

  //! Chọn các bao lúa đã cân (hiện tại phục vụ cho tính năng xóa)
  void _selectBag(
      SelectScScaleWeightEvent event, Emitter<ScScaleWeightState> emit) async {
    BagRiceEntity? bag;
    if (event.bag.id != null) {
      bag = state.bags!.firstWhere((element) => element.id == event.bag.id);
    } else if (event.bag.idLocalDB != null) {
      bag = state.bags!
          .firstWhere((element) => element.idLocalDB == event.bag.idLocalDB);
    }
    if (bag != null) {
      bag.isChecked = event.isChecked;
      emit(state.setBags(state, state.bags!));
    } else {
      emit(state.setErr(state, "Không tìm dữ liệu ."));
    }
  }

  //! Xóa danh sách các cân đã cân.
  /// Gửi list id các bao lúa
  /// return true/false cho cân thành công thất bại
  void _delWeight(
      DelScScaleWeightEvent event, Emitter<ScScaleWeightState> emit) async {
    emit(state.loading(state));
    if (event.bagRemove.isEmpty) {
      emit(state.setErr(state, "Vui lòng chọn bao lúa cần xóa !!"));
    } else {
      List<num> idsLocalRemove =
          event.bagRemove.map((e) => e.idLocalDB!).toList();
      List<num> idsOnlineRemove = event.bagRemove
          .where((element) => element.id != null)
          .map((e) => e.id!)
          .toList();
      try {
        int numRowDel = await _db
            .deleteBagRices(idsLocalRemove.map((e) => e.toInt()).toList());
        Log.info("_db.deleteBagRices.numRowDel:", numRowDel);

        emit(state.hideLoading(state));
        if (numRowDel > 0) {
          List<BagRiceEntity> bagsOld = [...state.bags ?? []];
          if (idsOnlineRemove.isNotEmpty) {
            //* call server remove các bao lúa
            //* nếu gọi api thất bại sẽ gọi insert vào dữ liệu local ==> splash screen sẽ gọi xóa lại
            canLuaRepository
                .delCanLua(idsOnlineRemove, event.soPhieuCan, event.idCanLua)
                .then((value) {
              Log.info("canLuaRepository.delCanLua.then", value);
            }).catchError((err) {
              Log.error("canLuaRepository.delCanLua.catchError", err);
              List<BagRiceEntity> lstBagriceOnlineRemoveErr = event.bagRemove
                  .where((element) => idsOnlineRemove.contains(element.id))
                  .toList();
              _db.insertQueueBagriceDelete(
                  bagRices: lstBagriceOnlineRemoveErr,
                  soPhieuCan: event.soPhieuCan,
                  idCanLua: event.idCanLua);
              Log.error("canLuaRepository.delCanLua.catchError", err);
            });
          }
          bagsOld.removeWhere(
              (element) => idsLocalRemove.contains(element.idLocalDB));
          emit(state.setBags(state, bagsOld));
        } else {
          emit(state.setErr(state, "Đã có lỗi cân. Vui lòng thử lại !!"));
        }
      } catch (e) {
        emit(state.setErr(state, e.toString()));
        emit(state.hideLoading(state));
      }
    }
  }

  //! hàm run bất đồng bộ phải tách ra func riêng
  void setWeight(SetWeightScScaleWeightEvent event,
      Emitter<ScScaleWeightState> emit) async {
    emit(state.setWeight(state, event.weight));
  }

  //!Lưu 1 lần cân
  ///Lưu dữ liệu vào local và add thêm vào list hiện tại
  void _saveWeight(SaveWeightScScaleWeightEvent event,
      Emitter<ScScaleWeightState> emit) async {
    emit(state.loading(state));
    if (event.request.soPhieuCan != null) {
      try {
        String nameBagrices = LocTroiHelper().getNameBagRice(state.bags);
        BagRiceEntity? bagInserted = await _db.createBagRicesEntry(
            BagRicesCompanion(
                idCanLua: Value(event.request.id_canlua),
                sophieucan: Value(event.request.soPhieuCan!),
                name: Value(nameBagrices),
                isSync: const Value(false),
                weight: Value(event.request.data!.first.weight!)));
        emit(state.hideLoading(state));
        if (bagInserted != null && bagInserted.idLocalDB! > 0) {
          //* ---- đẩy lên server ko async-----
          event.request.data!.first.name = nameBagrices;
          canLuaRepository.save1BagRice(event.request).then((value) {
            if (value != null) {
              _db.setBagRiceSyncSucces(
                  bagInserted.idLocalDB!, int.tryParse('${value.id}') ?? 0);
              state.bags!
                  .firstWhere(
                      (element) => element.idLocalDB == bagInserted.idLocalDB!)
                  .id = value.id;
              // for (var e in state.bags!) {
              //   if(e.idLocalDB == bagInserted.idLocalDB) e.id =
              // }
              emit(state.setBags(state, state.bags!));
            }
          });
          //* ---- đẩy lên server ko async-----
          state.bags!.add(bagInserted);
          emit(state.setBags(state, state.bags!));
        } else {
          emit(state.setErr(state, "Đã có lỗi cân. Vui lòng thử lại !!"));
        }
      } on ApiExceptionEntity catch (e) {
        emit(state.setErr(state, e.message));
        emit(state.hideLoading(state));
      }
    } else {
      emit(state.setErr(state, "Không tìm thấy số phiếu cân !!"));
    }
    // await Future.delayed(const Duration(milliseconds: 400));
    // emit(state.setShowInputBottom(state));
    // await Future.delayed(const Duration(milliseconds: 100));
    // emit(state.setScrollBottom(state));
  }

  //! ẩn hiện input ở bottom bottom
  void _showBottom(ShowBottomScScaleWeightEvent event,
      Emitter<ScScaleWeightState> emit) async {
    emit(state.setShowInputBottom(state));
  }
}
