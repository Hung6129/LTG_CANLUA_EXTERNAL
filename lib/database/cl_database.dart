// ignore_for_file: non_constant_identifier_names

import 'package:base_project/export.dart';
import 'package:drift/drift.dart';
import 'dart:io';
// These imports are only needed to open the database
import 'package:drift/native.dart';
import 'package:loctroi_canlua_external/database/convert_table.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';
import 'package:loctroi_canlua_external/models/so_phieu_filter_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'cl_table.dart';
part 'cl_database.g.dart';

class BagRiceWithTicket {
  BagRiceWithTicket(this.bag, this.ticket);

  final BagRices bag;
  final Tickets ticket;
}

@DriftDatabase(
  tables: [BagRices, Tickets, BagRicesDelete, DiaPhuong],
  queries: {
    // '_deleteTicket': 'DELETE FROM tickets WHERE sophieucan = ?',
    // '_deleteBagRices': 'DELETE FROM bagrices WHERE sophieucan = ?',
    // // '_insertBagRice':
    // //     'INSERT INTO bagrices (weight, name, sophieucan, ticket ) VALUES (?, ?, ?, ?)',
    // '_insertTicket':
    //     'INSERT INTO tickets (sophieucan, ngaycan, khuruong, tinh, huyen, xa, ghichu  ) VALUES (?, ?, ?, ? ,? ,? ,?)'
  },
)
class CLDatabase extends _$CLDatabase {
  CLDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  Future<int> createTicketEntry(TicketsCompanion entry) async {
    List<TicketEntry> lst = await (select(tickets)
          ..where((t) => t.sophieucan.equals(entry.sophieucan.value)))
        .get();
    if (lst.isNotEmpty) return lst.first.id;
    return into(tickets).insert(entry);
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          // we added the priority property in the change from version 1 or 2
          // to version 3
          await m.createTable(diaPhuong);
        }
      },
    );
  }

  //!kiểm tra nếu số phiếu ko tồn tại thì sẽ tiến hành insert
  ///ngược lại trả về 0 ==> ko insert đc
  Future<int> insertSP(SoPhieuFilterModel data) async {
    TicketsCompanion insertData =
        ConvertTableDB().convertSoPhieuFilterModelToDbCompanion(data);
    List<TicketEntry> lst = await (select(tickets)
          ..where((t) => t.sophieucan.equals(data.sophieucan)))
        .get();
    if (lst.isEmpty) {
      return into(tickets).insert(insertData);
    } else {
      return -1;
    }
  }

  //! delete hết các bao lúa với điều kiện số phiếu bằng số phiếu load data và idOnline khác null
  Future<int> deleteBagRicesOnlineBySoPhieuCan(String sophieucan) {
    return (delete(bagRices)
          ..where(
              (t) => t.idOnline.isNotNull() & t.sophieucan.equals(sophieucan)))
        .go();
  }

  //! insert danh sách số phiếu
  //* isCheckBagRice có kiểm tra các bao lúa khi insert không
  //* true: kiểm tra trùng và chỉ insert cái bao chưa có vào db
  //* false: insert tất cả vào db
  Future<void> insertMultipleSP(
      List<SoPhieuFilterModel> lstInsert, bool isCheckBagRice) async {
    List<TicketsCompanion> data = lstInsert
        .map((e) => ConvertTableDB().convertSoPhieuFilterModelToDbCompanion(e))
        .toList();
    await batch((batch) {
      batch.insertAll(tickets, data);
    });

    if (isCheckBagRice) {
      //! kiểm tra insert các bao lúa vào DB
      //* kiểm tra nếu bao lúa có ID online đã tồn tại trong DB local sẽ ko insert
      //* ngược lại sẽ insert vào DB
      for (var e in lstInsert) {
        if (e.canluaList != null && e.canluaList!.isNotEmpty) {
          //*map các id online => array id online
          List<int> ids = e.canluaList!.map((c) {
            return int.tryParse('${c.id}') ?? -1;
          }).toList();
          ids.removeWhere((element) => element == -1);
          //* get tất cả các bao lúa local theo id online
          List<BagRiceEntry> bags = await (select(bagRices)
                ..where(
                    (tbl) => tbl.idOnline.isNotNull() & tbl.idOnline.isIn(ids)))
              .get();
          //*nếu các id online không có trong danh sách cách bao lúa local ==> INSERT
          var lstIDBagRiceLocal = bags.map((blLC) => blLC.idOnline!).toList();
          List<BagRiceEntity> lstBLNeedInsert = e.canluaList!
              .where((bl) => !lstIDBagRiceLocal.contains(bl.id))
              .toList();
          await insertAllBagriceEntity(lstBLNeedInsert);
        }
      }
    } else {
      for (var e in lstInsert) {
        if (e.canluaList != null && e.canluaList!.isNotEmpty) {
          await insertAllBagriceEntity(e.canluaList ?? []);
        }
      }
    }
  }

  Future insertAllBagriceEntity(List<BagRiceEntity> bags) async {
    List<BagRicesCompanion> data = bags
        .map((e) => ConvertTableDB().convertBagRiceEntityToDbCompanion(e))
        .toList();
    await batch((batch) {
      try {
        batch.insertAll(bagRices, data);
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    });
  }

  //! Update và Set số phiếu async thành công
  Future<int> setSoPhieySyncSucces(int id) async {
    return await (update(tickets)..where((t) => t.id.equals(id)))
        .write(const TicketsCompanion(isSync: Value(true)));
  }

  //! Update và Set bao lua async thành công
  Future<int> setBagRiceSyncSucces(int id, int idOnline) async {
    return await (update(bagRices)..where((t) => t.id.equals(id))).write(
        BagRicesCompanion(
            isSync: const Value(true), idOnline: Value(idOnline)));
  }

  //! get số phiếu tạo gần đây nhất
  Future<SoPhieuFilterModel> getLastTicket() async {
    // TicketEntry ticketEntry = await (select(tickets)
    //       ..orderBy(
    //           [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
    //     .getSingle();
    List<TicketEntry> ticketEntry = await (select(tickets)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .get();

    return _convertToSoPhieuFilterModel(ticketEntry.first);
  }

  ///nếu ko có số phiếu cân nào cùng tên tồn tại sẽ cho phép update
  ///ngược lại trả về 0 ==> đã có số phiếu tồn tại
  Future<int> updateTicketById(int id, SoPhieuFilterModel data) async {
    TicketsCompanion insertData =
        ConvertTableDB().convertSoPhieuFilterModelToDbCompanion(data);
    List<TicketEntry> lst = await (select(tickets)
          ..where((t) => (t.sophieucan.equals(data.sophieucan))))
        .get();
    List<TicketEntry> lstOld =
        await (select(tickets)..where((t) => (t.id.equals(data.id)))).get();
    lst = lst.where((element) => element.id != data.id).toList();
    if (lst.isEmpty) {
      int rowTicketUpdate = await (update(tickets)
            ..where((t) => t.id.equals(id)))
          .write(insertData);
      if (rowTicketUpdate == 0) return 0;

      ///update all detail ticket
      await (update(bagRices)
            ..where((t) => t.sophieucan.equals(lstOld.first.sophieucan)))
          .write(BagRicesCompanion(sophieucan: Value(data.sophieucan!)));
      return rowTicketUpdate;
    } else {
      return 0;
    }
  }

  Future<List<TicketEntry>> getTicketBySoPhieu(String sophieucan) {
    return (select(tickets)..where((t) => t.sophieucan.equals(sophieucan)))
        .get();
  }

  //! Lấy số phiếu cân từ ngày đến ngày
  Future<List<SoPhieuFilterModel>> getTicketBetweenDate(
      DateTime from, DateTime to) async {
    List<SoPhieuFilterModel> result = [];
    List<TicketEntry> ticket = await (select(tickets)
          ..where((t) => t.ngaycandb.isBetweenValues(from, to))
          ..orderBy([
            (t) => OrderingTerm(expression: t.ngaycan , mode: OrderingMode.desc)
          ]))
        .get();

    Log.error("getTicketBetweenDate", "$from   $to");
    // List<TicketEntry> ticket = await (select(tickets)).get();
    result = ticket.map((e) => _convertToSoPhieuFilterModel(e)).toList();

    return result;
  }

  //! Cập nhật thông tin chung phiếu cân
  Future<SoPhieuFilterModel?> updateThongTinChungTicket(
      SoPhieuFilterModel soPhieu) async {
    var bags = await getAllBagRiceBySoPhieu(soPhieu.sophieucan!);
    //* tính sản lượng cân
    double slCan = 0;
    bags.map((e) => e.weight).forEach((element) {
      slCan = slCan + (element?.toDouble() ?? 0);
    });
    double soBao = bags.length.toDouble();

    double tongKL = slCan -
        (soPhieu.tongkhoiluong_tru_bao?.toDouble() ?? 0) -
        (soPhieu.tongkhoiluong_tru_tapchat?.toDouble() ?? 0);
    double thanhTien = tongKL * (soPhieu.giachot?.toDouble() ?? 0);

    int idUpdated = await (update(tickets)
          ..where((t) => t.id.equals(soPhieu.id)))
        .write(TicketsCompanion(
      tenkhuruong: Value(soPhieu.tenkhuruong),
      // ngaycandb: soPhieu.ngaycanstr != null
      //     ? Value(DateTimeHelper.getDate(soPhieu.ngaycanstr!,
      //         format: DateFormats.dd_MM_YYYY))
      //     : Value(DateTime.parse(soPhieu.ngaycan!)),
      // ngaycan: soPhieu.ngaycanstr != null
      //     ? Value(DateTimeHelper.getDateStrByDateTime(
      //         DateTimeHelper.getDate(soPhieu.ngaycanstr!,
      //             format: DateFormats.YEAR_MONTH_DAY_HOUR_MINUTE),
      //         format: DateFormats.YEAR_MONTH_DAY))
      //     : Value(DateTimeHelper.getDateStrByDateTime(
      //         DateTime.parse(soPhieu.ngaycan!),
      //         format: DateFormats.YEAR_MONTH_DAY)),
      ngaycan: Value(DateTimeHelper.getDateStrByDateTime(
          DateTime.parse(soPhieu.ngaycan!),
          format: DateFormats.YEAR_MONTH_DAY)),
      ngaycandb: Value(DateTime.parse(soPhieu.ngaycan!)),
      tengiong: Value(soPhieu.tengiong),
      tieuchuan: Value(soPhieu.tieuchuan),
      sobao: Value(soBao),
      sanluongcan: Value(slCan),
      thanhtien: Value(thanhTien),
      giachot: Value(double.tryParse('${soPhieu.giachot}') ?? 0),
      dientichchot: Value(double.tryParse('${soPhieu.dientichchot}') ?? 0),
      tongkhoiluong_tru_bao:
          Value(double.tryParse('${soPhieu.tongkhoiluong_tru_bao}') ?? 0),
      tongkhoiluong_tru_tapchat:
          Value(double.tryParse('${soPhieu.tongkhoiluong_tru_tapchat}') ?? 0),
    ));
    if (idUpdated > 0) {
      soPhieu.sobao = soBao;
      soPhieu.sanluongcan = slCan;
      return soPhieu;
    }
    return null;
  }

  //! Cập nhật thông tin ghe phiếu cân
  Future<SoPhieuFilterModel?> updateThongTinGHETicket(
      SoPhieuFilterModel soPhieu) async {
    int idUpdated = await (update(tickets)
          ..where((t) => t.id.equals(soPhieu.id)))
        .write(TicketsCompanion(
      sophuongtien: Value(soPhieu.sophuongtien),
      tenchughe: Value(soPhieu.tenchughe),
      dienthoaichughe: Value(soPhieu.dienthoaichughe),
      cmnd: soPhieu.cmnd != null ? Value(soPhieu.cmnd) : const Value(null),
      noicap:
          soPhieu.noicap != null ? Value(soPhieu.noicap) : const Value(null),
      ngaycap:
          soPhieu.ngaycap != null ? Value(soPhieu.ngaycap) : const Value(null),
    ));
    if (idUpdated > 0) {
      return soPhieu;
    }
    return null;
  }

  Future<BagRiceEntity?> createBagRicesEntry(BagRicesCompanion entry) async {
    int id = await into(bagRices).insert(entry);
    if (id > 0) {
      BagRiceEntity result = BagRiceEntity(
          idLocalDB: id,
          id: entry.idOnline.value,
          name: entry.name.value,
          sophieu: entry.sophieucan.value,
          weight: entry.weight.value);
      return result;
    }
    return null;
  }

  //! Lấy danh sách bao lúa theo số phiéu cân chưa sync
  Future<List<BagRiceEntity>> getBagRiceBySoPhieu(String sophieucan) async {
    List<BagRiceEntry> lst = await (select(bagRices)
          ..where(
              (t) => t.sophieucan.equals(sophieucan) & t.isSync.equals(false)))
        .get();
    return lst
        .map((e) => ConvertTableDB().convertBagRiceEntryToEntity(e))
        .toList();
  }

  //! Lấy danh sách bao lúa theo số phiéu cân
  Future<List<BagRiceEntity>> getAllBagRiceBySoPhieu(String sophieucan) async {
    List<BagRiceEntry> lst = await (select(bagRices)
          ..where((t) => t.sophieucan.equals(sophieucan)))
        .get();
    return lst
        .map((e) => ConvertTableDB().convertBagRiceEntryToEntity(e))
        .toList();
  }

  //! delete danh sách ID cân lúa đã selected
  Future<int> deleteBagRices(List<int> delIdLocalList) {
    return (delete(bagRices)..where((t) => t.id.isIn(delIdLocalList))).go();
  }

  //!insert list bagrices need delete when sync failed
  Future<void> insertQueueBagriceDelete(
      {required List<BagRiceEntity> bagRices,
      required String soPhieuCan,
      required String idCanLua}) async {
    List<BagRicesDeleteCompanion> data = bagRices
        .map((e) => BagRicesDeleteCompanion(
            idLocalBaoLua: Value(e.idLocalDB!),
            idOnlineBaoLua: Value(int.tryParse('${e.id}')),
            idCanLua: Value(idCanLua),
            sophieucan: Value(soPhieuCan)))
        .toList();
    await batch((batch) {
      batch.insertAll(bagRicesDelete, data);
    });
  }

  //!Lấy danh sách bagrices cần delete
  Future<List<BagRicesEntryDelete>> getBagRicesDelete() {
    return (select(bagRicesDelete)).get();
  }

  //!delete bagrices when sync success
  Future deleteQueueBagriceDelete(List<int> idsBagRice) async {
    return (delete(bagRicesDelete)..where((t) => t.id.isIn(idsBagRice))).go();
  }

// ignore: todo
// TODO ----------------------sync data offline----------------------------------
  //! Lấy danh sách các phiếu chưa sync
  Future<List<SoPhieuFilterModel>> getLstSpNotSync() async {
    List<TicketEntry> spNotSync =
        await (select(tickets)..where((t) => t.isSync.equals(false))).get();
    List<SoPhieuFilterModel> result =
        spNotSync.map((e) => _convertToSoPhieuFilterModel(e)).toList();

    // List<BagRiceEntity> bags = await getBagRicesNotSync();
    // if (bags.isNotEmpty) {
    //   for (var e in result) {
    //     e.canluaList = bags.where((b) => b.sophieucan == e.sophieucan).toList();
    //   }
    // }
    return result;
  }

  //! Lấy danh sách các bao cân chưa sync của 1 phiêu
  Future<List<BagRiceEntity>> getBagRicesNotSync() async {
    List<BagRiceEntry> bagNotSync =
        await (select(bagRices)..where((t) => t.isSync.equals(false))).get();

    List<BagRiceEntity> result = bagNotSync
        .map((e) => ConvertTableDB().convertBagRiceEntryToEntity(e))
        .toList();
    return result;
  }

// ignore: todo
// TODO ----------------------sync data offline----------------------------------

  //! insert danh sách số phiếu
  Future<void> insertMultipleDiaPhuong(List<BDiaPhuongEntity> lstInsert) async {
    List<DiaPhuongCompanion> data = lstInsert
        .map((e) => DiaPhuongCompanion(
              madp: Value(e.madp),
              tenkhac: Value(e.tenkhac),
              mapl: Value(e.mapl),
            ))
        .toList();
    await batch((batch) {
      batch.insertAll(diaPhuong, data);
    });
  }

  //! get all dia phuong
  Future<List<BDiaPhuongEntity>> getDiaPhuong() async {
    List<DiaPhuongEntry> dpDB = await (select(diaPhuong)).get();
    List<BDiaPhuongEntity> lst = dpDB
        .map((e) => BDiaPhuongEntity(
            madp: e.madp, tenkhac: e.tenkhac, tendp: e.tenkhac, mapl: e.mapl))
        .toList();
    return lst;
  }

  SoPhieuFilterModel _convertToSoPhieuFilterModel(TicketEntry e) {
    SoPhieuFilterModel result = SoPhieuFilterModel.fromJson(e.toJson());
    result.vctm_ghe = VctmGheBean.fromJson(e.toJson());
    result.isNotSync = !e.isSync;
    return result;
  }

//! Clean data
  Future<void> deleteEverything() {
    return transaction(() async {
      // you only need this if you've manually enabled foreign keys
      // await customStatement('PRAGMA foreign_keys = OFF');
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cl_db.sqlite'));
    return NativeDatabase(file);
  });
}
