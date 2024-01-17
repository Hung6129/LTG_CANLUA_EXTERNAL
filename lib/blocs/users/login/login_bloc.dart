// ignore_for_file: implementation_imports
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final logger = Logger();
  final IBLoginRepository loginRepository = di.sl();
  LoginBloc({LoginState? state}) : super(state ?? LoginState().init()) {
    on<InitLoginEvent>(_initEvent);
    on<ShowHidePassLoginEvent>(_showHidePass);
    on<SubmitLoginEvent>(_onSubmitLoginEvent);
  }

  _initEvent(InitLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.init());
    String username = await PrefHelper.getStringF(USERNAME);
    String pass = await PrefHelper.getStringF(PASS);
    if (username.isNotEmpty && pass.isNotEmpty) {
      emit(state.setUserPass(state, username, pass));
    }
  }

  _showHidePass(ShowHidePassLoginEvent event, Emitter<LoginState> emit) async {
    bool isHidePass = state.hidePassword ?? false;
    emit(state.showHidePassword(state, !isHidePass));
  }

  _onSubmitLoginEvent(SubmitLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.err(state, ""));
    if (event.username.isEmpty || event.password.isEmpty) {
      emit(state.err(state, "Vui lòng nhập thông tin đăng nhập"));
    } else {
      emit(state.loading(state));
      try {
        LoginRepsonseModel? loginRepsonseModel = await loginRepository.login(
            username: event.username,
            password: FormatHelper.cryptoSHA256(event.password));
        Log.debug("_onSubmitLoginEvent", loginRepsonseModel);
        if (loginRepsonseModel != null &&
            loginRepsonseModel.token != null &&
            loginRepsonseModel.token!.isNotEmpty) {
          await PrefHelper.setString(TOKEN_LOGIN, loginRepsonseModel.token!);
          await PrefHelper.setString(USERNAME, event.username);
          if (loginRepsonseModel.fullName != null) {
            await PrefHelper.setString(FULLNAME, loginRepsonseModel.fullName!);
          }
          if (loginRepsonseModel.email != null) {
            await PrefHelper.setString(EMAIL, loginRepsonseModel.email!);
          }
          await PrefHelper.setString(PASS, event.password);
          await PrefHelper.setInt(
              USER_TYPE, int.tryParse('${loginRepsonseModel.userType}') ?? 99);

          emit(state.successLolgin(state));
        } else {
          emit(state.err(state, "Login thất bại!"));
        }
        String a = await PrefHelper.getStringF(TOKEN_LOGIN);
        Log.debug("TOKEN_LOGIN", a);
      } on ApiExceptionEntity catch (e) {
        emit(state.hideLoading(state));
        emit(state.err(state, e.message));
      }
    }
  }
}
