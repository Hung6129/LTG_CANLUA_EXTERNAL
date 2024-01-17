// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:base_project/src/repository/service/b_login_service/b_login_services.dart';
// import 'package:chot_gia/repository/services/product_services.dart';
// import '../../injection_container.dart' as di;

class BLoginRepository extends BaseRepository implements IBLoginRepository {
  BLoginRepository() {
    PrefHelper.init();
  }

  // ProductDatabase productDB = di.sl();

  @override
  Future<LoginRepsonseModel?> login(
      {required String username, required String password}) async {
    Dio dio = await getApiClient();
    LoginRepsonseModel? result;

    var dataJson = {
      "userName": username,
      "password": password,
      "token": "",
      "email": null,
      "isMobile": true,
      "isExternal": false,
      "version": "",
      "appId": appID
    };
    Log.debug("login", dataJson);
    await BLoginService(dio).login(dataJson).then((it) {
      result = it;
    }).catchError((Object obj) async {
      final dioError = (obj as DioError);
      String? errMsn = dioError.response?.data.toString();
      result = LoginRepsonseModel(errorMessage: errMsn);

      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ?? dioError.error.message,
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<List<PermissionLoctroiModel>> getPermissions() async {
    Dio dio = await getApiClient();
    List<PermissionLoctroiModel> result = [];
    await BLoginService(dio).getPermission(username).then((it) {
      result = it;
    }).catchError((Object obj) async {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ?? dioError.error.message,
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<LoginRepsonseModel?> register(
      {required String sodienthoai,
      required String matkhau,
      required String hoten,
      required String tinh,
      required String tentinh,
      required String huyen,
      required String tenhuyen,
      required String xa,
      required String tenxa}) async {
    Dio dio = await getApiClient();
    LoginRepsonseModel? result;
    String appId = await PrefHelper.getStringF(APPID);
    var dataJson = {
      "sodienthoai": sodienthoai,
      "matkhau": matkhau,
      "hoten": hoten,
      "tinh": tinh,
      "huyen": huyen,
      "xa": xa,
      "tentinh": tentinh,
      "tenhuyen": tenhuyen,
      "tenxa": tenxa,
      "appid": appId
    };
    Log.debug("register", dataJson);
    await BLoginService(dio).register(dataJson).then((it) {
      result = it;
    }).catchError((Object obj) async {
      final dioError = (obj as DioError);
      String? errMsn = dioError.response?.data.toString();
      result = LoginRepsonseModel(errorMessage: errMsn);

      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ?? dioError.error.message,
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<bool?> changePass(
      {required String sodienthoai, required String matkhau}) async {
    Dio dio = await getApiClient();
    bool? result;
    var dataJson = {"Phone": sodienthoai, "Password": matkhau};
    Log.debug("register", dataJson);
    await BLoginService(dio).changePass(dataJson).then((it) {
      result = it;
    }).catchError((Object obj) async {
      final dioError = (obj as DioError);

      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ?? dioError.error.message,
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }
}
