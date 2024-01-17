import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/scale_weight_request_model.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';

abstract class ICanLuaRepository {
  Future<bool> taoBangTinh(SoPhieuFilterModel data);

  Future<bool> feedBack(String content);

  Future<List<SoPhieuFilterModel>> getPhieuTuCan(
      {required String tuNgay, required String denNgay, required bool tuCan});

  Future<BagRiceEntity?> save1BagRice(ScaleWeightRequestModel request);

  Future<bool> delCanLua(List<num> body, String soPhieuCan, String idCanLua);

  Future<List<BagRiceEntity>> getBagRices(
      String soPhieuCan, bool noibo, bool tucan);

  Future<SoPhieuFilterModel?> updatePhieuCan(SoPhieuFilterModel data);

  Future<SoPhieuFilterModel?> updateGhePhieuCan(SoPhieuFilterModel data);
  
  Future syncData(
      List<SoPhieuFilterModel> sp, List<ScaleWeightRequestModel> bags);
}
