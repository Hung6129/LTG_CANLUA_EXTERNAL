// ignore_for_file: implementation_imports

import 'package:base_project/export.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/feedback_request_model.dart';
import 'package:loctroi_canlua_external/models/scale_weight_request_model.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:retrofit/retrofit.dart';
// ignore_for_file: depend_on_referenced_packages
part 'can_lua_services.g.dart';

@RestApi()
// @RestApi(baseUrl: BaseRepository.baseURLCanLuaExternal)
abstract class CanLuaService {
  factory CanLuaService(Dio dio, {String baseUrl}) = _CanLuaService;

  @POST("api/DVNN/CanLua/TaoBangTinh")
  Future<bool> taoBangTinh(@Body() SoPhieuFilterModel model);

  @POST("api/DVNN/Canlua/FeedBack")
  Future<bool> feedBack(@Body() FeedbackRequestModel body);

  @GET(
      "api/DVNN/Canlua/GetPhieucanList?tungay={tuNgay}&denngay={denNgay}&tucan={tuCan}")
  Future<List<SoPhieuFilterModel>> getPhieuCan(
      @Path() String tuNgay, @Path() String denNgay, @Path() bool tuCan);

  @POST("api/DVNN/Canlua/SaveCanLuaNgoai")
  Future<List<ScaleWeightRequestModel>> saveCanLuaLuaNgoai(
      @Body() List<ScaleWeightRequestModel> body);

  @POST(
      "api/DVNN/Canlua/DeleteCanLua?sophieucan={soPhieuCan}&id_canlua={idCanLua}")
  Future<bool> delCanLua(@Body() List<num> body, @Path() String soPhieuCan,
      @Path() String idCanLua);

  @GET(
      "api/DVNN/Canlua/GetCanLuaList?sophieucan={sophieucan}&noibo={noibo}&tucan={tucan}")
  Future<List<BagRiceEntity>> getBagRices(
      @Path() String sophieucan, @Path() bool noibo, @Path() bool tucan);

  @POST("api/DVNN/Canlua/SavePhieuCanThongTinChung")
  Future<SoPhieuFilterModel> updatePhieuCanNgoai(
      @Body() SoPhieuFilterModel model);

  @POST("api/DVNN/Canlua/SavePhieuCanGhe")
  Future<SoPhieuFilterModel> updateGhePhieuCanNgoai(
      @Body() SoPhieuFilterModel model);
}
