import 'package:json_annotation/json_annotation.dart';
// ignore_for_file: depend_on_referenced_packages
part 'b_thu_mua_entity.g.dart';

@JsonSerializable()
class BThuMuaEntity {
  String? mand;
  @JsonKey(name: 'tennd')
  String? tenND;
  @JsonKey(name: 'makhuruong')
  String? maKhuRuong;
  @JsonKey(name: 'tenkhuruong')
  String? tenKhuRuong;
  @JsonKey(name: 'macaytrong')
  String? maCayTrong;
  @JsonKey(name: 'tencaytrong')
  String? tenCayTrong;
  @JsonKey(name: 'magiong')
  String? maGiong;
  @JsonKey(name: 'tengiong')
  String? tenGiong;
  @JsonKey(name: 'tieuchuan')
  String? tieuChuan;
  @JsonKey(name: 'dientichchot')
  num? dienTichChot;
  @JsonKey(name: 'sanluongdukien')
  num? sanLuongDuKien;
  @JsonKey(name: 'ngaythuhoachdk')
  String? ngayThuHoachDK;
  @JsonKey(name: 'ngaycatchot')
  String? ngayCatChot;
  @JsonKey(name: 'taitrongkenh')
  num? taiTrongKenh;
  @JsonKey(name: 'maghe')
  String? maGhe;
  @JsonKey(name: 'tenghe')
  String? tenGhe;
  @JsonKey(name: 'sophuongtien')
  String? soPhuongTien;
  @JsonKey(name: 'ngaylenghe')
  String? ngayLenGhe;
  @JsonKey(name: 'ngayghevenhamay')
  String? ngayGheVeNhaMay;
  @JsonKey(name: 'giachot')
  num? giaChot;
  @JsonKey(name: 'giavanchuyen')
  num? giaVanChuyen;
  @JsonKey(name: 'giabocxep')
  num? giaBocXep;
  @JsonKey(name: 'luongvanchuyen')
  num? luongVanChuyen;
  @JsonKey(name: 'createdby')
  String? createdBy;
  @JsonKey(name: 'createdon')
  String? createdOn;
  @JsonKey(name: 'modifiedby')
  String? modifiedBy;
  @JsonKey(name: 'modifiedon')
  String? modifiedOn;
  @JsonKey(name: 'thuhoachdieughechitietidenct')
  num? thuHoachDieuGheChiTietIdenct;
  @JsonKey(name: 'trangthaivc')
  num? trangThaiVC;
  @JsonKey(name: 'tentrangthaivc')
  String? tenTrangThaiVC;
  @JsonKey(name: 'trangthaivcon')
  String? trangThaiVCon;
  @JsonKey(name: 'trangthaivcby')
  String? trangThaiVCby;
  @JsonKey(name: 'thanhtien')
  num? thanhTien;
  @JsonKey(name: 'chkfile')
  dynamic chkfile;
  @JsonKey(name: 'madoighe')
  dynamic maDoiGhe;
  @JsonKey(name: 'tendoighe')
  dynamic tenDoiGhe;
  @JsonKey(name: 'tenchughe')
  String? tenChuGhe;
  @JsonKey(name: 'dienthoaichughe')
  dynamic dienThoaiChuGhe;
  @JsonKey(name: 'cmnd')
  String? cmnd;
  @JsonKey(name: 'ngaycap')
  String? ngayCap;
  @JsonKey(name: 'noicap')
  String? noiCap;
  @JsonKey(name: 'loaighe')
  dynamic loaiGhe;
  @JsonKey(name: 'gioghevenhamay')
  dynamic gioGheVeNhaMay;
  @JsonKey(name: 'ngayhoanthanh')
  dynamic ngayHoanThanh;
  @JsonKey(name: 'giohoanthanh')
  dynamic gioHoanThanh;
  @JsonKey(name: 'dongiathuong')
  num? donGiaThuong;
  @JsonKey(name: 'denghiduyetgia')
  String? deNghiDuyetGia;
  @JsonKey(name: 'phulucso')
  String? phuLucWo;
  @JsonKey(name: 'tairuongby')
  dynamic taiRuongBy;
  @JsonKey(name: 'tairuongat')
  dynamic taiRuongAt;
  @JsonKey(name: 'dangvanchuyenby')
  dynamic dangVanChuyenBy;
  @JsonKey(name: 'dangvanchuyenat')
  dynamic dangVanChuyenAt;
  @JsonKey(name: 'tainhamayby')
  dynamic taiNhaMayBy;
  @JsonKey(name: 'tainhamayat')
  dynamic taiNhaMayAt;
  @JsonKey(name: 'hoanhthanhby')
  dynamic hoanhThanhBy;
  @JsonKey(name: 'hoanhthanhat')
  dynamic hoanhThanhAt;
  @JsonKey(name: 'ngayvenhamaybaocao')
  dynamic ngayVeNhaMayBaoCao;
  @JsonKey(name: 'ngayhoanthanhbaocao')
  dynamic ngayHoanThanhBaoCao;
  @JsonKey(name: 'idct')
  String? idCt;
  @JsonKey(name: 'idenct')
  num? idEnCt;
  @JsonKey(name: 'makenhbh')
  String? maKenhBH;
  @JsonKey(name: 'tenkenhbh')
  String? tenKenhBH;
  @JsonKey(name: 'makhach')
  String? maKhach;
  @JsonKey(name: 'tenkhach')
  String? tenKhach;
  @JsonKey(name: 'so_bbtm')
  String? soBBTM;
  @JsonKey(name: 'vanchuyenve')
  String? vanchuyenve;
  @JsonKey(name: 'sophieu')
  String? sophieu;
  @JsonKey(name: 'vanchuyenvetten')
  String? vanchuyenvetten;
  @JsonKey(name: 'ngaylenghestr')
  dynamic ngayLenGhestr;
  @JsonKey(name: 'ngayghevenhamaystr')
  dynamic ngayGheVeNhaMayStr;
  @JsonKey(name: 'ngaycatchotstr')
  dynamic ngayCatChotStr;
  @JsonKey(name: 'ngaythuhoachdkstr')
  dynamic ngayThuHoachDkStr;
  @JsonKey(name: 'ngaycapstr')
  dynamic ngayCapStr;
  @JsonKey(name: 'ngayhoanthanhstr')
  dynamic ngayHoanThanhStr;
  @JsonKey(name: 'sophieucan')
  String? soPhieuCan;
  @JsonKey(name: 'bacung_can')
  bool? is3CCan;
  @JsonKey(name: 'ngay_bbtm')
  String? ngayBbtm;
  @JsonKey(name: 'cum_clc')
  String? cumClc;
  @JsonKey(name: 'ngaythuhoach_ct')
  String? ngayThuHoach;
  @JsonKey(name: 'gioxuatben')
  String? gioXuatBen;
  factory BThuMuaEntity.fromJson(Map<String, dynamic> json) =>
      _$BThuMuaEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BThuMuaEntityToJson(this);

  BThuMuaEntity(
      {this.mand,
      this.tenND,
      this.maKhuRuong,
      this.tenKhuRuong,
      this.maCayTrong,
      this.tenCayTrong,
      this.maGiong,
      this.tenGiong,
      this.tieuChuan,
      this.dienTichChot,
      this.sanLuongDuKien,
      this.ngayThuHoachDK,
      this.ngayCatChot,
      this.taiTrongKenh,
      this.maGhe,
      this.tenGhe,
      this.soPhuongTien,
      this.ngayLenGhe,
      this.ngayGheVeNhaMay,
      this.giaChot,
      this.giaVanChuyen,
      this.giaBocXep,
      this.luongVanChuyen,
      this.createdBy,
      this.createdOn,
      this.modifiedBy,
      this.modifiedOn,
      this.thuHoachDieuGheChiTietIdenct,
      this.trangThaiVC,
      this.tenTrangThaiVC,
      this.trangThaiVCon,
      this.trangThaiVCby,
      this.thanhTien,
      this.chkfile,
      this.maDoiGhe,
      this.tenDoiGhe,
      this.tenChuGhe,
      this.dienThoaiChuGhe,
      this.cmnd,
      this.ngayCap,
      this.noiCap,
      this.loaiGhe,
      this.gioGheVeNhaMay,
      this.ngayHoanThanh,
      this.gioHoanThanh,
      this.donGiaThuong,
      this.deNghiDuyetGia,
      this.phuLucWo,
      this.taiRuongBy,
      this.taiRuongAt,
      this.dangVanChuyenBy,
      this.dangVanChuyenAt,
      this.taiNhaMayBy,
      this.taiNhaMayAt,
      this.hoanhThanhBy,
      this.hoanhThanhAt,
      this.ngayVeNhaMayBaoCao,
      this.ngayHoanThanhBaoCao,
      this.idCt,
      this.idEnCt,
      this.maKenhBH,
      this.tenKenhBH,
      this.maKhach,
      this.tenKhach,
      this.soBBTM,
      this.ngayLenGhestr,
      this.ngayGheVeNhaMayStr,
      this.ngayCatChotStr,
      this.ngayThuHoachDkStr,
      this.is3CCan,
      this.ngayCapStr,
      this.vanchuyenve,
      this.vanchuyenvetten,
      this.sophieu,
      this.soPhieuCan,
      this.ngayHoanThanhStr});
}
