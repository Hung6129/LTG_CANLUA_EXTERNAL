import 'package:loctroi_canlua_external/database/cl_database.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:drift/drift.dart';

class ConvertTableDB {
  BagRicesCompanion convertBagRiceEntityToDbCompanion(BagRiceEntity model) {
    return BagRicesCompanion(
        idOnline: Value(int.tryParse('${model.id}')),
        name: Value(model.name ?? ""),
        sophieucan: Value(model.sophieucan ?? ""),
        weight: Value(double.tryParse('${model.weight}') ?? 0),
        isSync: Value(!(model.isNotSync == true)),
        idCanLua: Value(model.id_canlua));
  }

  BagRiceEntity convertBagRiceEntryToEntity(BagRiceEntry e) {
    return BagRiceEntity(
        weight: e.weight,
        name: e.name,
        id: e.idOnline,
        id_canlua: e.idCanLua,
        sophieucan: e.sophieucan,
        sophieu: e.sophieucan,
        isNotSync: !e.isSync,
        idLocalDB: e.id);
  }

  TicketsCompanion convertSoPhieuFilterModelToDbCompanion(
      SoPhieuFilterModel model) {
    String? idCanLua;
    // ignore: todo
    // *TODO Tính toán ID cân lúa
    ///* nếu danh sách các bao lúa != null và not empty
    ///*==> where tìm item có idCanLua khác null và set là idCanlua của phiếu cân
    if (model.canluaList != null && model.canluaList!.isNotEmpty) {
      idCanLua = model.canluaList!
          .firstWhere((element) =>
              element.id_canlua != null && element.id_canlua!.isNotEmpty)
          .id_canlua;
    }
    return TicketsCompanion(
        bacung_can: Value(model.vctm_ghe?.bacung_can),
        cmnd: Value(model.cmnd ?? model.vctm_ghe?.cmnd),
        denghiduyetgia: Value(model.vctm_ghe?.denghiduyetgia),
        dienthoaichughe:
            Value(model.dienthoaichughe ?? model.vctm_ghe?.dienthoaichughe),
        dientichchot: Value(double.tryParse(
            '${model.dientichchot ?? model.vctm_ghe?.dientichchot}')),
        dongiathuong: Value(double.tryParse('${model.vctm_ghe?.dongiathuong}')),
        giabocxep: Value(double.tryParse('${model.vctm_ghe?.giabocxep}')),
        giavanchuyen: Value(double.tryParse('${model.vctm_ghe?.giavanchuyen}')),
        idct: Value(model.vctm_ghe?.idct),
        giachot: Value(double.tryParse('${model.giachot}')),
        khoiluong_bao:
            Value(double.tryParse('${model.vctm_ghe?.khoiluong_bao}')),
        idenct: Value(model.idenct != null ? model.idenct!.toInt() : 0),
        khoiluong_tapchat:
            Value(double.tryParse('${model.vctm_ghe?.khoiluong_tapchat}')),
        loaighe: Value(model.vctm_ghe?.loaighe != null
            ? model.vctm_ghe?.loaighe!.toInt()
            : 0),
        luongvanchuyen:
            Value(double.tryParse('${model.vctm_ghe?.luongvanchuyen}') ?? 0),
        maghe: Value(model.vctm_ghe?.maghe),
        magiong: Value(model.vctm_ghe?.magiong),
        makenhbh: Value(model.vctm_ghe?.makenhbh),
        makhach: Value(model.vctm_ghe?.makhach),
        makhuruong: Value(model.vctm_ghe?.makhuruong),
        mand: Value(model.vctm_ghe?.mand),
        ngaycap: Value(model.ngaycap ?? model.vctm_ghe?.ngaycap),
        ngaycoghe: Value(model.ngaycoghe),
        ngaycoghestr: Value(model.ngaycoghestr),
        ngayghevenhamay: Value(model.vctm_ghe?.ngayghevenhamay),
        ngaylenghe: Value(model.vctm_ghe?.ngaylenghe),
        ngaythuhoachdk: Value(model.vctm_ghe?.ngaythuhoachdk),
        noicap: Value(model.noicap ?? model.vctm_ghe?.noicap),
        phulucso: Value(model.vctm_ghe?.phulucso),
        sanluongcan: Value(double.tryParse('${model.vctm_ghe?.dientichchot}')),
        sanluongdukien:
            Value(double.tryParse('${model.vctm_ghe?.sanluongdukien}')),
        so_bbtm: Value(model.vctm_ghe?.so_bbtm),
        sobao: Value(double.tryParse('${model.vctm_ghe?.sobao}')),
        sophieu: Value(model.sophieu),
        sophieucan: Value(model.sophieucan!),
        sophuongtien: Value(model.sophuongtien ?? model.vctm_ghe?.sophuongtien),
        taitrongkenh: Value(double.tryParse('${model.vctm_ghe?.taitrongkenh}')),
        tencaytrong: Value(model.vctm_ghe?.tencaytrong),
        tenchughe: Value(model.tenchughe ?? model.vctm_ghe?.tenchughe),
        tenghe: Value(model.vctm_ghe?.tenghe),
        tengiong: Value(model.tengiong ?? model.vctm_ghe?.tengiong),
        tenkenhbh: Value(model.vctm_ghe?.tenkenhbh),
        tenkhach: Value(model.vctm_ghe?.tenkhach),
        tenkhuruong: Value(model.tenkhuruong ?? model.vctm_ghe?.tenkhuruong),
        tennd: Value(model.tennd),
        tentrangthaivc: Value(model.vctm_ghe?.tentrangthaivc),
        thanhtien: Value(double.tryParse("${model.vctm_ghe?.thanhtien}")),
        thuhoachdieughechitietidenct: Value(
            double.tryParse("${model.vctm_ghe?.thuhoachdieughechitietidenct}")),
        tieuchuan: Value(model.tieuchuan ?? model.vctm_ghe?.tieuchuan),
        tongkhoiluong: Value(double.tryParse(
            "${model.tongkhoiluong ?? model.vctm_ghe?.tongkhoiluong}")),
        tongkhoiluong_tru_bao: Value(double.tryParse(
            "${model.tongkhoiluong_tru_bao ?? model.vctm_ghe?.tongkhoiluong_tru_bao}")),
        tongkhoiluong_tru_tapchat: Value(double.tryParse(
            "${model.tongkhoiluong_tru_tapchat ?? model.vctm_ghe?.tongkhoiluong_tru_tapchat}")),
        trangthaivc: Value(double.tryParse("${model.vctm_ghe?.trangthaivc}")),
        idCanLua: Value(idCanLua),
        tenhuyen: Value(model.tenhuyen),
        tentinh: Value(model.tentinh),
        tenxa: Value(model.tenxa),
        tinh: Value(model.tinh),
        xa: Value(model.xa),
        huyen: Value(model.huyen),
        ghichu: Value(model.ghichu),
        ngaycandb: Value(DateTime.tryParse(model.ngaycan!) ?? DateTime.now()),
        ngaycan: Value(model.ngaycan),
        isSync: Value(model.isNotSync == false),
        vanchuyenve: Value(model.vctm_ghe?.vanchuyenve));
  }
}
