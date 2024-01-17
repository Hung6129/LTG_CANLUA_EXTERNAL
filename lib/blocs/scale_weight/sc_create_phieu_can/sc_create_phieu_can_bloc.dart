import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';

import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'sc_create_phieu_can_event.dart';
import 'sc_create_phieu_can_state.dart';

class ScCreatePhieuCanBloc
    extends Bloc<ScCreatePhieuCanEvent, ScCreatePhieuCanState> {
  IBCustomerRepository customerRepository = di.sl();
  ICanLuaRepository canLuaRepository = di.sl();
  final CLDatabase _db = di.sl();
  ScCreatePhieuCanBloc() : super(ScCreatePhieuCanState().init()) {
    on<InitEvent>(_init);
    on<SelectTinhScCreatePhieuCanEvent>(_selectTinh);
    on<SelectXaScCreatePhieuCanEvent>(_selectXa);
    on<SelectHuyenScCreatePhieuCanEvent>(_selectHuyen);
    on<GetTinhScCreatePhieuCanEvent>(_getTinh);
    on<GetHuyenScCreatePhieuCanEvent>(_getHuyen);
    on<GetXaScCreatePhieuCanEvent>(_getXa);
    on<CreateCreatePhieuCanEvent>(_createPhieuCan);
  }

  void _init(InitEvent event, Emitter<ScCreatePhieuCanState> emit) async {
    emit(state.init());
  }

  _selectTinh(SelectTinhScCreatePhieuCanEvent event,
      Emitter<ScCreatePhieuCanState> emit) async {
    emit(state.selectTinh(state, event.tinh));
    emit(state.selectHuyen(state, BDiaPhuongEntity()));
    emit(state.selectXa(state, BDiaPhuongEntity()));
  }

  _selectHuyen(SelectHuyenScCreatePhieuCanEvent event,
      Emitter<ScCreatePhieuCanState> emit) async {
    emit(state.selectHuyen(state, event.huyen));
    emit(state.selectXa(state, BDiaPhuongEntity()));
  }

  _selectXa(SelectXaScCreatePhieuCanEvent event,
      Emitter<ScCreatePhieuCanState> emit) async {
    emit(state.selectXa(state, event.xa));
  }

  //!  Lấy danh sách Xã theo id Huyện
  void _getXa(GetXaScCreatePhieuCanEvent event,
      Emitter<ScCreatePhieuCanState> emit) async {
    emit(state.loading(state));
    try {
      List<BDiaPhuongEntity> xas = [];

      xas = dsDiaPhuong
          .where((e) => e.mapl == 'X' && e.madp!.contains(event.idHuyen))
          .toList();
      if (xas.isEmpty) {
        xas = await customerRepository.getDiaPhuongs(
            type: "X", id: event.idHuyen);
      }
      emit(state.hideLoading(state));
      emit(state.setLstXa(state, xas));
    } on ApiExceptionEntity catch (e) {
      emit(state.err(state, e.message));
      emit(state.hideLoading(state));
    }

    emit(state.hideLoading(state));
  }

  //! Lấy danh sách Huyện theo id Tỉnh
  void _getHuyen(GetHuyenScCreatePhieuCanEvent event,
      Emitter<ScCreatePhieuCanState> emit) async {
    emit(state.loading(state));
    try {
      // List<BDiaPhuongEntity> huyens =
      //     await customerRepository.getDiaPhuongs(type: "H", id: event.idTinh);
      List<BDiaPhuongEntity> huyens = [];
      huyens = dsDiaPhuong
          .where((e) => e.mapl == 'H' && e.madp!.contains(event.idTinh))
          .toList();
      if (huyens.isEmpty) {
        huyens =
            await customerRepository.getDiaPhuongs(type: "H", id: event.idTinh);
      }
      emit(state.hideLoading(state));
      emit(state.setLstHuyen(state, huyens));
    } on ApiExceptionEntity catch (e) {
      emit(state.err(state, e.message));
      emit(state.hideLoading(state));
    }

    emit(state.hideLoading(state));
  }

  //! lấy danh sách tỉnh
  ///* nếu ở splash screen đã load thành công ds tỉnh sẽ set trực tiếp ở đây
  ///* ngược lại sẽ gọi lấy danh sách tỉnh
  void _getTinh(GetTinhScCreatePhieuCanEvent event,
      Emitter<ScCreatePhieuCanState> emit) async {
    // print(dsTinh.length);
    if (dsTinh.isNotEmpty) {
      emit(state.setLstTinh(state, dsTinh));
    } else {
      emit(state.loading(state));
      try {
        List<BDiaPhuongEntity> tinhs =
            await customerRepository.getDiaPhuongs(type: "T");
        emit(state.hideLoading(state));
        emit(state.setLstTinh(state, tinhs));
      } on ApiExceptionEntity catch (e) {
        emit(state.err(state, e.message));
        emit(state.hideLoading(state));
      }

      emit(state.hideLoading(state));
    }
  }

//! tạo số phiếu onl
//! Tạo số phiếu 100% offline và âm thầm gọi sync data về server
  void _createPhieuCan(CreateCreatePhieuCanEvent event,
      Emitter<ScCreatePhieuCanState> emit) async {
    emit(state.loading(state));
    SoPhieuFilterModel data = SoPhieuFilterModel(
        tenkhuruong: event.khuRuong,
        ngaycan: event.ngayCan,
        sophieucan: event.soPhieu,
        sophieu: event.soPhieu,
        tinh: event.tinh.madp,
        huyen: event.huyen.madp,
        xa: event.xa.madp,
        tentinh: event.tinh.tenkhac,
        ngaycanstr: event.ngaycanstr,
        tenhuyen: event.huyen.tenkhac,
        tenxa: event.xa.tenkhac,
        ghichu: event.ghiChu);
    Log.debug("CreateCreatePhieuCanEvent", data);
    try {
      emit(state.loading(state));
      int idInserted = await _db.insertSP(data);
      if (idInserted == 0) {
        emit(state.hideLoading(state));
        emit(state.err(state, "Đã có lỗi vui lòng thử lại !!"));
      } else if (idInserted == -1) {
        emit(state.hideLoading(state));
        emit(state.err(
            state, "Số phiếu không được trùng với các số phiếu trước đó !!"));
      } else {
        //! Gửi về server ko asyc
        canLuaRepository.taoBangTinh(data).then((value) async {
          //* nếu thành công thì gọi update lại đã sync trên local
          await _db.setSoPhieySyncSucces(idInserted);
        });

        emit(state.hideLoading(state));
        //! báo đã tạo phiếu thành công
        emit(state.setSuccess(state));
      }
    } catch (e) {
      Log.debug("_createPhieuCan ERROR", "$e");
      emit(state.err(state, "Đã có lỗi vui lòng thử lại !!"));
    }
    emit(state.hideLoading(state));
  }
}
