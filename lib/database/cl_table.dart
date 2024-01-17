// ignore_for_file: non_constant_identifier_names
import 'package:drift/drift.dart';

@DataClassName('BagRiceEntry')
class BagRices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idOnline => integer().nullable()();
  TextColumn get idCanLua => text().nullable()();
  RealColumn get weight => real()();
  TextColumn get name => text().nullable()();
  TextColumn get sophieucan => text()();
  //! Kiểm tra đã đồng bộ chưa
  BoolColumn get isSync => boolean()();
}

@DataClassName('BagRicesEntryDelete')
class BagRicesDelete extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idLocalBaoLua => integer()();
  IntColumn get idOnlineBaoLua => integer().nullable()();
  TextColumn get idCanLua => text()();
  TextColumn get sophieucan => text()();
}

@DataClassName('TicketEntry')
class Tickets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idenct => integer()();
  TextColumn get sophieucan => text()();
  TextColumn get sophieu => text().nullable()();
  TextColumn get so_bbtm => text().nullable()();
  DateTimeColumn get ngaycandb => dateTime().nullable()();
  DateTimeColumn get createdon => dateTime().nullable()();
  TextColumn get ngaycan => text().nullable()();
  TextColumn get mand => text().nullable()();
  TextColumn get tennd => text().nullable()();
  TextColumn get makhuruong => text().nullable()();
  TextColumn get idCanLua => text().nullable()();
  TextColumn get tenkhuruong => text().nullable()();
  TextColumn get tengiong => text().nullable()();
  TextColumn get magiong => text().nullable()();
  TextColumn get tencaytrong => text().nullable()();
  TextColumn get tieuchuan => text().nullable()();
  RealColumn get dientichchot => real().nullable()();
  RealColumn get sanluongdukien => real().nullable()();
  TextColumn get ngaythuhoachdk => text().nullable()();
  TextColumn get ngaycoghe => text().nullable()();
  TextColumn get ngaycoghestr => text().nullable()();
  RealColumn get taitrongkenh => real().nullable()();
  TextColumn get maghe => text().nullable()();
  TextColumn get tenghe => text().nullable()();
  TextColumn get sophuongtien => text().nullable()();
  TextColumn get ngaylenghe => text().nullable()();
  TextColumn get ngayghevenhamay => text().nullable()();
  RealColumn get giavanchuyen => real().nullable()();
  RealColumn get giabocxep => real().nullable()();
  RealColumn get luongvanchuyen => real().nullable()();
  RealColumn get thuhoachdieughechitietidenct => real().nullable()();
  RealColumn get trangthaivc => real().nullable()();
  TextColumn get tentrangthaivc => text().nullable()();
  RealColumn get thanhtien => real().nullable()();
  TextColumn get tenchughe => text().nullable()();
  TextColumn get dienthoaichughe => text().nullable()();
  TextColumn get cmnd => text().nullable()();
  TextColumn get ngaycap => text().nullable()();
  TextColumn get noicap => text().nullable()();
  IntColumn get loaighe => integer().nullable()();
  TextColumn get denghiduyetgia => text().nullable()();
  RealColumn get dongiathuong => real().nullable()();
  TextColumn get phulucso => text().nullable()();
  TextColumn get vanchuyenve => text().nullable()();
  TextColumn get idct => text().nullable()();
  TextColumn get makenhbh => text().nullable()();
  TextColumn get tenkenhbh => text().nullable()();
  TextColumn get makhach => text().nullable()();
  TextColumn get tenkhach => text().nullable()();
  RealColumn get sanluongcan => real().nullable()();
  RealColumn get sobao => real().nullable()();
  RealColumn get khoiluong_bao => real().nullable()();
  RealColumn get tongkhoiluong_tru_bao => real().nullable()();
  RealColumn get khoiluong_tapchat => real().nullable()();
  RealColumn get tongkhoiluong_tru_tapchat => real().nullable()();
  RealColumn get tongkhoiluong => real().nullable()();
  RealColumn get giachot => real().nullable()();
  BoolColumn get bacung_can => boolean().nullable()();

  TextColumn get tinh => text().nullable()();
  TextColumn get huyen => text().nullable()();
  TextColumn get xa => text().nullable()();
  TextColumn get tentinh => text().nullable()();
  TextColumn get tenhuyen => text().nullable()();
  TextColumn get tenxa => text().nullable()();
  TextColumn get ghichu => text().nullable()();
  //! Kiểm tra đã đồng bộ chưa
  BoolColumn get isSync => boolean()();
}

@DataClassName('DiaPhuongEntry')
class DiaPhuong extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get madp => text().nullable()();
  TextColumn get tenkhac => text().nullable()();
  TextColumn get mapl => text().nullable()();
}
