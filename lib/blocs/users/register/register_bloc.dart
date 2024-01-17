import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  IBCustomerRepository customerRepository = di.sl();
  RegisterBloc() : super(RegisterState().init()) {
    on<InitEvent>(_init);
    on<ShowHidePassRegisterEvent>(_showHidePass);
    on<ShowHideRePassRegisterEvent>(_showHideRePass);
    on<SelectTinhRegisterEvent>(_selectTinh);
    on<SelectXaRegisterEvent>(_selectXa);
    on<SelectHuyenRegisterEvent>(_selectHuyen);
    on<GetTinhRegisterEvent>(_getTinh);
    on<GetHuyenRegisterEvent>(_getHuyen);
    on<GetXaRegisterEvent>(_getXa);
  }

  void _init(InitEvent event, Emitter<RegisterState> emit) async {
    emit(state.init());
  }

  _showHidePass(ShowHidePassRegisterEvent event, Emitter<RegisterState> emit) {
    bool isHidePass = state.hidePassword ?? false;
    emit(state.showHidePassword(state, !isHidePass));
  }

  _showHideRePass(
      ShowHideRePassRegisterEvent event, Emitter<RegisterState> emit) async {
    bool isHidePass = state.hideRePassword ?? false;
    emit(state.showHideRePassword(state, !isHidePass));
  }

  _selectTinh(
      SelectTinhRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.selectTinh(state, event.tinh));
    emit(state.selectHuyen(state, BDiaPhuongEntity()));
    emit(state.selectXa(state, BDiaPhuongEntity()));
  }

  _selectHuyen(
      SelectHuyenRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.selectHuyen(state, event.huyen));
    emit(state.selectXa(state, BDiaPhuongEntity()));
  }

  _selectXa(SelectXaRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.selectXa(state, event.xa));
  }

  //!  Lấy danh sách Xã theo id Huyện
  void _getXa(GetXaRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.loading(state));
    try {
      List<BDiaPhuongEntity> xas = await customerRepository
          .getDiaPhuongsNotAuth(type: "X", id: event.idHuyen);

      emit(state.hideLoading(state));
      emit(state.setLstXa(state, xas));
    } on ApiExceptionEntity catch (e) {
      emit(state.err(state, e.message));
      emit(state.hideLoading(state));
    }

    emit(state.hideLoading(state));
  }

  //! Lấy danh sách Huyện theo id Tỉnh
  void _getHuyen(
      GetHuyenRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.loading(state));
    try {
      List<BDiaPhuongEntity> huyens = await customerRepository
          .getDiaPhuongsNotAuth(type: "H", id: event.idTinh);

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
  void _getTinh(GetTinhRegisterEvent event, Emitter<RegisterState> emit) async {
    if (dsTinh.isNotEmpty) {
      emit(state.setLstTinh(state, dsTinh));
    } else {
      emit(state.loading(state));
      try {
        List<BDiaPhuongEntity> tinhs =
            await customerRepository.getDiaPhuongsNotAuth(type: "T");
        emit(state.hideLoading(state));
        emit(state.setLstTinh(state, tinhs));
      } on ApiExceptionEntity catch (e) {
        emit(state.err(state, e.message));
        emit(state.hideLoading(state));
      }

      emit(state.hideLoading(state));
    }
  }
}
