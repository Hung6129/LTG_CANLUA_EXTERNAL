import 'package:base_project/src/base/repository/interceptor_cache_dio.dart';
import 'package:base_project/src/base_project.dart';
import 'package:dio_logger/dio_logger.dart';

// const baseUrlFileChotGia = "http://192.168.29.9:9668/FDrive/XNCG/";
// const bastUrlFileThuMua = "http://192.168.29.9:9668/FDrive/VCTM/";
const baseUrlFileChotGia = "https://dvnn.loctroi.vn:2103/FDrive/XNCG/";
const bastUrlFileThuMua = "https://dvnn.loctroi.vn:2103/FDrive/VCTM/";

abstract class BaseRepository {
  static const baseURLLogin = 'https://app.loctroi.vn:1408/';

//! -------APP CHOT GIA----
  static const baseURLCanLuaExternalDev = 'http://192.168.29.9:9667/';
  static const baseURLCanLuaExternalBDev = 'http://192.168.29.9:9667/';
  static const baseURLCanLuaExternal = 'https://dvnn.loctroi.vn:2103/';

  static const baseURLChotGia = 'https://dvnn.loctroi.vn:2103/';
  static const baseURLChotGiaDEV = 'http://192.168.29.9:9668/';
  static const baseURLChotGiaBDev = 'http://192.168.29.9:9668/';

  // static const baseURLUpload = 'http://192.168.29.9:9668/';
  // static const baseURLUpload = 'https://dvnn.loctroi.vn:2103/';

  // static const baseUrlDownload = "http://192.168.29.9:9668/FDrive/XNCG/";
  // static const baseUrlDownload = "https://dvnn.loctroi.vn:2103/FDrive/XNCG/";
//! -------APP CHOT GIA----

  static const baseAppNongDanDev = "http://192.168.29.9:9898/";
  static const baseAppNongDanProd = "http://192.168.29.9:9898/";
  static const baseAppNongDanSyncSAP = "http://192.168.29.9:2808/";
  static const baseAppNongDanSyncMCOM = "https://loctroi.mcom.app/";

  String token = "", username = "", appID = "";

  Future<Dio> getApiClient(
      {String? contentType, String? baseUrl, CachePolicy? cachePolicy}) async {
    token = await PrefHelper.getStringF(TOKEN_LOGIN);

    username = await PrefHelper.getStringF(USERNAME);
    appID = await PrefHelper.getStringF(APPID);
    // ignore: avoid_print
    // print('token:$token \n username:$username \n appID:$appID');
    var dio = Dio();
    dio.options.connectTimeout = 10000;

    //! Cache manager
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    dio.options.receiveTimeout = 10000;
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = contentType ?? "application/json";
    dio.options.headers["token"] = token;
    dio.options.headers["appid"] = appID;
    dio.options.headers["username"] = username;
    dio.options.headers["mobile"] = true;
    dio.interceptors.add(dioLoggerInterceptor);
    CacheOptions cacheOption = await getCacheOption(policy: cachePolicy);
    dio.interceptors.add(DioCacheInterceptor(options: cacheOption));
    return dio;
  }

  Future<Dio> getApiClientNoAuth(
      {String? contentType, String? baseUrl, CachePolicy? cachePolicy}) async {
    appID = await PrefHelper.getStringF(APPID);
    var dio = Dio();
    // dio.options.connectTimeout = 6000;
    // dio.options.receiveTimeout = 3000;
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    dio.options.headers["Content-Type"] = contentType ?? "application/json";
    dio.interceptors.add(dioLoggerInterceptor);
    CacheOptions cacheOption = await getCacheOption(policy: cachePolicy);
    dio.interceptors.add(DioCacheInterceptor(options: cacheOption));
    return dio;
  }

  Future<void> writeLogs(Object obj, Dio dio,
      {Function? refreshTokenCallback, Function? errCallback}) async {
    final dioError = (obj as DioError);

    //# regon show log
    // print('statusCode:${dioError.response?.statusCode}');
    // RequestOptions? requestOptionsLog = dioError.response?.requestOptions;

    // print(
    //     '''${requestOptionsLog?.baseUrl}${requestOptionsLog?.path}${dioError.response?.data}
    //     ${dioError.response?.requestOptions.method}
    //     ${dioError.response?.statusCode}
    //     ${dioError.error}''');
    //# end-regon
    if (dioError.response?.statusCode == 403) {
      ///request refresh token
      //token = await user.getIdToken(refresh: true);

      /// save to share ref
      //await writeAuthKey(token);

      RequestOptions requestOptions = dioError.response!.requestOptions;
      requestOptions.headers["Authorization"] = "Bearer $token";

      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      );
      await dio
          .request(requestOptions.baseUrl + requestOptions.path,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
              options: options)
          .then((value) {
        if (refreshTokenCallback != null) {
          refreshTokenCallback(value);
        }
      }).catchError((onError) {
        // logger.i(onError);
        if (errCallback != null) errCallback(onError);
      });
    }
  }

  ApiExceptionEntity throwErr(DioError err) {
    String? errMsn = err.response?.data.toString();
    String messErr =
        errMsn ?? (err.error is String ? err.error : err.error.message);
    if (messErr.toLowerCase().contains("timed out") ||
        messErr.toLowerCase().contains("network is unreachable")) {
      messErr =
          "Không thể kết nối đến server.\nVui lòng kiểm tra kết nối mạng !!";
    }

    return ApiExceptionEntity(
        message: messErr, errCode: err.response?.statusCode);
  }
}
