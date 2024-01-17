// ignore_for_file: implementation_imports

import 'package:base_project/src/model/entity/b_du_an_entity.dart';
import 'package:base_project/src/model/entity/b_htx_entity.dart';
import 'package:base_project/src/model/entity/b_nong_dan_entity.dart';
import 'package:base_project/src/model/entity/b_so_phieu_entity.dart';

abstract class IBMasterDataRepository {
  Future<List<BHtxEntity>> getHTX();

  Future<List<BDuAnEntity>> getDuAn(String idHTX);

  Future<List<BSoPhieuEntity>> getSoPhieu(String maDuAn);

  Future<List<BNongDanEntity>> getNongDan({String? maDuAn, String? maHTX});

  Future<List<String>> getSoPhieuByMaND(
      {required String mand, required String maduan, required String maHTX});
}
