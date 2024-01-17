// import 'package:dio/dio.dart';
// import 'dart:developer';

// ignore_for_file: implementation_imports, non_constant_identifier_names

import 'package:base_project/src/base_project.dart';
import 'package:retrofit/retrofit.dart';

part 'b_master_data_service.g.dart';

@RestApi(baseUrl: BaseRepository.baseURLChotGiaBDev)
abstract class BMasterDataService {
  factory BMasterDataService(Dio dio, {String baseUrl}) = _BMasterDataService;

  @GET("api/DVNN/List/GetListHTX_THTMobile")
  Future<List<BHtxEntity>> getHTX();

  @GET("api/DVNN/List/GetDuAnByHTX_THT/{idHTX}")
  Future<List<BDuAnEntity>> getDuAn(@Path() String idHTX);

  @GET("api/DVNN/List/GetSoPhieuByMaDuAn/{maDuAn}")
  Future<List<BSoPhieuEntity>> getSoPhieu(@Path() String maDuAn);

  @GET(
      "api/DVNN/List/GetMandThuMuaByMaduanV2?maduan={maDuAn}&mahtx_tht={maHTX}")
  Future<List<BNongDanEntity>> getNongDan(
      @Path() String? maDuAn, @Path() String? maHTX);

  @GET("/api/DVNN/List/GetSoPhieuThuMuaByMand/{mand}/{maduan}/{mahtx_tht}")
  Future<List<String>> getSoPhieuByMaND(
      @Path() String mand, @Path() String maduan, @Path() String mahtx_tht);
}
