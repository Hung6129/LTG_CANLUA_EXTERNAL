// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:base_project/src/repository/service/b_masterd_data_service/b_master_data_service.dart';
// import 'package:chot_gia/repository/services/product_services.dart';
// import '../../injection_container.dart' as di;

class BMasterDataRepository extends BaseRepository
    implements IBMasterDataRepository {
  BMasterDataRepository() {
    PrefHelper.init();
  }

  // ProductDatabase productDB = di.sl();

  @override
  Future<List<BHtxEntity>> getHTX() async {
    Dio dio = await getApiClient();
    List<BHtxEntity> result = [];

    await BMasterDataService(dio).getHTX().then((it) {
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
  Future<List<BDuAnEntity>> getDuAn(String idHTX) async {
    Dio dio = await getApiClient();
    List<BDuAnEntity> result = [];

    await BMasterDataService(dio).getDuAn(idHTX).then((it) {
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
  Future<List<BSoPhieuEntity>> getSoPhieu(String maDuAn) async {
    Dio dio = await getApiClient();
    List<BSoPhieuEntity> result = [];

    await BMasterDataService(dio).getSoPhieu(maDuAn).then((it) {
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
  Future<List<BNongDanEntity>> getNongDan(
      {String? maDuAn, String? maHTX}) async {
    Dio dio = await getApiClient();
    List<BNongDanEntity> result = [];

    await BMasterDataService(dio)
        .getNongDan(maDuAn ?? "", maHTX ?? "")
        .then((it) {
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
  Future<List<String>> getSoPhieuByMaND(
      {required String mand,
      required String maduan,
      required String maHTX}) async {
    Dio dio = await getApiClient();
    List<String> result = [];

    await BMasterDataService(dio)
        .getSoPhieuByMaND(mand, maduan, maHTX)
        .then((it) {
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
