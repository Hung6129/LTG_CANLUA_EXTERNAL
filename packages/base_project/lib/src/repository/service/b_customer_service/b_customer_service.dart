// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:retrofit/retrofit.dart';

part 'b_customer_service.g.dart';

@RestApi(baseUrl: BaseRepository.baseURLCanLuaExternalBDev)
abstract class BCustomerService {
  factory BCustomerService(Dio dio, {String baseUrl}) = _BCustomerService;

  @GET("api/DVNN/List/XuongGiong_KhachHang")
  Future<List<BKhachHangEntity>> getKhachHang();

  @GET("api/DVNN/List/GetdmDiaphuongs/{type}/{id}")
  Future<List<BDiaPhuongEntity>> getDiaPhuongs(
      @Path() String type, @Path() String? id);
  @GET("api/DVNN/List/GetdmDiaphuongs/{type}/{id}")
  Future<List<BDiaPhuongEntity>> getDiaPhuongsNoAuth(
      @Path() String type, @Path() String? id);
}
