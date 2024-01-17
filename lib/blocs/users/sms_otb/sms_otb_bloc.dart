import 'export.dart';
import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;

class SmsOTBBloc extends Bloc<SmsOTBEvent, SmsOTBState> {
  IBLoginRepository loginRepository = di.sl();
  SmsOTBBloc() : super(SmsOTBState().init()) {
    on<InitEvent>(_init);
    on<SubmitSmsOTBEvent>(_register);
  }

  void _init(InitEvent event, Emitter<SmsOTBState> emit) async {
    emit(state.init());
  }

  void _register(SubmitSmsOTBEvent event, Emitter<SmsOTBState> emit) async {
    emit(state.loading(state));
    try {
      LoginRepsonseModel? regRepsonseModel = await loginRepository.register(
        hoten: event.hoten,
        huyen: event.huyen.madp ?? "",
        matkhau: FormatHelper.cryptoSHA256(event.matkhau),
        sodienthoai: event.sodienthoai,
        tenhuyen: event.huyen.tenkhac!,
        tentinh: event.tinh.tenkhac!,
        tenxa: event.xa.tenkhac ?? "",
        tinh: event.tinh.madp ?? "",
        xa: event.xa.madp ?? "",
      );

      emit(state.hideLoading(state));
      if (regRepsonseModel != null &&
          regRepsonseModel.token != null &&
          regRepsonseModel.token!.isNotEmpty) {
        PrefHelper.setString(TOKEN_LOGIN, regRepsonseModel.token!);
        PrefHelper.setString(USERNAME, regRepsonseModel.sodienthoai!);
        if (regRepsonseModel.fullName != null) {
          PrefHelper.setString(FULLNAME, regRepsonseModel.fullName!);
        }
        if (regRepsonseModel.email != null) {
          PrefHelper.setString(EMAIL, regRepsonseModel.email!);
        }
        PrefHelper.setString(PASS, event.matkhau);
        PrefHelper.setInt(
            USER_TYPE, int.tryParse('${regRepsonseModel.userType}') ?? 99);

        emit(state.setRegisterSuccess(state));
      } else {
        emit(state.setErr(state, "Đăng ký thất bại!"));
      }
    } on ApiExceptionEntity catch (e) {
      emit(state.setErr(state, e.message));
      emit(state.hideLoading(state));
    }
  }
}
