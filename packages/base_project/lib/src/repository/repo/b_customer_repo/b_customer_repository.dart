// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:base_project/src/repository/service/b_customer_service/b_customer_service.dart';

// import 'package:chot_gia/repository/services/product_services.dart';
// import '../../injection_container.dart' as di;

class BCustomerRepository extends BaseRepository
    implements IBCustomerRepository {
  BCustomerRepository() {
    PrefHelper.init();
  }

  @override
  Future<List<BKhachHangEntity>> getCustomers() async {
    Dio dio = await getApiClient();
    List<BKhachHangEntity> result = [];

    await BCustomerService(dio).getKhachHang().then((it) {
      result = it;
    }).catchError((Object obj) async {
      // non-200 error goes here.

      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ?? dioError.message,
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<List<BDiaPhuongEntity>> getDiaPhuongs(
      {required String type, String? id}) async {
    Dio dio = await getApiClient(cachePolicy: CachePolicy.request);
    dio.options.connectTimeout = 20000;
    List<BDiaPhuongEntity> result = [];

    await BCustomerService(dio).getDiaPhuongs(type, id ?? "").then((it) {
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
  Future<List<BDiaPhuongEntity>> getDiaPhuongsNotAuth(
      {required String type, String? id}) async {
    Dio dio = await getApiClientNoAuth(cachePolicy: CachePolicy.request);
    List<BDiaPhuongEntity> result = [];

    await BCustomerService(dio).getDiaPhuongs(type, id ?? "").then((it) {
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
}
