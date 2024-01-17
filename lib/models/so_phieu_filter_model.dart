// ignore_for_file: non_constant_identifier_names

import 'package:base_project/export.dart' as b;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';

import 'key_value_model.dart';
// ignore_for_file: depend_on_referenced_packages
part 'so_phieu_filter_model.g.dart';

@JsonSerializable()
class SoPhieuFilterModel {
  String? sophieu;
  int? id;
  int? idLocal;
  String? sophieucan;
  num? idenct;
  String? so_bbtm;
  String? mand;
  String? tennd;
  String? makhuruong;
  String? tenkhuruong;
  String? magiong;
  String? tengiong;
  String? ngaycan;
  String? ngaycanstr;
  String? ngaycoghe;
  String? ngaycoghestr;
  String? tentinh;
  String? tinh;
  String? tenhuyen;
  String? huyen;
  String? tenxa;
  String? xa;
  String? ghichu;
  String? tieuchuan;
  String? sophuongtien;
  String? tenchughe;
  String? dienthoaichughe;
  String? ngaycap;
  String? ngaycapstr;
  String? cmnd;
  String? noicap;
  num? giachot;
  num? dientichchot;
  num? tongkhoiluong_tru_tapchat;
  num? tongkhoiluong_tru_bao;
  num? sanluongcan;
  num? tongkhoiluong;
  num? sobao;
  VctmGheBean? vctm_ghe;
  List<BagRiceEntity>? canluaList;
  //!Xác định phiếu offline qua param này
  bool? isNotSync;

  SoPhieuFilterModel(
      {this.sophieu,
      this.sophieucan,
      this.idenct,
      this.id,
      this.idLocal,
      this.so_bbtm,
      this.mand,
      this.tennd,
      this.ngaycanstr,
      this.makhuruong,
      this.tenkhuruong,
      this.magiong,
      this.tengiong,
      this.ngaycan,
      this.huyen,
      this.tenhuyen,
      this.tentinh,
      this.tenxa,
      this.tinh,
      this.xa,
      this.ngaycoghe,
      this.ngaycoghestr,
      this.ghichu,
      this.canluaList,
      this.isNotSync,
      this.tieuchuan,
      this.dientichchot,
      this.giachot,
      this.tongkhoiluong_tru_bao,
      this.tongkhoiluong_tru_tapchat,
      this.sobao,
      this.ngaycapstr,
      this.tongkhoiluong,
      this.vctm_ghe});

  factory SoPhieuFilterModel.fromJson(Map<String, dynamic> json) =>
      _$SoPhieuFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SoPhieuFilterModelToJson(this);

  SoPhieuFilterModel convertFromBThuMuaEntity(b.BThuMuaEntity e) {
    return SoPhieuFilterModel(sophieu: e.sophieu, idenct: e.idEnCt);
  }

  @override
  String toString() {
    return 'SoPhieuFilterModel(sophieu: $sophieu, id: $id, idLocal: $idLocal, sophieucan: $sophieucan, idenct: $idenct, bagRicesCount: ${canluaList?.length} ) \n\n';
  }

  List<KeyValueModel> initKeyValuePhieuTuCan(BuildContext context) {
    return [
      KeyValueModel(key: S.of(context).txt_tinh, vaule: tentinh ?? ""),
      KeyValueModel(key: S.of(context).txt_huyen, vaule: tenhuyen ?? ""),
      KeyValueModel(key: S.of(context).txt_xa, vaule: tenxa ?? ""),
      KeyValueModel(key: S.of(context).txt_ghi_chu, vaule: ghichu ?? ""),
    ];
  }

  List<KeyValueModel> keyValueGhe(BuildContext context) {
    return [
      KeyValueModel(
          key: S.of(context).txt_so_phuong_tien, vaule: sophuongtien ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_ten_chu_ghe, vaule: tenchughe ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_dt_chu_ghe, vaule: dienthoaichughe ?? "---"),
      KeyValueModel(key: S.of(context).txt_cmnd, vaule: cmnd ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_ngay_cap,
          vaule: ngaycap != null
              ? b.DateTimeHelper.formatDateTime(
                  ngaycap!, b.DateFormats.dd_MM_YYYY)
              : '--/--/----'),
      KeyValueModel(key: S.of(context).txt_noi_cap, vaule: noicap ?? "---"),
    ];
  }

  List<KeyValueModel> keyValueThuMua(BuildContext context) {
    //* tính thành tiền lại
    //* nếu chưa có tông tongkhoiluong_tru_tapchat và tongkhoiluong_tru_bao hoặc tongkhoiluong sẽ lấy mặc định sản lượng cân
    var tongkhoiluongCalc = ((tongkhoiluong ?? sanluongcan ?? 0) -
        ((tongkhoiluong_tru_bao ?? 0) + (tongkhoiluong_tru_tapchat ?? 0)));
    //Nếu chưa có thanhtien sẽ lấy tổng khối lượng cân * đơn giá
    var thanhtienCalc = tongkhoiluongCalc * (giachot ?? 0);
    return [
      KeyValueModel(
          key: S.of(context).txt_khu_ruong, vaule: tenkhuruong ?? "---"),
      KeyValueModel(key: S.of(context).txt_giong, vaule: tengiong ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_tieu_chuan, vaule: tieuchuan ?? "--"),
      KeyValueModel(
          key: S.of(context).txt_gia_thuong_luong,
          vaule: b.FormatHelper.numberToMoney3(giachot ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_dien_tich,
          vaule: b.FormatHelper.numberToMoney3(dientichchot ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_san_luong_can,
          vaule: b.FormatHelper.numberToMoney3(sanluongcan ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_so_bao,
          vaule: b.FormatHelper.numberToMoney3(sobao ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_tong_khoi_luong_tru_bao,
          vaule: b.FormatHelper.numberToMoney3(tongkhoiluong_tru_bao ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_khoi_luong_tru_tap_chat,
          vaule: b.FormatHelper.numberToMoney3(tongkhoiluong_tru_tapchat ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_tong_khoi_luong,
          vaule: b.FormatHelper.numberToMoney3(tongkhoiluongCalc)),
      KeyValueModel(
          key: S.of(context).txt_don_gia,
          vaule: b.FormatHelper.numberToMoney3(giachot ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_thanh_tien,
          vaule: b.FormatHelper.numberToMoney2(thanhtienCalc)),
    ];
  }
}

@JsonSerializable()
class VctmGheBean {
  String? mand;
  String? tennd;
  String? makhuruong;
  String? tenkhuruong;
  String? macaytrong;
  String? tencaytrong;
  String? magiong;
  String? tengiong;
  String? tieuchuan;
  num? dientichchot;
  num? sanluongdukien;
  String? ngaythuhoachdk;
  String? ngaycatchot;
  num? taitrongkenh;
  String? maghe;
  String? tenghe;
  String? sophuongtien;
  String? ngaylenghe;
  String? ngayghevenhamay;
  num? giachot;
  num? giavanchuyen;
  num? giabocxep;
  num? luongvanchuyen;
  String? createdby;
  DateTime? createdon;
  String? modifiedby;
  DateTime? modifiedon;
  num? thuhoachdieughechitietidenct;
  num? trangthaivc;
  String? tentrangthaivc;
  String? trangthaivcon;
  String? trangthaivcby;
  num? thanhtien;
  dynamic chkfile;
  String? madoighe;
  String? tendoighe;
  String? tenchughe;
  String? dienthoaichughe;
  String? cmnd;
  String? ngaycap;
  String? noicap;
  num? loaighe;
  String? gioghevenhamay;
  dynamic ngayhoanthanh;
  dynamic giohoanthanh;
  num? dongiathuong;
  String? denghiduyetgia;
  String? phulucso;
  String? tairuongby;
  String? tairuongat;
  dynamic dangvanchuyenby;
  dynamic dangvanchuyenat;
  dynamic tainhamayby;
  dynamic tainhamayat;
  dynamic hoanhthanhby;
  dynamic hoanhthanhat;
  String? ngayvenhamaybaocao;
  dynamic ngayhoanthanhbaocao;
  String? vanchuyenve;
  String? idct;
  bool? bacung_can;
  num? idenct;
  String? makenhbh;
  String? tenkenhbh;
  String? makhach;
  String? tenkhach;
  String? so_bbtm;
  num? sanluongcan;
  num? sobao;
  num? khoiluong_bao;
  num? tongkhoiluong_tru_bao;
  num? khoiluong_tapchat;
  num? tongkhoiluong_tru_tapchat;
  num? tongkhoiluong;
  dynamic sophieu;
  dynamic ngaylenghestr;
  dynamic ngayghevenhamaystr;
  dynamic ngaycatchotstr;
  dynamic ngaythuhoachdkstr;
  dynamic ngaycapstr;
  dynamic ngayhoanthanhstr;
  dynamic vanchuyenvetten;

  VctmGheBean(
      {this.mand,
      this.tennd,
      this.makhuruong,
      this.tenkhuruong,
      this.macaytrong,
      this.tencaytrong,
      this.magiong,
      this.tengiong,
      this.tieuchuan,
      this.dientichchot,
      this.bacung_can,
      this.sanluongdukien,
      this.ngaythuhoachdk,
      this.ngaycatchot,
      this.taitrongkenh,
      this.maghe,
      this.tenghe,
      this.sophuongtien,
      this.ngaylenghe,
      this.ngayghevenhamay,
      this.giachot,
      this.giavanchuyen,
      this.giabocxep,
      this.luongvanchuyen,
      this.createdby,
      this.createdon,
      this.modifiedby,
      this.modifiedon,
      this.thuhoachdieughechitietidenct,
      this.trangthaivc,
      this.tentrangthaivc,
      this.trangthaivcon,
      this.trangthaivcby,
      this.thanhtien,
      this.chkfile,
      this.madoighe,
      this.tendoighe,
      this.tenchughe,
      this.dienthoaichughe,
      this.cmnd,
      this.ngaycap,
      this.noicap,
      this.loaighe,
      this.gioghevenhamay,
      this.ngayhoanthanh,
      this.giohoanthanh,
      this.dongiathuong,
      this.denghiduyetgia,
      this.phulucso,
      this.tairuongby,
      this.tairuongat,
      this.dangvanchuyenby,
      this.dangvanchuyenat,
      this.tainhamayby,
      this.tainhamayat,
      this.hoanhthanhby,
      this.hoanhthanhat,
      this.ngayvenhamaybaocao,
      this.ngayhoanthanhbaocao,
      this.vanchuyenve,
      this.idct,
      this.idenct,
      this.makenhbh,
      this.tenkenhbh,
      this.makhach,
      this.tenkhach,
      this.so_bbtm,
      this.sanluongcan,
      this.sobao,
      this.khoiluong_bao,
      this.tongkhoiluong_tru_bao,
      this.khoiluong_tapchat,
      this.tongkhoiluong_tru_tapchat,
      this.tongkhoiluong,
      this.sophieu,
      this.ngaylenghestr,
      this.ngayghevenhamaystr,
      this.ngaycatchotstr,
      this.ngaythuhoachdkstr,
      this.ngaycapstr,
      this.ngayhoanthanhstr,
      this.vanchuyenvetten});

  factory VctmGheBean.fromJson(Map<String, dynamic> json) =>
      _$VctmGheBeanFromJson(json);

  Map<String, dynamic> toJson() => _$VctmGheBeanToJson(this);

  List<KeyValueModel> keyValueGhe(BuildContext context) {
    return [
      KeyValueModel(
          key: S.of(context).txt_gia_boc_xep,
          vaule: b.FormatHelper.numberToMoney3(giabocxep ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_gia_van_chuyen,
          vaule: b.FormatHelper.numberToMoney3(giavanchuyen ?? 0)),
      KeyValueModel(key: S.of(context).txt_ma_ghe, vaule: maghe ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_so_phuong_tien, vaule: sophuongtien ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_ten_chu_ghe, vaule: tenchughe ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_dt_chu_ghe, vaule: dienthoaichughe ?? "---"),
      KeyValueModel(key: S.of(context).txt_cmnd, vaule: cmnd ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_ngay_cap,
          vaule: ngaycap != null
              ? b.DateTimeHelper.formatDateTime(
                  ngaycap!, b.DateFormats.dd_MM_YYYY)
              : '--/--/----'),
      KeyValueModel(key: S.of(context).txt_noi_cap, vaule: noicap ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_ngay_len_ghe,
          vaule: ngaylenghe != null
              ? b.DateTimeHelper.formatDateTime(
                  ngaylenghe!, b.DateFormats.dd_MM_YYYY)
              : '--/--/----'),
    ];
  }

  List<KeyValueModel> keyValueThuMua(BuildContext context) {
    //* nếu chưa có tông tongkhoiluong_tru_tapchat và tongkhoiluong_tru_bao hoặc tongkhoiluong sẽ lấy mặc định sản lượng cân
    var tongkhoiluongCalc = ((tongkhoiluong ?? sanluongcan ?? 0) -
        ((tongkhoiluong_tru_bao ?? 0) + (tongkhoiluong_tru_tapchat ?? 0)));
    //* tính thành tiền lại
    //Nếu chưa có thanhtien sẽ lấy tổng khối lượng cân * đơn giá
    var thanhtienCalc = tongkhoiluongCalc * (giachot ?? 0);
    return [
      KeyValueModel(
          key: S.of(context).txt_khu_ruong, vaule: tenkhuruong ?? "---"),
      KeyValueModel(key: S.of(context).txt_giong, vaule: tengiong ?? "---"),
      KeyValueModel(
          key: S.of(context).txt_tieu_chuan, vaule: tieuchuan ?? "--"),
      KeyValueModel(
          key: S.of(context).txt_gia_thuong_luong,
          vaule: b.FormatHelper.numberToMoney3(dongiathuong ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_dien_tich,
          vaule: b.FormatHelper.numberToMoney3(dientichchot ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_san_luong_can,
          vaule: b.FormatHelper.numberToMoney3(sanluongcan ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_so_bao,
          vaule: b.FormatHelper.numberToMoney3(sobao ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_tong_khoi_luong_tru_bao,
          vaule: b.FormatHelper.numberToMoney3(tongkhoiluong_tru_bao ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_khoi_luong_tru_tap_chat,
          vaule: b.FormatHelper.numberToMoney3(tongkhoiluong_tru_tapchat ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_tong_khoi_luong,
          vaule: b.FormatHelper.numberToMoney3(tongkhoiluongCalc)),
      // vaule:"1÷11"),
      KeyValueModel(
          key: S.of(context).txt_don_gia,
          vaule: b.FormatHelper.numberToMoney3(giachot ?? 0)),
      KeyValueModel(
          key: S.of(context).txt_thanh_tien,
          vaule: b.FormatHelper.numberToMoney2(thanhtienCalc)),
    ];
  }
}
