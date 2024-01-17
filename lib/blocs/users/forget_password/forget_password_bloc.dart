// ignore: depend_on_referenced_packages
import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'forget_password_event.dart';
import 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final IBLoginRepository loginRepository = di.sl();
  ForgetPasswordBloc() : super(ForgetPasswordState().init()) {
    on<InitEvent>(_init);
    on<ShowPass1ForgetPasswordEvent>(_showPass1);
    on<ShowPass2ForgetPasswordEvent>(_showPass2);
    on<SubmitForgetPasswordEvent>(_submit);
  }

  void _init(InitEvent event, Emitter<ForgetPasswordState> emit) async {
    emit(state.init());
  }

  void _showPass2(ShowPass2ForgetPasswordEvent event,
      Emitter<ForgetPasswordState> emit) async {
    emit(state.showHidePassword2(state, !state.hidePassword2!));
  }

  void _showPass1(ShowPass1ForgetPasswordEvent event,
      Emitter<ForgetPasswordState> emit) async {
    emit(state.showHidePassword1(state, !state.hidePassword1!));
  }

  void _submit(SubmitForgetPasswordEvent event,
      Emitter<ForgetPasswordState> emit) async {
    emit(state.err(state, ""));
    emit(state.loading(state));
    try {
      String passHash = FormatHelper.cryptoSHA256(event.pass);
      String phoneHash = FormatHelper.cryptoSHA256('${event.phone}$SALT');
      await loginRepository.changePass(
          sodienthoai: phoneHash, matkhau: passHash);

      emit(state.hideLoading(state));
      emit(state.success(state));
    } on ApiExceptionEntity catch (e) {
      emit(state.hideLoading(state));
      emit(state.err(state, e.message));
    }
  }
}
