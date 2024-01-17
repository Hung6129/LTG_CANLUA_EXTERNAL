// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/feedback_request_model.dart';
import 'package:loctroi_canlua_external/models/scale_weight_request_model.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:loctroi_canlua_external/repository/repository/can_lua_repo/i_can_lua_repository.dart';
import 'package:loctroi_canlua_external/repository/services/can_lua_services.dart';
// import 'package:chot_gia/repository/services/product_services.dart';
import 'package:loctroi_canlua_external/injection_container.dart' as di;
import 'package:loctroi_canlua_external/run_config.dart';

class CanLuaRepository extends BaseRepository implements ICanLuaRepository {
  final CLDatabase db = di.sl();
  CanLuaRepository() {
    PrefHelper.init();
  }
  Future<bool> savePhieuCan(SoPhieuFilterModel soPhieu) async {
    bool result = false;
    return result;
  }

  @override
  Future<bool> taoBangTinh(SoPhieuFilterModel data) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    bool result = false;
    await CanLuaService(dio).taoBangTinh(data).then((it) {
      result = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<bool> feedBack(String content) async {
    FeedbackRequestModel body = FeedbackRequestModel(
        appid: appID == "" ? "CANLUA" : appID, content: content);
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    bool result = false;
    await CanLuaService(dio).feedBack(body).then((it) {
      result = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<List<SoPhieuFilterModel>> getPhieuTuCan(
      {required String tuNgay,
      required String denNgay,
      required bool tuCan}) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    List<SoPhieuFilterModel> result = [];
    await CanLuaService(dio).getPhieuCan(tuNgay, denNgay, tuCan).then((it) {
      result = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<BagRiceEntity?> save1BagRice(ScaleWeightRequestModel request) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    dio.options.connectTimeout = 3000;
// request.data!.first.toJson() .toString()
    List<ScaleWeightRequestModel>? response;
    await CanLuaService(dio).saveCanLuaLuaNgoai([request]).then((it) {
      response = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
    });
    return response?.first.convertToBagRice();
  }

  @override
  Future<bool> delCanLua(
      List<num> body, String soPhieuCan, String idCanLua) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    bool result = false;
    await CanLuaService(dio).delCanLua(body, soPhieuCan, idCanLua).then((it) {
      result = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<List<BagRiceEntity>> getBagRices(
      String soPhieuCan, bool noibo, bool tucan) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    List<BagRiceEntity> result = [];
    await CanLuaService(dio).getBagRices(soPhieuCan, noibo, tucan).then((it) {
      result = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<SoPhieuFilterModel?> updatePhieuCan(SoPhieuFilterModel data) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    SoPhieuFilterModel? result;
    await CanLuaService(dio).updatePhieuCanNgoai(data).then((it) {
      result = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future<SoPhieuFilterModel?> updateGhePhieuCan(SoPhieuFilterModel data) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    SoPhieuFilterModel? result;
    await CanLuaService(dio).updateGhePhieuCanNgoai(data).then((it) {
      result = it;
    }).catchError((Object obj) {
      // non-200 error goes here.
      final dioError = (obj as DioError);
      throw throwErr(dioError);
      // String? errMsn = dioError.response?.data.toString();
      // throw ApiExceptionEntity(
      //     message: errMsn ??
      //         (dioError.error is String
      //             ? dioError.error
      //             : dioError.error.message),
      //     errCode: dioError.response?.statusCode);
      //     errCode: dioError.response?.statusCode);
    });
    return result;
  }

  @override
  Future syncData(
      List<SoPhieuFilterModel> sp, List<ScaleWeightRequestModel> bags) async {
    Dio dio = await getApiClient(baseUrl: RunConfig.baseUrl);
    for (var soPhieu in sp) {
      soPhieu.ngaycanstr = DateTimeHelper.formatDateTime(
          soPhieu.ngaycan!, DateFormats.dd_MM_YYYY);
      try {
        await CanLuaService(dio).taoBangTinh(soPhieu).then((value) async {
          // ignore: avoid_print
          print(value);
          await db.setSoPhieySyncSucces(soPhieu.id!);
        });
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
    try {
      await CanLuaService(dio).saveCanLuaLuaNgoai(bags).then((value) async {
        for (int i = 0; i < value.length; i++) {
          await db
              .setBagRiceSyncSucces(bags[i].idLocalDB!,
                  int.tryParse('${value[i].convertToBagRice().id}') ?? 0)
              .catchError((e) {
            Log.debug("sync bao lua .catchError", e);
          }).then((value) {
            Log.info("sync bao lua .then", value);
          });
        }
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
