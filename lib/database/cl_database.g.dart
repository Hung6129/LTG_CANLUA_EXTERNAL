// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cl_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BagRiceEntry extends DataClass implements Insertable<BagRiceEntry> {
  final int id;
  final int? idOnline;
  final String? idCanLua;
  final double weight;
  final String? name;
  final String sophieucan;
  final bool isSync;
  BagRiceEntry(
      {required this.id,
      this.idOnline,
      this.idCanLua,
      required this.weight,
      this.name,
      required this.sophieucan,
      required this.isSync});
  factory BagRiceEntry.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BagRiceEntry(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idOnline: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_online']),
      idCanLua: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_can_lua']),
      weight: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      sophieucan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sophieucan'])!,
      isSync: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_sync'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || idOnline != null) {
      map['id_online'] = Variable<int?>(idOnline);
    }
    if (!nullToAbsent || idCanLua != null) {
      map['id_can_lua'] = Variable<String?>(idCanLua);
    }
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    map['sophieucan'] = Variable<String>(sophieucan);
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  BagRicesCompanion toCompanion(bool nullToAbsent) {
    return BagRicesCompanion(
      id: Value(id),
      idOnline: idOnline == null && nullToAbsent
          ? const Value.absent()
          : Value(idOnline),
      idCanLua: idCanLua == null && nullToAbsent
          ? const Value.absent()
          : Value(idCanLua),
      weight: Value(weight),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      sophieucan: Value(sophieucan),
      isSync: Value(isSync),
    );
  }

  factory BagRiceEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BagRiceEntry(
      id: serializer.fromJson<int>(json['id']),
      idOnline: serializer.fromJson<int?>(json['idOnline']),
      idCanLua: serializer.fromJson<String?>(json['idCanLua']),
      weight: serializer.fromJson<double>(json['weight']),
      name: serializer.fromJson<String?>(json['name']),
      sophieucan: serializer.fromJson<String>(json['sophieucan']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idOnline': serializer.toJson<int?>(idOnline),
      'idCanLua': serializer.toJson<String?>(idCanLua),
      'weight': serializer.toJson<double>(weight),
      'name': serializer.toJson<String?>(name),
      'sophieucan': serializer.toJson<String>(sophieucan),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  BagRiceEntry copyWith(
          {int? id,
          int? idOnline,
          String? idCanLua,
          double? weight,
          String? name,
          String? sophieucan,
          bool? isSync}) =>
      BagRiceEntry(
        id: id ?? this.id,
        idOnline: idOnline ?? this.idOnline,
        idCanLua: idCanLua ?? this.idCanLua,
        weight: weight ?? this.weight,
        name: name ?? this.name,
        sophieucan: sophieucan ?? this.sophieucan,
        isSync: isSync ?? this.isSync,
      );
  @override
  String toString() {
    return (StringBuffer('BagRiceEntry(')
          ..write('id: $id, ')
          ..write('idOnline: $idOnline, ')
          ..write('idCanLua: $idCanLua, ')
          ..write('weight: $weight, ')
          ..write('name: $name, ')
          ..write('sophieucan: $sophieucan, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idOnline, idCanLua, weight, name, sophieucan, isSync);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BagRiceEntry &&
          other.id == this.id &&
          other.idOnline == this.idOnline &&
          other.idCanLua == this.idCanLua &&
          other.weight == this.weight &&
          other.name == this.name &&
          other.sophieucan == this.sophieucan &&
          other.isSync == this.isSync);
}

class BagRicesCompanion extends UpdateCompanion<BagRiceEntry> {
  final Value<int> id;
  final Value<int?> idOnline;
  final Value<String?> idCanLua;
  final Value<double> weight;
  final Value<String?> name;
  final Value<String> sophieucan;
  final Value<bool> isSync;
  const BagRicesCompanion({
    this.id = const Value.absent(),
    this.idOnline = const Value.absent(),
    this.idCanLua = const Value.absent(),
    this.weight = const Value.absent(),
    this.name = const Value.absent(),
    this.sophieucan = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  BagRicesCompanion.insert({
    this.id = const Value.absent(),
    this.idOnline = const Value.absent(),
    this.idCanLua = const Value.absent(),
    required double weight,
    this.name = const Value.absent(),
    required String sophieucan,
    required bool isSync,
  })  : weight = Value(weight),
        sophieucan = Value(sophieucan),
        isSync = Value(isSync);
  static Insertable<BagRiceEntry> custom({
    Expression<int>? id,
    Expression<int?>? idOnline,
    Expression<String?>? idCanLua,
    Expression<double>? weight,
    Expression<String?>? name,
    Expression<String>? sophieucan,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idOnline != null) 'id_online': idOnline,
      if (idCanLua != null) 'id_can_lua': idCanLua,
      if (weight != null) 'weight': weight,
      if (name != null) 'name': name,
      if (sophieucan != null) 'sophieucan': sophieucan,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  BagRicesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? idOnline,
      Value<String?>? idCanLua,
      Value<double>? weight,
      Value<String?>? name,
      Value<String>? sophieucan,
      Value<bool>? isSync}) {
    return BagRicesCompanion(
      id: id ?? this.id,
      idOnline: idOnline ?? this.idOnline,
      idCanLua: idCanLua ?? this.idCanLua,
      weight: weight ?? this.weight,
      name: name ?? this.name,
      sophieucan: sophieucan ?? this.sophieucan,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idOnline.present) {
      map['id_online'] = Variable<int?>(idOnline.value);
    }
    if (idCanLua.present) {
      map['id_can_lua'] = Variable<String?>(idCanLua.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (sophieucan.present) {
      map['sophieucan'] = Variable<String>(sophieucan.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BagRicesCompanion(')
          ..write('id: $id, ')
          ..write('idOnline: $idOnline, ')
          ..write('idCanLua: $idCanLua, ')
          ..write('weight: $weight, ')
          ..write('name: $name, ')
          ..write('sophieucan: $sophieucan, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $BagRicesTable extends BagRices
    with TableInfo<$BagRicesTable, BagRiceEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BagRicesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idOnlineMeta = const VerificationMeta('idOnline');
  @override
  late final GeneratedColumn<int?> idOnline = GeneratedColumn<int?>(
      'id_online', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _idCanLuaMeta = const VerificationMeta('idCanLua');
  @override
  late final GeneratedColumn<String?> idCanLua = GeneratedColumn<String?>(
      'id_can_lua', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double?> weight = GeneratedColumn<double?>(
      'weight', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _sophieucanMeta = const VerificationMeta('sophieucan');
  @override
  late final GeneratedColumn<String?> sophieucan = GeneratedColumn<String?>(
      'sophieucan', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool?> isSync = GeneratedColumn<bool?>(
      'is_sync', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_sync IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [id, idOnline, idCanLua, weight, name, sophieucan, isSync];
  @override
  String get aliasedName => _alias ?? 'bag_rices';
  @override
  String get actualTableName => 'bag_rices';
  @override
  VerificationContext validateIntegrity(Insertable<BagRiceEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_online')) {
      context.handle(_idOnlineMeta,
          idOnline.isAcceptableOrUnknown(data['id_online']!, _idOnlineMeta));
    }
    if (data.containsKey('id_can_lua')) {
      context.handle(_idCanLuaMeta,
          idCanLua.isAcceptableOrUnknown(data['id_can_lua']!, _idCanLuaMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('sophieucan')) {
      context.handle(
          _sophieucanMeta,
          sophieucan.isAcceptableOrUnknown(
              data['sophieucan']!, _sophieucanMeta));
    } else if (isInserting) {
      context.missing(_sophieucanMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    } else if (isInserting) {
      context.missing(_isSyncMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BagRiceEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BagRiceEntry.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BagRicesTable createAlias(String alias) {
    return $BagRicesTable(attachedDatabase, alias);
  }
}

class TicketEntry extends DataClass implements Insertable<TicketEntry> {
  final int id;
  final int idenct;
  final String sophieucan;
  final String? sophieu;
  final String? so_bbtm;
  final DateTime? ngaycandb;
  final DateTime? createdon;
  final String? ngaycan;
  final String? mand;
  final String? tennd;
  final String? makhuruong;
  final String? idCanLua;
  final String? tenkhuruong;
  final String? tengiong;
  final String? magiong;
  final String? tencaytrong;
  final String? tieuchuan;
  final double? dientichchot;
  final double? sanluongdukien;
  final String? ngaythuhoachdk;
  final String? ngaycoghe;
  final String? ngaycoghestr;
  final double? taitrongkenh;
  final String? maghe;
  final String? tenghe;
  final String? sophuongtien;
  final String? ngaylenghe;
  final String? ngayghevenhamay;
  final double? giavanchuyen;
  final double? giabocxep;
  final double? luongvanchuyen;
  final double? thuhoachdieughechitietidenct;
  final double? trangthaivc;
  final String? tentrangthaivc;
  final double? thanhtien;
  final String? tenchughe;
  final String? dienthoaichughe;
  final String? cmnd;
  final String? ngaycap;
  final String? noicap;
  final int? loaighe;
  final String? denghiduyetgia;
  final double? dongiathuong;
  final String? phulucso;
  final String? vanchuyenve;
  final String? idct;
  final String? makenhbh;
  final String? tenkenhbh;
  final String? makhach;
  final String? tenkhach;
  final double? sanluongcan;
  final double? sobao;
  final double? khoiluong_bao;
  final double? tongkhoiluong_tru_bao;
  final double? khoiluong_tapchat;
  final double? tongkhoiluong_tru_tapchat;
  final double? tongkhoiluong;
  final double? giachot;
  final bool? bacung_can;
  final String? tinh;
  final String? huyen;
  final String? xa;
  final String? tentinh;
  final String? tenhuyen;
  final String? tenxa;
  final String? ghichu;
  final bool isSync;
  TicketEntry(
      {required this.id,
      required this.idenct,
      required this.sophieucan,
      this.sophieu,
      this.so_bbtm,
      this.ngaycandb,
      this.createdon,
      this.ngaycan,
      this.mand,
      this.tennd,
      this.makhuruong,
      this.idCanLua,
      this.tenkhuruong,
      this.tengiong,
      this.magiong,
      this.tencaytrong,
      this.tieuchuan,
      this.dientichchot,
      this.sanluongdukien,
      this.ngaythuhoachdk,
      this.ngaycoghe,
      this.ngaycoghestr,
      this.taitrongkenh,
      this.maghe,
      this.tenghe,
      this.sophuongtien,
      this.ngaylenghe,
      this.ngayghevenhamay,
      this.giavanchuyen,
      this.giabocxep,
      this.luongvanchuyen,
      this.thuhoachdieughechitietidenct,
      this.trangthaivc,
      this.tentrangthaivc,
      this.thanhtien,
      this.tenchughe,
      this.dienthoaichughe,
      this.cmnd,
      this.ngaycap,
      this.noicap,
      this.loaighe,
      this.denghiduyetgia,
      this.dongiathuong,
      this.phulucso,
      this.vanchuyenve,
      this.idct,
      this.makenhbh,
      this.tenkenhbh,
      this.makhach,
      this.tenkhach,
      this.sanluongcan,
      this.sobao,
      this.khoiluong_bao,
      this.tongkhoiluong_tru_bao,
      this.khoiluong_tapchat,
      this.tongkhoiluong_tru_tapchat,
      this.tongkhoiluong,
      this.giachot,
      this.bacung_can,
      this.tinh,
      this.huyen,
      this.xa,
      this.tentinh,
      this.tenhuyen,
      this.tenxa,
      this.ghichu,
      required this.isSync});
  factory TicketEntry.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TicketEntry(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idenct: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idenct'])!,
      sophieucan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sophieucan'])!,
      sophieu: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sophieu']),
      so_bbtm: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}so_bbtm']),
      ngaycandb: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngaycandb']),
      createdon: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}createdon']),
      ngaycan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngaycan']),
      mand: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mand']),
      tennd: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tennd']),
      makhuruong: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}makhuruong']),
      idCanLua: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_can_lua']),
      tenkhuruong: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenkhuruong']),
      tengiong: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tengiong']),
      magiong: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}magiong']),
      tencaytrong: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tencaytrong']),
      tieuchuan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tieuchuan']),
      dientichchot: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dientichchot']),
      sanluongdukien: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sanluongdukien']),
      ngaythuhoachdk: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngaythuhoachdk']),
      ngaycoghe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngaycoghe']),
      ngaycoghestr: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngaycoghestr']),
      taitrongkenh: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}taitrongkenh']),
      maghe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}maghe']),
      tenghe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenghe']),
      sophuongtien: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sophuongtien']),
      ngaylenghe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngaylenghe']),
      ngayghevenhamay: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngayghevenhamay']),
      giavanchuyen: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}giavanchuyen']),
      giabocxep: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}giabocxep']),
      luongvanchuyen: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}luongvanchuyen']),
      thuhoachdieughechitietidenct: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}thuhoachdieughechitietidenct']),
      trangthaivc: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}trangthaivc']),
      tentrangthaivc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tentrangthaivc']),
      thanhtien: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thanhtien']),
      tenchughe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenchughe']),
      dienthoaichughe: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dienthoaichughe']),
      cmnd: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cmnd']),
      ngaycap: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ngaycap']),
      noicap: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}noicap']),
      loaighe: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}loaighe']),
      denghiduyetgia: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}denghiduyetgia']),
      dongiathuong: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dongiathuong']),
      phulucso: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phulucso']),
      vanchuyenve: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}vanchuyenve']),
      idct: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}idct']),
      makenhbh: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}makenhbh']),
      tenkenhbh: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenkenhbh']),
      makhach: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}makhach']),
      tenkhach: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenkhach']),
      sanluongcan: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sanluongcan']),
      sobao: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sobao']),
      khoiluong_bao: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}khoiluong_bao']),
      tongkhoiluong_tru_bao: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}tongkhoiluong_tru_bao']),
      khoiluong_tapchat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}khoiluong_tapchat']),
      tongkhoiluong_tru_tapchat: const RealType().mapFromDatabaseResponse(
          data['${effectivePrefix}tongkhoiluong_tru_tapchat']),
      tongkhoiluong: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tongkhoiluong']),
      giachot: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}giachot']),
      bacung_can: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bacung_can']),
      tinh: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tinh']),
      huyen: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}huyen']),
      xa: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}xa']),
      tentinh: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tentinh']),
      tenhuyen: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenhuyen']),
      tenxa: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenxa']),
      ghichu: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}ghichu']),
      isSync: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_sync'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['idenct'] = Variable<int>(idenct);
    map['sophieucan'] = Variable<String>(sophieucan);
    if (!nullToAbsent || sophieu != null) {
      map['sophieu'] = Variable<String?>(sophieu);
    }
    if (!nullToAbsent || so_bbtm != null) {
      map['so_bbtm'] = Variable<String?>(so_bbtm);
    }
    if (!nullToAbsent || ngaycandb != null) {
      map['ngaycandb'] = Variable<DateTime?>(ngaycandb);
    }
    if (!nullToAbsent || createdon != null) {
      map['createdon'] = Variable<DateTime?>(createdon);
    }
    if (!nullToAbsent || ngaycan != null) {
      map['ngaycan'] = Variable<String?>(ngaycan);
    }
    if (!nullToAbsent || mand != null) {
      map['mand'] = Variable<String?>(mand);
    }
    if (!nullToAbsent || tennd != null) {
      map['tennd'] = Variable<String?>(tennd);
    }
    if (!nullToAbsent || makhuruong != null) {
      map['makhuruong'] = Variable<String?>(makhuruong);
    }
    if (!nullToAbsent || idCanLua != null) {
      map['id_can_lua'] = Variable<String?>(idCanLua);
    }
    if (!nullToAbsent || tenkhuruong != null) {
      map['tenkhuruong'] = Variable<String?>(tenkhuruong);
    }
    if (!nullToAbsent || tengiong != null) {
      map['tengiong'] = Variable<String?>(tengiong);
    }
    if (!nullToAbsent || magiong != null) {
      map['magiong'] = Variable<String?>(magiong);
    }
    if (!nullToAbsent || tencaytrong != null) {
      map['tencaytrong'] = Variable<String?>(tencaytrong);
    }
    if (!nullToAbsent || tieuchuan != null) {
      map['tieuchuan'] = Variable<String?>(tieuchuan);
    }
    if (!nullToAbsent || dientichchot != null) {
      map['dientichchot'] = Variable<double?>(dientichchot);
    }
    if (!nullToAbsent || sanluongdukien != null) {
      map['sanluongdukien'] = Variable<double?>(sanluongdukien);
    }
    if (!nullToAbsent || ngaythuhoachdk != null) {
      map['ngaythuhoachdk'] = Variable<String?>(ngaythuhoachdk);
    }
    if (!nullToAbsent || ngaycoghe != null) {
      map['ngaycoghe'] = Variable<String?>(ngaycoghe);
    }
    if (!nullToAbsent || ngaycoghestr != null) {
      map['ngaycoghestr'] = Variable<String?>(ngaycoghestr);
    }
    if (!nullToAbsent || taitrongkenh != null) {
      map['taitrongkenh'] = Variable<double?>(taitrongkenh);
    }
    if (!nullToAbsent || maghe != null) {
      map['maghe'] = Variable<String?>(maghe);
    }
    if (!nullToAbsent || tenghe != null) {
      map['tenghe'] = Variable<String?>(tenghe);
    }
    if (!nullToAbsent || sophuongtien != null) {
      map['sophuongtien'] = Variable<String?>(sophuongtien);
    }
    if (!nullToAbsent || ngaylenghe != null) {
      map['ngaylenghe'] = Variable<String?>(ngaylenghe);
    }
    if (!nullToAbsent || ngayghevenhamay != null) {
      map['ngayghevenhamay'] = Variable<String?>(ngayghevenhamay);
    }
    if (!nullToAbsent || giavanchuyen != null) {
      map['giavanchuyen'] = Variable<double?>(giavanchuyen);
    }
    if (!nullToAbsent || giabocxep != null) {
      map['giabocxep'] = Variable<double?>(giabocxep);
    }
    if (!nullToAbsent || luongvanchuyen != null) {
      map['luongvanchuyen'] = Variable<double?>(luongvanchuyen);
    }
    if (!nullToAbsent || thuhoachdieughechitietidenct != null) {
      map['thuhoachdieughechitietidenct'] =
          Variable<double?>(thuhoachdieughechitietidenct);
    }
    if (!nullToAbsent || trangthaivc != null) {
      map['trangthaivc'] = Variable<double?>(trangthaivc);
    }
    if (!nullToAbsent || tentrangthaivc != null) {
      map['tentrangthaivc'] = Variable<String?>(tentrangthaivc);
    }
    if (!nullToAbsent || thanhtien != null) {
      map['thanhtien'] = Variable<double?>(thanhtien);
    }
    if (!nullToAbsent || tenchughe != null) {
      map['tenchughe'] = Variable<String?>(tenchughe);
    }
    if (!nullToAbsent || dienthoaichughe != null) {
      map['dienthoaichughe'] = Variable<String?>(dienthoaichughe);
    }
    if (!nullToAbsent || cmnd != null) {
      map['cmnd'] = Variable<String?>(cmnd);
    }
    if (!nullToAbsent || ngaycap != null) {
      map['ngaycap'] = Variable<String?>(ngaycap);
    }
    if (!nullToAbsent || noicap != null) {
      map['noicap'] = Variable<String?>(noicap);
    }
    if (!nullToAbsent || loaighe != null) {
      map['loaighe'] = Variable<int?>(loaighe);
    }
    if (!nullToAbsent || denghiduyetgia != null) {
      map['denghiduyetgia'] = Variable<String?>(denghiduyetgia);
    }
    if (!nullToAbsent || dongiathuong != null) {
      map['dongiathuong'] = Variable<double?>(dongiathuong);
    }
    if (!nullToAbsent || phulucso != null) {
      map['phulucso'] = Variable<String?>(phulucso);
    }
    if (!nullToAbsent || vanchuyenve != null) {
      map['vanchuyenve'] = Variable<String?>(vanchuyenve);
    }
    if (!nullToAbsent || idct != null) {
      map['idct'] = Variable<String?>(idct);
    }
    if (!nullToAbsent || makenhbh != null) {
      map['makenhbh'] = Variable<String?>(makenhbh);
    }
    if (!nullToAbsent || tenkenhbh != null) {
      map['tenkenhbh'] = Variable<String?>(tenkenhbh);
    }
    if (!nullToAbsent || makhach != null) {
      map['makhach'] = Variable<String?>(makhach);
    }
    if (!nullToAbsent || tenkhach != null) {
      map['tenkhach'] = Variable<String?>(tenkhach);
    }
    if (!nullToAbsent || sanluongcan != null) {
      map['sanluongcan'] = Variable<double?>(sanluongcan);
    }
    if (!nullToAbsent || sobao != null) {
      map['sobao'] = Variable<double?>(sobao);
    }
    if (!nullToAbsent || khoiluong_bao != null) {
      map['khoiluong_bao'] = Variable<double?>(khoiluong_bao);
    }
    if (!nullToAbsent || tongkhoiluong_tru_bao != null) {
      map['tongkhoiluong_tru_bao'] = Variable<double?>(tongkhoiluong_tru_bao);
    }
    if (!nullToAbsent || khoiluong_tapchat != null) {
      map['khoiluong_tapchat'] = Variable<double?>(khoiluong_tapchat);
    }
    if (!nullToAbsent || tongkhoiluong_tru_tapchat != null) {
      map['tongkhoiluong_tru_tapchat'] =
          Variable<double?>(tongkhoiluong_tru_tapchat);
    }
    if (!nullToAbsent || tongkhoiluong != null) {
      map['tongkhoiluong'] = Variable<double?>(tongkhoiluong);
    }
    if (!nullToAbsent || giachot != null) {
      map['giachot'] = Variable<double?>(giachot);
    }
    if (!nullToAbsent || bacung_can != null) {
      map['bacung_can'] = Variable<bool?>(bacung_can);
    }
    if (!nullToAbsent || tinh != null) {
      map['tinh'] = Variable<String?>(tinh);
    }
    if (!nullToAbsent || huyen != null) {
      map['huyen'] = Variable<String?>(huyen);
    }
    if (!nullToAbsent || xa != null) {
      map['xa'] = Variable<String?>(xa);
    }
    if (!nullToAbsent || tentinh != null) {
      map['tentinh'] = Variable<String?>(tentinh);
    }
    if (!nullToAbsent || tenhuyen != null) {
      map['tenhuyen'] = Variable<String?>(tenhuyen);
    }
    if (!nullToAbsent || tenxa != null) {
      map['tenxa'] = Variable<String?>(tenxa);
    }
    if (!nullToAbsent || ghichu != null) {
      map['ghichu'] = Variable<String?>(ghichu);
    }
    map['is_sync'] = Variable<bool>(isSync);
    return map;
  }

  TicketsCompanion toCompanion(bool nullToAbsent) {
    return TicketsCompanion(
      id: Value(id),
      idenct: Value(idenct),
      sophieucan: Value(sophieucan),
      sophieu: sophieu == null && nullToAbsent
          ? const Value.absent()
          : Value(sophieu),
      so_bbtm: so_bbtm == null && nullToAbsent
          ? const Value.absent()
          : Value(so_bbtm),
      ngaycandb: ngaycandb == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaycandb),
      createdon: createdon == null && nullToAbsent
          ? const Value.absent()
          : Value(createdon),
      ngaycan: ngaycan == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaycan),
      mand: mand == null && nullToAbsent ? const Value.absent() : Value(mand),
      tennd:
          tennd == null && nullToAbsent ? const Value.absent() : Value(tennd),
      makhuruong: makhuruong == null && nullToAbsent
          ? const Value.absent()
          : Value(makhuruong),
      idCanLua: idCanLua == null && nullToAbsent
          ? const Value.absent()
          : Value(idCanLua),
      tenkhuruong: tenkhuruong == null && nullToAbsent
          ? const Value.absent()
          : Value(tenkhuruong),
      tengiong: tengiong == null && nullToAbsent
          ? const Value.absent()
          : Value(tengiong),
      magiong: magiong == null && nullToAbsent
          ? const Value.absent()
          : Value(magiong),
      tencaytrong: tencaytrong == null && nullToAbsent
          ? const Value.absent()
          : Value(tencaytrong),
      tieuchuan: tieuchuan == null && nullToAbsent
          ? const Value.absent()
          : Value(tieuchuan),
      dientichchot: dientichchot == null && nullToAbsent
          ? const Value.absent()
          : Value(dientichchot),
      sanluongdukien: sanluongdukien == null && nullToAbsent
          ? const Value.absent()
          : Value(sanluongdukien),
      ngaythuhoachdk: ngaythuhoachdk == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaythuhoachdk),
      ngaycoghe: ngaycoghe == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaycoghe),
      ngaycoghestr: ngaycoghestr == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaycoghestr),
      taitrongkenh: taitrongkenh == null && nullToAbsent
          ? const Value.absent()
          : Value(taitrongkenh),
      maghe:
          maghe == null && nullToAbsent ? const Value.absent() : Value(maghe),
      tenghe:
          tenghe == null && nullToAbsent ? const Value.absent() : Value(tenghe),
      sophuongtien: sophuongtien == null && nullToAbsent
          ? const Value.absent()
          : Value(sophuongtien),
      ngaylenghe: ngaylenghe == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaylenghe),
      ngayghevenhamay: ngayghevenhamay == null && nullToAbsent
          ? const Value.absent()
          : Value(ngayghevenhamay),
      giavanchuyen: giavanchuyen == null && nullToAbsent
          ? const Value.absent()
          : Value(giavanchuyen),
      giabocxep: giabocxep == null && nullToAbsent
          ? const Value.absent()
          : Value(giabocxep),
      luongvanchuyen: luongvanchuyen == null && nullToAbsent
          ? const Value.absent()
          : Value(luongvanchuyen),
      thuhoachdieughechitietidenct:
          thuhoachdieughechitietidenct == null && nullToAbsent
              ? const Value.absent()
              : Value(thuhoachdieughechitietidenct),
      trangthaivc: trangthaivc == null && nullToAbsent
          ? const Value.absent()
          : Value(trangthaivc),
      tentrangthaivc: tentrangthaivc == null && nullToAbsent
          ? const Value.absent()
          : Value(tentrangthaivc),
      thanhtien: thanhtien == null && nullToAbsent
          ? const Value.absent()
          : Value(thanhtien),
      tenchughe: tenchughe == null && nullToAbsent
          ? const Value.absent()
          : Value(tenchughe),
      dienthoaichughe: dienthoaichughe == null && nullToAbsent
          ? const Value.absent()
          : Value(dienthoaichughe),
      cmnd: cmnd == null && nullToAbsent ? const Value.absent() : Value(cmnd),
      ngaycap: ngaycap == null && nullToAbsent
          ? const Value.absent()
          : Value(ngaycap),
      noicap:
          noicap == null && nullToAbsent ? const Value.absent() : Value(noicap),
      loaighe: loaighe == null && nullToAbsent
          ? const Value.absent()
          : Value(loaighe),
      denghiduyetgia: denghiduyetgia == null && nullToAbsent
          ? const Value.absent()
          : Value(denghiduyetgia),
      dongiathuong: dongiathuong == null && nullToAbsent
          ? const Value.absent()
          : Value(dongiathuong),
      phulucso: phulucso == null && nullToAbsent
          ? const Value.absent()
          : Value(phulucso),
      vanchuyenve: vanchuyenve == null && nullToAbsent
          ? const Value.absent()
          : Value(vanchuyenve),
      idct: idct == null && nullToAbsent ? const Value.absent() : Value(idct),
      makenhbh: makenhbh == null && nullToAbsent
          ? const Value.absent()
          : Value(makenhbh),
      tenkenhbh: tenkenhbh == null && nullToAbsent
          ? const Value.absent()
          : Value(tenkenhbh),
      makhach: makhach == null && nullToAbsent
          ? const Value.absent()
          : Value(makhach),
      tenkhach: tenkhach == null && nullToAbsent
          ? const Value.absent()
          : Value(tenkhach),
      sanluongcan: sanluongcan == null && nullToAbsent
          ? const Value.absent()
          : Value(sanluongcan),
      sobao:
          sobao == null && nullToAbsent ? const Value.absent() : Value(sobao),
      khoiluong_bao: khoiluong_bao == null && nullToAbsent
          ? const Value.absent()
          : Value(khoiluong_bao),
      tongkhoiluong_tru_bao: tongkhoiluong_tru_bao == null && nullToAbsent
          ? const Value.absent()
          : Value(tongkhoiluong_tru_bao),
      khoiluong_tapchat: khoiluong_tapchat == null && nullToAbsent
          ? const Value.absent()
          : Value(khoiluong_tapchat),
      tongkhoiluong_tru_tapchat:
          tongkhoiluong_tru_tapchat == null && nullToAbsent
              ? const Value.absent()
              : Value(tongkhoiluong_tru_tapchat),
      tongkhoiluong: tongkhoiluong == null && nullToAbsent
          ? const Value.absent()
          : Value(tongkhoiluong),
      giachot: giachot == null && nullToAbsent
          ? const Value.absent()
          : Value(giachot),
      bacung_can: bacung_can == null && nullToAbsent
          ? const Value.absent()
          : Value(bacung_can),
      tinh: tinh == null && nullToAbsent ? const Value.absent() : Value(tinh),
      huyen:
          huyen == null && nullToAbsent ? const Value.absent() : Value(huyen),
      xa: xa == null && nullToAbsent ? const Value.absent() : Value(xa),
      tentinh: tentinh == null && nullToAbsent
          ? const Value.absent()
          : Value(tentinh),
      tenhuyen: tenhuyen == null && nullToAbsent
          ? const Value.absent()
          : Value(tenhuyen),
      tenxa:
          tenxa == null && nullToAbsent ? const Value.absent() : Value(tenxa),
      ghichu:
          ghichu == null && nullToAbsent ? const Value.absent() : Value(ghichu),
      isSync: Value(isSync),
    );
  }

  factory TicketEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TicketEntry(
      id: serializer.fromJson<int>(json['id']),
      idenct: serializer.fromJson<int>(json['idenct']),
      sophieucan: serializer.fromJson<String>(json['sophieucan']),
      sophieu: serializer.fromJson<String?>(json['sophieu']),
      so_bbtm: serializer.fromJson<String?>(json['so_bbtm']),
      ngaycandb: serializer.fromJson<DateTime?>(json['ngaycandb']),
      createdon: serializer.fromJson<DateTime?>(json['createdon']),
      ngaycan: serializer.fromJson<String?>(json['ngaycan']),
      mand: serializer.fromJson<String?>(json['mand']),
      tennd: serializer.fromJson<String?>(json['tennd']),
      makhuruong: serializer.fromJson<String?>(json['makhuruong']),
      idCanLua: serializer.fromJson<String?>(json['idCanLua']),
      tenkhuruong: serializer.fromJson<String?>(json['tenkhuruong']),
      tengiong: serializer.fromJson<String?>(json['tengiong']),
      magiong: serializer.fromJson<String?>(json['magiong']),
      tencaytrong: serializer.fromJson<String?>(json['tencaytrong']),
      tieuchuan: serializer.fromJson<String?>(json['tieuchuan']),
      dientichchot: serializer.fromJson<double?>(json['dientichchot']),
      sanluongdukien: serializer.fromJson<double?>(json['sanluongdukien']),
      ngaythuhoachdk: serializer.fromJson<String?>(json['ngaythuhoachdk']),
      ngaycoghe: serializer.fromJson<String?>(json['ngaycoghe']),
      ngaycoghestr: serializer.fromJson<String?>(json['ngaycoghestr']),
      taitrongkenh: serializer.fromJson<double?>(json['taitrongkenh']),
      maghe: serializer.fromJson<String?>(json['maghe']),
      tenghe: serializer.fromJson<String?>(json['tenghe']),
      sophuongtien: serializer.fromJson<String?>(json['sophuongtien']),
      ngaylenghe: serializer.fromJson<String?>(json['ngaylenghe']),
      ngayghevenhamay: serializer.fromJson<String?>(json['ngayghevenhamay']),
      giavanchuyen: serializer.fromJson<double?>(json['giavanchuyen']),
      giabocxep: serializer.fromJson<double?>(json['giabocxep']),
      luongvanchuyen: serializer.fromJson<double?>(json['luongvanchuyen']),
      thuhoachdieughechitietidenct:
          serializer.fromJson<double?>(json['thuhoachdieughechitietidenct']),
      trangthaivc: serializer.fromJson<double?>(json['trangthaivc']),
      tentrangthaivc: serializer.fromJson<String?>(json['tentrangthaivc']),
      thanhtien: serializer.fromJson<double?>(json['thanhtien']),
      tenchughe: serializer.fromJson<String?>(json['tenchughe']),
      dienthoaichughe: serializer.fromJson<String?>(json['dienthoaichughe']),
      cmnd: serializer.fromJson<String?>(json['cmnd']),
      ngaycap: serializer.fromJson<String?>(json['ngaycap']),
      noicap: serializer.fromJson<String?>(json['noicap']),
      loaighe: serializer.fromJson<int?>(json['loaighe']),
      denghiduyetgia: serializer.fromJson<String?>(json['denghiduyetgia']),
      dongiathuong: serializer.fromJson<double?>(json['dongiathuong']),
      phulucso: serializer.fromJson<String?>(json['phulucso']),
      vanchuyenve: serializer.fromJson<String?>(json['vanchuyenve']),
      idct: serializer.fromJson<String?>(json['idct']),
      makenhbh: serializer.fromJson<String?>(json['makenhbh']),
      tenkenhbh: serializer.fromJson<String?>(json['tenkenhbh']),
      makhach: serializer.fromJson<String?>(json['makhach']),
      tenkhach: serializer.fromJson<String?>(json['tenkhach']),
      sanluongcan: serializer.fromJson<double?>(json['sanluongcan']),
      sobao: serializer.fromJson<double?>(json['sobao']),
      khoiluong_bao: serializer.fromJson<double?>(json['khoiluong_bao']),
      tongkhoiluong_tru_bao:
          serializer.fromJson<double?>(json['tongkhoiluong_tru_bao']),
      khoiluong_tapchat:
          serializer.fromJson<double?>(json['khoiluong_tapchat']),
      tongkhoiluong_tru_tapchat:
          serializer.fromJson<double?>(json['tongkhoiluong_tru_tapchat']),
      tongkhoiluong: serializer.fromJson<double?>(json['tongkhoiluong']),
      giachot: serializer.fromJson<double?>(json['giachot']),
      bacung_can: serializer.fromJson<bool?>(json['bacung_can']),
      tinh: serializer.fromJson<String?>(json['tinh']),
      huyen: serializer.fromJson<String?>(json['huyen']),
      xa: serializer.fromJson<String?>(json['xa']),
      tentinh: serializer.fromJson<String?>(json['tentinh']),
      tenhuyen: serializer.fromJson<String?>(json['tenhuyen']),
      tenxa: serializer.fromJson<String?>(json['tenxa']),
      ghichu: serializer.fromJson<String?>(json['ghichu']),
      isSync: serializer.fromJson<bool>(json['isSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idenct': serializer.toJson<int>(idenct),
      'sophieucan': serializer.toJson<String>(sophieucan),
      'sophieu': serializer.toJson<String?>(sophieu),
      'so_bbtm': serializer.toJson<String?>(so_bbtm),
      'ngaycandb': serializer.toJson<DateTime?>(ngaycandb),
      'createdon': serializer.toJson<DateTime?>(createdon),
      'ngaycan': serializer.toJson<String?>(ngaycan),
      'mand': serializer.toJson<String?>(mand),
      'tennd': serializer.toJson<String?>(tennd),
      'makhuruong': serializer.toJson<String?>(makhuruong),
      'idCanLua': serializer.toJson<String?>(idCanLua),
      'tenkhuruong': serializer.toJson<String?>(tenkhuruong),
      'tengiong': serializer.toJson<String?>(tengiong),
      'magiong': serializer.toJson<String?>(magiong),
      'tencaytrong': serializer.toJson<String?>(tencaytrong),
      'tieuchuan': serializer.toJson<String?>(tieuchuan),
      'dientichchot': serializer.toJson<double?>(dientichchot),
      'sanluongdukien': serializer.toJson<double?>(sanluongdukien),
      'ngaythuhoachdk': serializer.toJson<String?>(ngaythuhoachdk),
      'ngaycoghe': serializer.toJson<String?>(ngaycoghe),
      'ngaycoghestr': serializer.toJson<String?>(ngaycoghestr),
      'taitrongkenh': serializer.toJson<double?>(taitrongkenh),
      'maghe': serializer.toJson<String?>(maghe),
      'tenghe': serializer.toJson<String?>(tenghe),
      'sophuongtien': serializer.toJson<String?>(sophuongtien),
      'ngaylenghe': serializer.toJson<String?>(ngaylenghe),
      'ngayghevenhamay': serializer.toJson<String?>(ngayghevenhamay),
      'giavanchuyen': serializer.toJson<double?>(giavanchuyen),
      'giabocxep': serializer.toJson<double?>(giabocxep),
      'luongvanchuyen': serializer.toJson<double?>(luongvanchuyen),
      'thuhoachdieughechitietidenct':
          serializer.toJson<double?>(thuhoachdieughechitietidenct),
      'trangthaivc': serializer.toJson<double?>(trangthaivc),
      'tentrangthaivc': serializer.toJson<String?>(tentrangthaivc),
      'thanhtien': serializer.toJson<double?>(thanhtien),
      'tenchughe': serializer.toJson<String?>(tenchughe),
      'dienthoaichughe': serializer.toJson<String?>(dienthoaichughe),
      'cmnd': serializer.toJson<String?>(cmnd),
      'ngaycap': serializer.toJson<String?>(ngaycap),
      'noicap': serializer.toJson<String?>(noicap),
      'loaighe': serializer.toJson<int?>(loaighe),
      'denghiduyetgia': serializer.toJson<String?>(denghiduyetgia),
      'dongiathuong': serializer.toJson<double?>(dongiathuong),
      'phulucso': serializer.toJson<String?>(phulucso),
      'vanchuyenve': serializer.toJson<String?>(vanchuyenve),
      'idct': serializer.toJson<String?>(idct),
      'makenhbh': serializer.toJson<String?>(makenhbh),
      'tenkenhbh': serializer.toJson<String?>(tenkenhbh),
      'makhach': serializer.toJson<String?>(makhach),
      'tenkhach': serializer.toJson<String?>(tenkhach),
      'sanluongcan': serializer.toJson<double?>(sanluongcan),
      'sobao': serializer.toJson<double?>(sobao),
      'khoiluong_bao': serializer.toJson<double?>(khoiluong_bao),
      'tongkhoiluong_tru_bao':
          serializer.toJson<double?>(tongkhoiluong_tru_bao),
      'khoiluong_tapchat': serializer.toJson<double?>(khoiluong_tapchat),
      'tongkhoiluong_tru_tapchat':
          serializer.toJson<double?>(tongkhoiluong_tru_tapchat),
      'tongkhoiluong': serializer.toJson<double?>(tongkhoiluong),
      'giachot': serializer.toJson<double?>(giachot),
      'bacung_can': serializer.toJson<bool?>(bacung_can),
      'tinh': serializer.toJson<String?>(tinh),
      'huyen': serializer.toJson<String?>(huyen),
      'xa': serializer.toJson<String?>(xa),
      'tentinh': serializer.toJson<String?>(tentinh),
      'tenhuyen': serializer.toJson<String?>(tenhuyen),
      'tenxa': serializer.toJson<String?>(tenxa),
      'ghichu': serializer.toJson<String?>(ghichu),
      'isSync': serializer.toJson<bool>(isSync),
    };
  }

  TicketEntry copyWith(
          {int? id,
          int? idenct,
          String? sophieucan,
          String? sophieu,
          String? so_bbtm,
          DateTime? ngaycandb,
          DateTime? createdon,
          String? ngaycan,
          String? mand,
          String? tennd,
          String? makhuruong,
          String? idCanLua,
          String? tenkhuruong,
          String? tengiong,
          String? magiong,
          String? tencaytrong,
          String? tieuchuan,
          double? dientichchot,
          double? sanluongdukien,
          String? ngaythuhoachdk,
          String? ngaycoghe,
          String? ngaycoghestr,
          double? taitrongkenh,
          String? maghe,
          String? tenghe,
          String? sophuongtien,
          String? ngaylenghe,
          String? ngayghevenhamay,
          double? giavanchuyen,
          double? giabocxep,
          double? luongvanchuyen,
          double? thuhoachdieughechitietidenct,
          double? trangthaivc,
          String? tentrangthaivc,
          double? thanhtien,
          String? tenchughe,
          String? dienthoaichughe,
          String? cmnd,
          String? ngaycap,
          String? noicap,
          int? loaighe,
          String? denghiduyetgia,
          double? dongiathuong,
          String? phulucso,
          String? vanchuyenve,
          String? idct,
          String? makenhbh,
          String? tenkenhbh,
          String? makhach,
          String? tenkhach,
          double? sanluongcan,
          double? sobao,
          double? khoiluong_bao,
          double? tongkhoiluong_tru_bao,
          double? khoiluong_tapchat,
          double? tongkhoiluong_tru_tapchat,
          double? tongkhoiluong,
          double? giachot,
          bool? bacung_can,
          String? tinh,
          String? huyen,
          String? xa,
          String? tentinh,
          String? tenhuyen,
          String? tenxa,
          String? ghichu,
          bool? isSync}) =>
      TicketEntry(
        id: id ?? this.id,
        idenct: idenct ?? this.idenct,
        sophieucan: sophieucan ?? this.sophieucan,
        sophieu: sophieu ?? this.sophieu,
        so_bbtm: so_bbtm ?? this.so_bbtm,
        ngaycandb: ngaycandb ?? this.ngaycandb,
        createdon: createdon ?? this.createdon,
        ngaycan: ngaycan ?? this.ngaycan,
        mand: mand ?? this.mand,
        tennd: tennd ?? this.tennd,
        makhuruong: makhuruong ?? this.makhuruong,
        idCanLua: idCanLua ?? this.idCanLua,
        tenkhuruong: tenkhuruong ?? this.tenkhuruong,
        tengiong: tengiong ?? this.tengiong,
        magiong: magiong ?? this.magiong,
        tencaytrong: tencaytrong ?? this.tencaytrong,
        tieuchuan: tieuchuan ?? this.tieuchuan,
        dientichchot: dientichchot ?? this.dientichchot,
        sanluongdukien: sanluongdukien ?? this.sanluongdukien,
        ngaythuhoachdk: ngaythuhoachdk ?? this.ngaythuhoachdk,
        ngaycoghe: ngaycoghe ?? this.ngaycoghe,
        ngaycoghestr: ngaycoghestr ?? this.ngaycoghestr,
        taitrongkenh: taitrongkenh ?? this.taitrongkenh,
        maghe: maghe ?? this.maghe,
        tenghe: tenghe ?? this.tenghe,
        sophuongtien: sophuongtien ?? this.sophuongtien,
        ngaylenghe: ngaylenghe ?? this.ngaylenghe,
        ngayghevenhamay: ngayghevenhamay ?? this.ngayghevenhamay,
        giavanchuyen: giavanchuyen ?? this.giavanchuyen,
        giabocxep: giabocxep ?? this.giabocxep,
        luongvanchuyen: luongvanchuyen ?? this.luongvanchuyen,
        thuhoachdieughechitietidenct:
            thuhoachdieughechitietidenct ?? this.thuhoachdieughechitietidenct,
        trangthaivc: trangthaivc ?? this.trangthaivc,
        tentrangthaivc: tentrangthaivc ?? this.tentrangthaivc,
        thanhtien: thanhtien ?? this.thanhtien,
        tenchughe: tenchughe ?? this.tenchughe,
        dienthoaichughe: dienthoaichughe ?? this.dienthoaichughe,
        cmnd: cmnd ?? this.cmnd,
        ngaycap: ngaycap ?? this.ngaycap,
        noicap: noicap ?? this.noicap,
        loaighe: loaighe ?? this.loaighe,
        denghiduyetgia: denghiduyetgia ?? this.denghiduyetgia,
        dongiathuong: dongiathuong ?? this.dongiathuong,
        phulucso: phulucso ?? this.phulucso,
        vanchuyenve: vanchuyenve ?? this.vanchuyenve,
        idct: idct ?? this.idct,
        makenhbh: makenhbh ?? this.makenhbh,
        tenkenhbh: tenkenhbh ?? this.tenkenhbh,
        makhach: makhach ?? this.makhach,
        tenkhach: tenkhach ?? this.tenkhach,
        sanluongcan: sanluongcan ?? this.sanluongcan,
        sobao: sobao ?? this.sobao,
        khoiluong_bao: khoiluong_bao ?? this.khoiluong_bao,
        tongkhoiluong_tru_bao:
            tongkhoiluong_tru_bao ?? this.tongkhoiluong_tru_bao,
        khoiluong_tapchat: khoiluong_tapchat ?? this.khoiluong_tapchat,
        tongkhoiluong_tru_tapchat:
            tongkhoiluong_tru_tapchat ?? this.tongkhoiluong_tru_tapchat,
        tongkhoiluong: tongkhoiluong ?? this.tongkhoiluong,
        giachot: giachot ?? this.giachot,
        bacung_can: bacung_can ?? this.bacung_can,
        tinh: tinh ?? this.tinh,
        huyen: huyen ?? this.huyen,
        xa: xa ?? this.xa,
        tentinh: tentinh ?? this.tentinh,
        tenhuyen: tenhuyen ?? this.tenhuyen,
        tenxa: tenxa ?? this.tenxa,
        ghichu: ghichu ?? this.ghichu,
        isSync: isSync ?? this.isSync,
      );
  @override
  String toString() {
    return (StringBuffer('TicketEntry(')
          ..write('id: $id, ')
          ..write('idenct: $idenct, ')
          ..write('sophieucan: $sophieucan, ')
          ..write('sophieu: $sophieu, ')
          ..write('so_bbtm: $so_bbtm, ')
          ..write('ngaycandb: $ngaycandb, ')
          ..write('createdon: $createdon, ')
          ..write('ngaycan: $ngaycan, ')
          ..write('mand: $mand, ')
          ..write('tennd: $tennd, ')
          ..write('makhuruong: $makhuruong, ')
          ..write('idCanLua: $idCanLua, ')
          ..write('tenkhuruong: $tenkhuruong, ')
          ..write('tengiong: $tengiong, ')
          ..write('magiong: $magiong, ')
          ..write('tencaytrong: $tencaytrong, ')
          ..write('tieuchuan: $tieuchuan, ')
          ..write('dientichchot: $dientichchot, ')
          ..write('sanluongdukien: $sanluongdukien, ')
          ..write('ngaythuhoachdk: $ngaythuhoachdk, ')
          ..write('ngaycoghe: $ngaycoghe, ')
          ..write('ngaycoghestr: $ngaycoghestr, ')
          ..write('taitrongkenh: $taitrongkenh, ')
          ..write('maghe: $maghe, ')
          ..write('tenghe: $tenghe, ')
          ..write('sophuongtien: $sophuongtien, ')
          ..write('ngaylenghe: $ngaylenghe, ')
          ..write('ngayghevenhamay: $ngayghevenhamay, ')
          ..write('giavanchuyen: $giavanchuyen, ')
          ..write('giabocxep: $giabocxep, ')
          ..write('luongvanchuyen: $luongvanchuyen, ')
          ..write(
              'thuhoachdieughechitietidenct: $thuhoachdieughechitietidenct, ')
          ..write('trangthaivc: $trangthaivc, ')
          ..write('tentrangthaivc: $tentrangthaivc, ')
          ..write('thanhtien: $thanhtien, ')
          ..write('tenchughe: $tenchughe, ')
          ..write('dienthoaichughe: $dienthoaichughe, ')
          ..write('cmnd: $cmnd, ')
          ..write('ngaycap: $ngaycap, ')
          ..write('noicap: $noicap, ')
          ..write('loaighe: $loaighe, ')
          ..write('denghiduyetgia: $denghiduyetgia, ')
          ..write('dongiathuong: $dongiathuong, ')
          ..write('phulucso: $phulucso, ')
          ..write('vanchuyenve: $vanchuyenve, ')
          ..write('idct: $idct, ')
          ..write('makenhbh: $makenhbh, ')
          ..write('tenkenhbh: $tenkenhbh, ')
          ..write('makhach: $makhach, ')
          ..write('tenkhach: $tenkhach, ')
          ..write('sanluongcan: $sanluongcan, ')
          ..write('sobao: $sobao, ')
          ..write('khoiluong_bao: $khoiluong_bao, ')
          ..write('tongkhoiluong_tru_bao: $tongkhoiluong_tru_bao, ')
          ..write('khoiluong_tapchat: $khoiluong_tapchat, ')
          ..write('tongkhoiluong_tru_tapchat: $tongkhoiluong_tru_tapchat, ')
          ..write('tongkhoiluong: $tongkhoiluong, ')
          ..write('giachot: $giachot, ')
          ..write('bacung_can: $bacung_can, ')
          ..write('tinh: $tinh, ')
          ..write('huyen: $huyen, ')
          ..write('xa: $xa, ')
          ..write('tentinh: $tentinh, ')
          ..write('tenhuyen: $tenhuyen, ')
          ..write('tenxa: $tenxa, ')
          ..write('ghichu: $ghichu, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        idenct,
        sophieucan,
        sophieu,
        so_bbtm,
        ngaycandb,
        createdon,
        ngaycan,
        mand,
        tennd,
        makhuruong,
        idCanLua,
        tenkhuruong,
        tengiong,
        magiong,
        tencaytrong,
        tieuchuan,
        dientichchot,
        sanluongdukien,
        ngaythuhoachdk,
        ngaycoghe,
        ngaycoghestr,
        taitrongkenh,
        maghe,
        tenghe,
        sophuongtien,
        ngaylenghe,
        ngayghevenhamay,
        giavanchuyen,
        giabocxep,
        luongvanchuyen,
        thuhoachdieughechitietidenct,
        trangthaivc,
        tentrangthaivc,
        thanhtien,
        tenchughe,
        dienthoaichughe,
        cmnd,
        ngaycap,
        noicap,
        loaighe,
        denghiduyetgia,
        dongiathuong,
        phulucso,
        vanchuyenve,
        idct,
        makenhbh,
        tenkenhbh,
        makhach,
        tenkhach,
        sanluongcan,
        sobao,
        khoiluong_bao,
        tongkhoiluong_tru_bao,
        khoiluong_tapchat,
        tongkhoiluong_tru_tapchat,
        tongkhoiluong,
        giachot,
        bacung_can,
        tinh,
        huyen,
        xa,
        tentinh,
        tenhuyen,
        tenxa,
        ghichu,
        isSync
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TicketEntry &&
          other.id == this.id &&
          other.idenct == this.idenct &&
          other.sophieucan == this.sophieucan &&
          other.sophieu == this.sophieu &&
          other.so_bbtm == this.so_bbtm &&
          other.ngaycandb == this.ngaycandb &&
          other.createdon == this.createdon &&
          other.ngaycan == this.ngaycan &&
          other.mand == this.mand &&
          other.tennd == this.tennd &&
          other.makhuruong == this.makhuruong &&
          other.idCanLua == this.idCanLua &&
          other.tenkhuruong == this.tenkhuruong &&
          other.tengiong == this.tengiong &&
          other.magiong == this.magiong &&
          other.tencaytrong == this.tencaytrong &&
          other.tieuchuan == this.tieuchuan &&
          other.dientichchot == this.dientichchot &&
          other.sanluongdukien == this.sanluongdukien &&
          other.ngaythuhoachdk == this.ngaythuhoachdk &&
          other.ngaycoghe == this.ngaycoghe &&
          other.ngaycoghestr == this.ngaycoghestr &&
          other.taitrongkenh == this.taitrongkenh &&
          other.maghe == this.maghe &&
          other.tenghe == this.tenghe &&
          other.sophuongtien == this.sophuongtien &&
          other.ngaylenghe == this.ngaylenghe &&
          other.ngayghevenhamay == this.ngayghevenhamay &&
          other.giavanchuyen == this.giavanchuyen &&
          other.giabocxep == this.giabocxep &&
          other.luongvanchuyen == this.luongvanchuyen &&
          other.thuhoachdieughechitietidenct ==
              this.thuhoachdieughechitietidenct &&
          other.trangthaivc == this.trangthaivc &&
          other.tentrangthaivc == this.tentrangthaivc &&
          other.thanhtien == this.thanhtien &&
          other.tenchughe == this.tenchughe &&
          other.dienthoaichughe == this.dienthoaichughe &&
          other.cmnd == this.cmnd &&
          other.ngaycap == this.ngaycap &&
          other.noicap == this.noicap &&
          other.loaighe == this.loaighe &&
          other.denghiduyetgia == this.denghiduyetgia &&
          other.dongiathuong == this.dongiathuong &&
          other.phulucso == this.phulucso &&
          other.vanchuyenve == this.vanchuyenve &&
          other.idct == this.idct &&
          other.makenhbh == this.makenhbh &&
          other.tenkenhbh == this.tenkenhbh &&
          other.makhach == this.makhach &&
          other.tenkhach == this.tenkhach &&
          other.sanluongcan == this.sanluongcan &&
          other.sobao == this.sobao &&
          other.khoiluong_bao == this.khoiluong_bao &&
          other.tongkhoiluong_tru_bao == this.tongkhoiluong_tru_bao &&
          other.khoiluong_tapchat == this.khoiluong_tapchat &&
          other.tongkhoiluong_tru_tapchat == this.tongkhoiluong_tru_tapchat &&
          other.tongkhoiluong == this.tongkhoiluong &&
          other.giachot == this.giachot &&
          other.bacung_can == this.bacung_can &&
          other.tinh == this.tinh &&
          other.huyen == this.huyen &&
          other.xa == this.xa &&
          other.tentinh == this.tentinh &&
          other.tenhuyen == this.tenhuyen &&
          other.tenxa == this.tenxa &&
          other.ghichu == this.ghichu &&
          other.isSync == this.isSync);
}

class TicketsCompanion extends UpdateCompanion<TicketEntry> {
  final Value<int> id;
  final Value<int> idenct;
  final Value<String> sophieucan;
  final Value<String?> sophieu;
  final Value<String?> so_bbtm;
  final Value<DateTime?> ngaycandb;
  final Value<DateTime?> createdon;
  final Value<String?> ngaycan;
  final Value<String?> mand;
  final Value<String?> tennd;
  final Value<String?> makhuruong;
  final Value<String?> idCanLua;
  final Value<String?> tenkhuruong;
  final Value<String?> tengiong;
  final Value<String?> magiong;
  final Value<String?> tencaytrong;
  final Value<String?> tieuchuan;
  final Value<double?> dientichchot;
  final Value<double?> sanluongdukien;
  final Value<String?> ngaythuhoachdk;
  final Value<String?> ngaycoghe;
  final Value<String?> ngaycoghestr;
  final Value<double?> taitrongkenh;
  final Value<String?> maghe;
  final Value<String?> tenghe;
  final Value<String?> sophuongtien;
  final Value<String?> ngaylenghe;
  final Value<String?> ngayghevenhamay;
  final Value<double?> giavanchuyen;
  final Value<double?> giabocxep;
  final Value<double?> luongvanchuyen;
  final Value<double?> thuhoachdieughechitietidenct;
  final Value<double?> trangthaivc;
  final Value<String?> tentrangthaivc;
  final Value<double?> thanhtien;
  final Value<String?> tenchughe;
  final Value<String?> dienthoaichughe;
  final Value<String?> cmnd;
  final Value<String?> ngaycap;
  final Value<String?> noicap;
  final Value<int?> loaighe;
  final Value<String?> denghiduyetgia;
  final Value<double?> dongiathuong;
  final Value<String?> phulucso;
  final Value<String?> vanchuyenve;
  final Value<String?> idct;
  final Value<String?> makenhbh;
  final Value<String?> tenkenhbh;
  final Value<String?> makhach;
  final Value<String?> tenkhach;
  final Value<double?> sanluongcan;
  final Value<double?> sobao;
  final Value<double?> khoiluong_bao;
  final Value<double?> tongkhoiluong_tru_bao;
  final Value<double?> khoiluong_tapchat;
  final Value<double?> tongkhoiluong_tru_tapchat;
  final Value<double?> tongkhoiluong;
  final Value<double?> giachot;
  final Value<bool?> bacung_can;
  final Value<String?> tinh;
  final Value<String?> huyen;
  final Value<String?> xa;
  final Value<String?> tentinh;
  final Value<String?> tenhuyen;
  final Value<String?> tenxa;
  final Value<String?> ghichu;
  final Value<bool> isSync;
  const TicketsCompanion({
    this.id = const Value.absent(),
    this.idenct = const Value.absent(),
    this.sophieucan = const Value.absent(),
    this.sophieu = const Value.absent(),
    this.so_bbtm = const Value.absent(),
    this.ngaycandb = const Value.absent(),
    this.createdon = const Value.absent(),
    this.ngaycan = const Value.absent(),
    this.mand = const Value.absent(),
    this.tennd = const Value.absent(),
    this.makhuruong = const Value.absent(),
    this.idCanLua = const Value.absent(),
    this.tenkhuruong = const Value.absent(),
    this.tengiong = const Value.absent(),
    this.magiong = const Value.absent(),
    this.tencaytrong = const Value.absent(),
    this.tieuchuan = const Value.absent(),
    this.dientichchot = const Value.absent(),
    this.sanluongdukien = const Value.absent(),
    this.ngaythuhoachdk = const Value.absent(),
    this.ngaycoghe = const Value.absent(),
    this.ngaycoghestr = const Value.absent(),
    this.taitrongkenh = const Value.absent(),
    this.maghe = const Value.absent(),
    this.tenghe = const Value.absent(),
    this.sophuongtien = const Value.absent(),
    this.ngaylenghe = const Value.absent(),
    this.ngayghevenhamay = const Value.absent(),
    this.giavanchuyen = const Value.absent(),
    this.giabocxep = const Value.absent(),
    this.luongvanchuyen = const Value.absent(),
    this.thuhoachdieughechitietidenct = const Value.absent(),
    this.trangthaivc = const Value.absent(),
    this.tentrangthaivc = const Value.absent(),
    this.thanhtien = const Value.absent(),
    this.tenchughe = const Value.absent(),
    this.dienthoaichughe = const Value.absent(),
    this.cmnd = const Value.absent(),
    this.ngaycap = const Value.absent(),
    this.noicap = const Value.absent(),
    this.loaighe = const Value.absent(),
    this.denghiduyetgia = const Value.absent(),
    this.dongiathuong = const Value.absent(),
    this.phulucso = const Value.absent(),
    this.vanchuyenve = const Value.absent(),
    this.idct = const Value.absent(),
    this.makenhbh = const Value.absent(),
    this.tenkenhbh = const Value.absent(),
    this.makhach = const Value.absent(),
    this.tenkhach = const Value.absent(),
    this.sanluongcan = const Value.absent(),
    this.sobao = const Value.absent(),
    this.khoiluong_bao = const Value.absent(),
    this.tongkhoiluong_tru_bao = const Value.absent(),
    this.khoiluong_tapchat = const Value.absent(),
    this.tongkhoiluong_tru_tapchat = const Value.absent(),
    this.tongkhoiluong = const Value.absent(),
    this.giachot = const Value.absent(),
    this.bacung_can = const Value.absent(),
    this.tinh = const Value.absent(),
    this.huyen = const Value.absent(),
    this.xa = const Value.absent(),
    this.tentinh = const Value.absent(),
    this.tenhuyen = const Value.absent(),
    this.tenxa = const Value.absent(),
    this.ghichu = const Value.absent(),
    this.isSync = const Value.absent(),
  });
  TicketsCompanion.insert({
    this.id = const Value.absent(),
    required int idenct,
    required String sophieucan,
    this.sophieu = const Value.absent(),
    this.so_bbtm = const Value.absent(),
    this.ngaycandb = const Value.absent(),
    this.createdon = const Value.absent(),
    this.ngaycan = const Value.absent(),
    this.mand = const Value.absent(),
    this.tennd = const Value.absent(),
    this.makhuruong = const Value.absent(),
    this.idCanLua = const Value.absent(),
    this.tenkhuruong = const Value.absent(),
    this.tengiong = const Value.absent(),
    this.magiong = const Value.absent(),
    this.tencaytrong = const Value.absent(),
    this.tieuchuan = const Value.absent(),
    this.dientichchot = const Value.absent(),
    this.sanluongdukien = const Value.absent(),
    this.ngaythuhoachdk = const Value.absent(),
    this.ngaycoghe = const Value.absent(),
    this.ngaycoghestr = const Value.absent(),
    this.taitrongkenh = const Value.absent(),
    this.maghe = const Value.absent(),
    this.tenghe = const Value.absent(),
    this.sophuongtien = const Value.absent(),
    this.ngaylenghe = const Value.absent(),
    this.ngayghevenhamay = const Value.absent(),
    this.giavanchuyen = const Value.absent(),
    this.giabocxep = const Value.absent(),
    this.luongvanchuyen = const Value.absent(),
    this.thuhoachdieughechitietidenct = const Value.absent(),
    this.trangthaivc = const Value.absent(),
    this.tentrangthaivc = const Value.absent(),
    this.thanhtien = const Value.absent(),
    this.tenchughe = const Value.absent(),
    this.dienthoaichughe = const Value.absent(),
    this.cmnd = const Value.absent(),
    this.ngaycap = const Value.absent(),
    this.noicap = const Value.absent(),
    this.loaighe = const Value.absent(),
    this.denghiduyetgia = const Value.absent(),
    this.dongiathuong = const Value.absent(),
    this.phulucso = const Value.absent(),
    this.vanchuyenve = const Value.absent(),
    this.idct = const Value.absent(),
    this.makenhbh = const Value.absent(),
    this.tenkenhbh = const Value.absent(),
    this.makhach = const Value.absent(),
    this.tenkhach = const Value.absent(),
    this.sanluongcan = const Value.absent(),
    this.sobao = const Value.absent(),
    this.khoiluong_bao = const Value.absent(),
    this.tongkhoiluong_tru_bao = const Value.absent(),
    this.khoiluong_tapchat = const Value.absent(),
    this.tongkhoiluong_tru_tapchat = const Value.absent(),
    this.tongkhoiluong = const Value.absent(),
    this.giachot = const Value.absent(),
    this.bacung_can = const Value.absent(),
    this.tinh = const Value.absent(),
    this.huyen = const Value.absent(),
    this.xa = const Value.absent(),
    this.tentinh = const Value.absent(),
    this.tenhuyen = const Value.absent(),
    this.tenxa = const Value.absent(),
    this.ghichu = const Value.absent(),
    required bool isSync,
  })  : idenct = Value(idenct),
        sophieucan = Value(sophieucan),
        isSync = Value(isSync);
  static Insertable<TicketEntry> custom({
    Expression<int>? id,
    Expression<int>? idenct,
    Expression<String>? sophieucan,
    Expression<String?>? sophieu,
    Expression<String?>? so_bbtm,
    Expression<DateTime?>? ngaycandb,
    Expression<DateTime?>? createdon,
    Expression<String?>? ngaycan,
    Expression<String?>? mand,
    Expression<String?>? tennd,
    Expression<String?>? makhuruong,
    Expression<String?>? idCanLua,
    Expression<String?>? tenkhuruong,
    Expression<String?>? tengiong,
    Expression<String?>? magiong,
    Expression<String?>? tencaytrong,
    Expression<String?>? tieuchuan,
    Expression<double?>? dientichchot,
    Expression<double?>? sanluongdukien,
    Expression<String?>? ngaythuhoachdk,
    Expression<String?>? ngaycoghe,
    Expression<String?>? ngaycoghestr,
    Expression<double?>? taitrongkenh,
    Expression<String?>? maghe,
    Expression<String?>? tenghe,
    Expression<String?>? sophuongtien,
    Expression<String?>? ngaylenghe,
    Expression<String?>? ngayghevenhamay,
    Expression<double?>? giavanchuyen,
    Expression<double?>? giabocxep,
    Expression<double?>? luongvanchuyen,
    Expression<double?>? thuhoachdieughechitietidenct,
    Expression<double?>? trangthaivc,
    Expression<String?>? tentrangthaivc,
    Expression<double?>? thanhtien,
    Expression<String?>? tenchughe,
    Expression<String?>? dienthoaichughe,
    Expression<String?>? cmnd,
    Expression<String?>? ngaycap,
    Expression<String?>? noicap,
    Expression<int?>? loaighe,
    Expression<String?>? denghiduyetgia,
    Expression<double?>? dongiathuong,
    Expression<String?>? phulucso,
    Expression<String?>? vanchuyenve,
    Expression<String?>? idct,
    Expression<String?>? makenhbh,
    Expression<String?>? tenkenhbh,
    Expression<String?>? makhach,
    Expression<String?>? tenkhach,
    Expression<double?>? sanluongcan,
    Expression<double?>? sobao,
    Expression<double?>? khoiluong_bao,
    Expression<double?>? tongkhoiluong_tru_bao,
    Expression<double?>? khoiluong_tapchat,
    Expression<double?>? tongkhoiluong_tru_tapchat,
    Expression<double?>? tongkhoiluong,
    Expression<double?>? giachot,
    Expression<bool?>? bacung_can,
    Expression<String?>? tinh,
    Expression<String?>? huyen,
    Expression<String?>? xa,
    Expression<String?>? tentinh,
    Expression<String?>? tenhuyen,
    Expression<String?>? tenxa,
    Expression<String?>? ghichu,
    Expression<bool>? isSync,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idenct != null) 'idenct': idenct,
      if (sophieucan != null) 'sophieucan': sophieucan,
      if (sophieu != null) 'sophieu': sophieu,
      if (so_bbtm != null) 'so_bbtm': so_bbtm,
      if (ngaycandb != null) 'ngaycandb': ngaycandb,
      if (createdon != null) 'createdon': createdon,
      if (ngaycan != null) 'ngaycan': ngaycan,
      if (mand != null) 'mand': mand,
      if (tennd != null) 'tennd': tennd,
      if (makhuruong != null) 'makhuruong': makhuruong,
      if (idCanLua != null) 'id_can_lua': idCanLua,
      if (tenkhuruong != null) 'tenkhuruong': tenkhuruong,
      if (tengiong != null) 'tengiong': tengiong,
      if (magiong != null) 'magiong': magiong,
      if (tencaytrong != null) 'tencaytrong': tencaytrong,
      if (tieuchuan != null) 'tieuchuan': tieuchuan,
      if (dientichchot != null) 'dientichchot': dientichchot,
      if (sanluongdukien != null) 'sanluongdukien': sanluongdukien,
      if (ngaythuhoachdk != null) 'ngaythuhoachdk': ngaythuhoachdk,
      if (ngaycoghe != null) 'ngaycoghe': ngaycoghe,
      if (ngaycoghestr != null) 'ngaycoghestr': ngaycoghestr,
      if (taitrongkenh != null) 'taitrongkenh': taitrongkenh,
      if (maghe != null) 'maghe': maghe,
      if (tenghe != null) 'tenghe': tenghe,
      if (sophuongtien != null) 'sophuongtien': sophuongtien,
      if (ngaylenghe != null) 'ngaylenghe': ngaylenghe,
      if (ngayghevenhamay != null) 'ngayghevenhamay': ngayghevenhamay,
      if (giavanchuyen != null) 'giavanchuyen': giavanchuyen,
      if (giabocxep != null) 'giabocxep': giabocxep,
      if (luongvanchuyen != null) 'luongvanchuyen': luongvanchuyen,
      if (thuhoachdieughechitietidenct != null)
        'thuhoachdieughechitietidenct': thuhoachdieughechitietidenct,
      if (trangthaivc != null) 'trangthaivc': trangthaivc,
      if (tentrangthaivc != null) 'tentrangthaivc': tentrangthaivc,
      if (thanhtien != null) 'thanhtien': thanhtien,
      if (tenchughe != null) 'tenchughe': tenchughe,
      if (dienthoaichughe != null) 'dienthoaichughe': dienthoaichughe,
      if (cmnd != null) 'cmnd': cmnd,
      if (ngaycap != null) 'ngaycap': ngaycap,
      if (noicap != null) 'noicap': noicap,
      if (loaighe != null) 'loaighe': loaighe,
      if (denghiduyetgia != null) 'denghiduyetgia': denghiduyetgia,
      if (dongiathuong != null) 'dongiathuong': dongiathuong,
      if (phulucso != null) 'phulucso': phulucso,
      if (vanchuyenve != null) 'vanchuyenve': vanchuyenve,
      if (idct != null) 'idct': idct,
      if (makenhbh != null) 'makenhbh': makenhbh,
      if (tenkenhbh != null) 'tenkenhbh': tenkenhbh,
      if (makhach != null) 'makhach': makhach,
      if (tenkhach != null) 'tenkhach': tenkhach,
      if (sanluongcan != null) 'sanluongcan': sanluongcan,
      if (sobao != null) 'sobao': sobao,
      if (khoiluong_bao != null) 'khoiluong_bao': khoiluong_bao,
      if (tongkhoiluong_tru_bao != null)
        'tongkhoiluong_tru_bao': tongkhoiluong_tru_bao,
      if (khoiluong_tapchat != null) 'khoiluong_tapchat': khoiluong_tapchat,
      if (tongkhoiluong_tru_tapchat != null)
        'tongkhoiluong_tru_tapchat': tongkhoiluong_tru_tapchat,
      if (tongkhoiluong != null) 'tongkhoiluong': tongkhoiluong,
      if (giachot != null) 'giachot': giachot,
      if (bacung_can != null) 'bacung_can': bacung_can,
      if (tinh != null) 'tinh': tinh,
      if (huyen != null) 'huyen': huyen,
      if (xa != null) 'xa': xa,
      if (tentinh != null) 'tentinh': tentinh,
      if (tenhuyen != null) 'tenhuyen': tenhuyen,
      if (tenxa != null) 'tenxa': tenxa,
      if (ghichu != null) 'ghichu': ghichu,
      if (isSync != null) 'is_sync': isSync,
    });
  }

  TicketsCompanion copyWith(
      {Value<int>? id,
      Value<int>? idenct,
      Value<String>? sophieucan,
      Value<String?>? sophieu,
      Value<String?>? so_bbtm,
      Value<DateTime?>? ngaycandb,
      Value<DateTime?>? createdon,
      Value<String?>? ngaycan,
      Value<String?>? mand,
      Value<String?>? tennd,
      Value<String?>? makhuruong,
      Value<String?>? idCanLua,
      Value<String?>? tenkhuruong,
      Value<String?>? tengiong,
      Value<String?>? magiong,
      Value<String?>? tencaytrong,
      Value<String?>? tieuchuan,
      Value<double?>? dientichchot,
      Value<double?>? sanluongdukien,
      Value<String?>? ngaythuhoachdk,
      Value<String?>? ngaycoghe,
      Value<String?>? ngaycoghestr,
      Value<double?>? taitrongkenh,
      Value<String?>? maghe,
      Value<String?>? tenghe,
      Value<String?>? sophuongtien,
      Value<String?>? ngaylenghe,
      Value<String?>? ngayghevenhamay,
      Value<double?>? giavanchuyen,
      Value<double?>? giabocxep,
      Value<double?>? luongvanchuyen,
      Value<double?>? thuhoachdieughechitietidenct,
      Value<double?>? trangthaivc,
      Value<String?>? tentrangthaivc,
      Value<double?>? thanhtien,
      Value<String?>? tenchughe,
      Value<String?>? dienthoaichughe,
      Value<String?>? cmnd,
      Value<String?>? ngaycap,
      Value<String?>? noicap,
      Value<int?>? loaighe,
      Value<String?>? denghiduyetgia,
      Value<double?>? dongiathuong,
      Value<String?>? phulucso,
      Value<String?>? vanchuyenve,
      Value<String?>? idct,
      Value<String?>? makenhbh,
      Value<String?>? tenkenhbh,
      Value<String?>? makhach,
      Value<String?>? tenkhach,
      Value<double?>? sanluongcan,
      Value<double?>? sobao,
      Value<double?>? khoiluong_bao,
      Value<double?>? tongkhoiluong_tru_bao,
      Value<double?>? khoiluong_tapchat,
      Value<double?>? tongkhoiluong_tru_tapchat,
      Value<double?>? tongkhoiluong,
      Value<double?>? giachot,
      Value<bool?>? bacung_can,
      Value<String?>? tinh,
      Value<String?>? huyen,
      Value<String?>? xa,
      Value<String?>? tentinh,
      Value<String?>? tenhuyen,
      Value<String?>? tenxa,
      Value<String?>? ghichu,
      Value<bool>? isSync}) {
    return TicketsCompanion(
      id: id ?? this.id,
      idenct: idenct ?? this.idenct,
      sophieucan: sophieucan ?? this.sophieucan,
      sophieu: sophieu ?? this.sophieu,
      so_bbtm: so_bbtm ?? this.so_bbtm,
      ngaycandb: ngaycandb ?? this.ngaycandb,
      createdon: createdon ?? this.createdon,
      ngaycan: ngaycan ?? this.ngaycan,
      mand: mand ?? this.mand,
      tennd: tennd ?? this.tennd,
      makhuruong: makhuruong ?? this.makhuruong,
      idCanLua: idCanLua ?? this.idCanLua,
      tenkhuruong: tenkhuruong ?? this.tenkhuruong,
      tengiong: tengiong ?? this.tengiong,
      magiong: magiong ?? this.magiong,
      tencaytrong: tencaytrong ?? this.tencaytrong,
      tieuchuan: tieuchuan ?? this.tieuchuan,
      dientichchot: dientichchot ?? this.dientichchot,
      sanluongdukien: sanluongdukien ?? this.sanluongdukien,
      ngaythuhoachdk: ngaythuhoachdk ?? this.ngaythuhoachdk,
      ngaycoghe: ngaycoghe ?? this.ngaycoghe,
      ngaycoghestr: ngaycoghestr ?? this.ngaycoghestr,
      taitrongkenh: taitrongkenh ?? this.taitrongkenh,
      maghe: maghe ?? this.maghe,
      tenghe: tenghe ?? this.tenghe,
      sophuongtien: sophuongtien ?? this.sophuongtien,
      ngaylenghe: ngaylenghe ?? this.ngaylenghe,
      ngayghevenhamay: ngayghevenhamay ?? this.ngayghevenhamay,
      giavanchuyen: giavanchuyen ?? this.giavanchuyen,
      giabocxep: giabocxep ?? this.giabocxep,
      luongvanchuyen: luongvanchuyen ?? this.luongvanchuyen,
      thuhoachdieughechitietidenct:
          thuhoachdieughechitietidenct ?? this.thuhoachdieughechitietidenct,
      trangthaivc: trangthaivc ?? this.trangthaivc,
      tentrangthaivc: tentrangthaivc ?? this.tentrangthaivc,
      thanhtien: thanhtien ?? this.thanhtien,
      tenchughe: tenchughe ?? this.tenchughe,
      dienthoaichughe: dienthoaichughe ?? this.dienthoaichughe,
      cmnd: cmnd ?? this.cmnd,
      ngaycap: ngaycap ?? this.ngaycap,
      noicap: noicap ?? this.noicap,
      loaighe: loaighe ?? this.loaighe,
      denghiduyetgia: denghiduyetgia ?? this.denghiduyetgia,
      dongiathuong: dongiathuong ?? this.dongiathuong,
      phulucso: phulucso ?? this.phulucso,
      vanchuyenve: vanchuyenve ?? this.vanchuyenve,
      idct: idct ?? this.idct,
      makenhbh: makenhbh ?? this.makenhbh,
      tenkenhbh: tenkenhbh ?? this.tenkenhbh,
      makhach: makhach ?? this.makhach,
      tenkhach: tenkhach ?? this.tenkhach,
      sanluongcan: sanluongcan ?? this.sanluongcan,
      sobao: sobao ?? this.sobao,
      khoiluong_bao: khoiluong_bao ?? this.khoiluong_bao,
      tongkhoiluong_tru_bao:
          tongkhoiluong_tru_bao ?? this.tongkhoiluong_tru_bao,
      khoiluong_tapchat: khoiluong_tapchat ?? this.khoiluong_tapchat,
      tongkhoiluong_tru_tapchat:
          tongkhoiluong_tru_tapchat ?? this.tongkhoiluong_tru_tapchat,
      tongkhoiluong: tongkhoiluong ?? this.tongkhoiluong,
      giachot: giachot ?? this.giachot,
      bacung_can: bacung_can ?? this.bacung_can,
      tinh: tinh ?? this.tinh,
      huyen: huyen ?? this.huyen,
      xa: xa ?? this.xa,
      tentinh: tentinh ?? this.tentinh,
      tenhuyen: tenhuyen ?? this.tenhuyen,
      tenxa: tenxa ?? this.tenxa,
      ghichu: ghichu ?? this.ghichu,
      isSync: isSync ?? this.isSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idenct.present) {
      map['idenct'] = Variable<int>(idenct.value);
    }
    if (sophieucan.present) {
      map['sophieucan'] = Variable<String>(sophieucan.value);
    }
    if (sophieu.present) {
      map['sophieu'] = Variable<String?>(sophieu.value);
    }
    if (so_bbtm.present) {
      map['so_bbtm'] = Variable<String?>(so_bbtm.value);
    }
    if (ngaycandb.present) {
      map['ngaycandb'] = Variable<DateTime?>(ngaycandb.value);
    }
    if (createdon.present) {
      map['createdon'] = Variable<DateTime?>(createdon.value);
    }
    if (ngaycan.present) {
      map['ngaycan'] = Variable<String?>(ngaycan.value);
    }
    if (mand.present) {
      map['mand'] = Variable<String?>(mand.value);
    }
    if (tennd.present) {
      map['tennd'] = Variable<String?>(tennd.value);
    }
    if (makhuruong.present) {
      map['makhuruong'] = Variable<String?>(makhuruong.value);
    }
    if (idCanLua.present) {
      map['id_can_lua'] = Variable<String?>(idCanLua.value);
    }
    if (tenkhuruong.present) {
      map['tenkhuruong'] = Variable<String?>(tenkhuruong.value);
    }
    if (tengiong.present) {
      map['tengiong'] = Variable<String?>(tengiong.value);
    }
    if (magiong.present) {
      map['magiong'] = Variable<String?>(magiong.value);
    }
    if (tencaytrong.present) {
      map['tencaytrong'] = Variable<String?>(tencaytrong.value);
    }
    if (tieuchuan.present) {
      map['tieuchuan'] = Variable<String?>(tieuchuan.value);
    }
    if (dientichchot.present) {
      map['dientichchot'] = Variable<double?>(dientichchot.value);
    }
    if (sanluongdukien.present) {
      map['sanluongdukien'] = Variable<double?>(sanluongdukien.value);
    }
    if (ngaythuhoachdk.present) {
      map['ngaythuhoachdk'] = Variable<String?>(ngaythuhoachdk.value);
    }
    if (ngaycoghe.present) {
      map['ngaycoghe'] = Variable<String?>(ngaycoghe.value);
    }
    if (ngaycoghestr.present) {
      map['ngaycoghestr'] = Variable<String?>(ngaycoghestr.value);
    }
    if (taitrongkenh.present) {
      map['taitrongkenh'] = Variable<double?>(taitrongkenh.value);
    }
    if (maghe.present) {
      map['maghe'] = Variable<String?>(maghe.value);
    }
    if (tenghe.present) {
      map['tenghe'] = Variable<String?>(tenghe.value);
    }
    if (sophuongtien.present) {
      map['sophuongtien'] = Variable<String?>(sophuongtien.value);
    }
    if (ngaylenghe.present) {
      map['ngaylenghe'] = Variable<String?>(ngaylenghe.value);
    }
    if (ngayghevenhamay.present) {
      map['ngayghevenhamay'] = Variable<String?>(ngayghevenhamay.value);
    }
    if (giavanchuyen.present) {
      map['giavanchuyen'] = Variable<double?>(giavanchuyen.value);
    }
    if (giabocxep.present) {
      map['giabocxep'] = Variable<double?>(giabocxep.value);
    }
    if (luongvanchuyen.present) {
      map['luongvanchuyen'] = Variable<double?>(luongvanchuyen.value);
    }
    if (thuhoachdieughechitietidenct.present) {
      map['thuhoachdieughechitietidenct'] =
          Variable<double?>(thuhoachdieughechitietidenct.value);
    }
    if (trangthaivc.present) {
      map['trangthaivc'] = Variable<double?>(trangthaivc.value);
    }
    if (tentrangthaivc.present) {
      map['tentrangthaivc'] = Variable<String?>(tentrangthaivc.value);
    }
    if (thanhtien.present) {
      map['thanhtien'] = Variable<double?>(thanhtien.value);
    }
    if (tenchughe.present) {
      map['tenchughe'] = Variable<String?>(tenchughe.value);
    }
    if (dienthoaichughe.present) {
      map['dienthoaichughe'] = Variable<String?>(dienthoaichughe.value);
    }
    if (cmnd.present) {
      map['cmnd'] = Variable<String?>(cmnd.value);
    }
    if (ngaycap.present) {
      map['ngaycap'] = Variable<String?>(ngaycap.value);
    }
    if (noicap.present) {
      map['noicap'] = Variable<String?>(noicap.value);
    }
    if (loaighe.present) {
      map['loaighe'] = Variable<int?>(loaighe.value);
    }
    if (denghiduyetgia.present) {
      map['denghiduyetgia'] = Variable<String?>(denghiduyetgia.value);
    }
    if (dongiathuong.present) {
      map['dongiathuong'] = Variable<double?>(dongiathuong.value);
    }
    if (phulucso.present) {
      map['phulucso'] = Variable<String?>(phulucso.value);
    }
    if (vanchuyenve.present) {
      map['vanchuyenve'] = Variable<String?>(vanchuyenve.value);
    }
    if (idct.present) {
      map['idct'] = Variable<String?>(idct.value);
    }
    if (makenhbh.present) {
      map['makenhbh'] = Variable<String?>(makenhbh.value);
    }
    if (tenkenhbh.present) {
      map['tenkenhbh'] = Variable<String?>(tenkenhbh.value);
    }
    if (makhach.present) {
      map['makhach'] = Variable<String?>(makhach.value);
    }
    if (tenkhach.present) {
      map['tenkhach'] = Variable<String?>(tenkhach.value);
    }
    if (sanluongcan.present) {
      map['sanluongcan'] = Variable<double?>(sanluongcan.value);
    }
    if (sobao.present) {
      map['sobao'] = Variable<double?>(sobao.value);
    }
    if (khoiluong_bao.present) {
      map['khoiluong_bao'] = Variable<double?>(khoiluong_bao.value);
    }
    if (tongkhoiluong_tru_bao.present) {
      map['tongkhoiluong_tru_bao'] =
          Variable<double?>(tongkhoiluong_tru_bao.value);
    }
    if (khoiluong_tapchat.present) {
      map['khoiluong_tapchat'] = Variable<double?>(khoiluong_tapchat.value);
    }
    if (tongkhoiluong_tru_tapchat.present) {
      map['tongkhoiluong_tru_tapchat'] =
          Variable<double?>(tongkhoiluong_tru_tapchat.value);
    }
    if (tongkhoiluong.present) {
      map['tongkhoiluong'] = Variable<double?>(tongkhoiluong.value);
    }
    if (giachot.present) {
      map['giachot'] = Variable<double?>(giachot.value);
    }
    if (bacung_can.present) {
      map['bacung_can'] = Variable<bool?>(bacung_can.value);
    }
    if (tinh.present) {
      map['tinh'] = Variable<String?>(tinh.value);
    }
    if (huyen.present) {
      map['huyen'] = Variable<String?>(huyen.value);
    }
    if (xa.present) {
      map['xa'] = Variable<String?>(xa.value);
    }
    if (tentinh.present) {
      map['tentinh'] = Variable<String?>(tentinh.value);
    }
    if (tenhuyen.present) {
      map['tenhuyen'] = Variable<String?>(tenhuyen.value);
    }
    if (tenxa.present) {
      map['tenxa'] = Variable<String?>(tenxa.value);
    }
    if (ghichu.present) {
      map['ghichu'] = Variable<String?>(ghichu.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TicketsCompanion(')
          ..write('id: $id, ')
          ..write('idenct: $idenct, ')
          ..write('sophieucan: $sophieucan, ')
          ..write('sophieu: $sophieu, ')
          ..write('so_bbtm: $so_bbtm, ')
          ..write('ngaycandb: $ngaycandb, ')
          ..write('createdon: $createdon, ')
          ..write('ngaycan: $ngaycan, ')
          ..write('mand: $mand, ')
          ..write('tennd: $tennd, ')
          ..write('makhuruong: $makhuruong, ')
          ..write('idCanLua: $idCanLua, ')
          ..write('tenkhuruong: $tenkhuruong, ')
          ..write('tengiong: $tengiong, ')
          ..write('magiong: $magiong, ')
          ..write('tencaytrong: $tencaytrong, ')
          ..write('tieuchuan: $tieuchuan, ')
          ..write('dientichchot: $dientichchot, ')
          ..write('sanluongdukien: $sanluongdukien, ')
          ..write('ngaythuhoachdk: $ngaythuhoachdk, ')
          ..write('ngaycoghe: $ngaycoghe, ')
          ..write('ngaycoghestr: $ngaycoghestr, ')
          ..write('taitrongkenh: $taitrongkenh, ')
          ..write('maghe: $maghe, ')
          ..write('tenghe: $tenghe, ')
          ..write('sophuongtien: $sophuongtien, ')
          ..write('ngaylenghe: $ngaylenghe, ')
          ..write('ngayghevenhamay: $ngayghevenhamay, ')
          ..write('giavanchuyen: $giavanchuyen, ')
          ..write('giabocxep: $giabocxep, ')
          ..write('luongvanchuyen: $luongvanchuyen, ')
          ..write(
              'thuhoachdieughechitietidenct: $thuhoachdieughechitietidenct, ')
          ..write('trangthaivc: $trangthaivc, ')
          ..write('tentrangthaivc: $tentrangthaivc, ')
          ..write('thanhtien: $thanhtien, ')
          ..write('tenchughe: $tenchughe, ')
          ..write('dienthoaichughe: $dienthoaichughe, ')
          ..write('cmnd: $cmnd, ')
          ..write('ngaycap: $ngaycap, ')
          ..write('noicap: $noicap, ')
          ..write('loaighe: $loaighe, ')
          ..write('denghiduyetgia: $denghiduyetgia, ')
          ..write('dongiathuong: $dongiathuong, ')
          ..write('phulucso: $phulucso, ')
          ..write('vanchuyenve: $vanchuyenve, ')
          ..write('idct: $idct, ')
          ..write('makenhbh: $makenhbh, ')
          ..write('tenkenhbh: $tenkenhbh, ')
          ..write('makhach: $makhach, ')
          ..write('tenkhach: $tenkhach, ')
          ..write('sanluongcan: $sanluongcan, ')
          ..write('sobao: $sobao, ')
          ..write('khoiluong_bao: $khoiluong_bao, ')
          ..write('tongkhoiluong_tru_bao: $tongkhoiluong_tru_bao, ')
          ..write('khoiluong_tapchat: $khoiluong_tapchat, ')
          ..write('tongkhoiluong_tru_tapchat: $tongkhoiluong_tru_tapchat, ')
          ..write('tongkhoiluong: $tongkhoiluong, ')
          ..write('giachot: $giachot, ')
          ..write('bacung_can: $bacung_can, ')
          ..write('tinh: $tinh, ')
          ..write('huyen: $huyen, ')
          ..write('xa: $xa, ')
          ..write('tentinh: $tentinh, ')
          ..write('tenhuyen: $tenhuyen, ')
          ..write('tenxa: $tenxa, ')
          ..write('ghichu: $ghichu, ')
          ..write('isSync: $isSync')
          ..write(')'))
        .toString();
  }
}

class $TicketsTable extends Tickets with TableInfo<$TicketsTable, TicketEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TicketsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idenctMeta = const VerificationMeta('idenct');
  @override
  late final GeneratedColumn<int?> idenct = GeneratedColumn<int?>(
      'idenct', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _sophieucanMeta = const VerificationMeta('sophieucan');
  @override
  late final GeneratedColumn<String?> sophieucan = GeneratedColumn<String?>(
      'sophieucan', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sophieuMeta = const VerificationMeta('sophieu');
  @override
  late final GeneratedColumn<String?> sophieu = GeneratedColumn<String?>(
      'sophieu', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _so_bbtmMeta = const VerificationMeta('so_bbtm');
  @override
  late final GeneratedColumn<String?> so_bbtm = GeneratedColumn<String?>(
      'so_bbtm', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ngaycandbMeta = const VerificationMeta('ngaycandb');
  @override
  late final GeneratedColumn<DateTime?> ngaycandb = GeneratedColumn<DateTime?>(
      'ngaycandb', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _createdonMeta = const VerificationMeta('createdon');
  @override
  late final GeneratedColumn<DateTime?> createdon = GeneratedColumn<DateTime?>(
      'createdon', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _ngaycanMeta = const VerificationMeta('ngaycan');
  @override
  late final GeneratedColumn<String?> ngaycan = GeneratedColumn<String?>(
      'ngaycan', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _mandMeta = const VerificationMeta('mand');
  @override
  late final GeneratedColumn<String?> mand = GeneratedColumn<String?>(
      'mand', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenndMeta = const VerificationMeta('tennd');
  @override
  late final GeneratedColumn<String?> tennd = GeneratedColumn<String?>(
      'tennd', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _makhuruongMeta = const VerificationMeta('makhuruong');
  @override
  late final GeneratedColumn<String?> makhuruong = GeneratedColumn<String?>(
      'makhuruong', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _idCanLuaMeta = const VerificationMeta('idCanLua');
  @override
  late final GeneratedColumn<String?> idCanLua = GeneratedColumn<String?>(
      'id_can_lua', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenkhuruongMeta =
      const VerificationMeta('tenkhuruong');
  @override
  late final GeneratedColumn<String?> tenkhuruong = GeneratedColumn<String?>(
      'tenkhuruong', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tengiongMeta = const VerificationMeta('tengiong');
  @override
  late final GeneratedColumn<String?> tengiong = GeneratedColumn<String?>(
      'tengiong', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _magiongMeta = const VerificationMeta('magiong');
  @override
  late final GeneratedColumn<String?> magiong = GeneratedColumn<String?>(
      'magiong', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tencaytrongMeta =
      const VerificationMeta('tencaytrong');
  @override
  late final GeneratedColumn<String?> tencaytrong = GeneratedColumn<String?>(
      'tencaytrong', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tieuchuanMeta = const VerificationMeta('tieuchuan');
  @override
  late final GeneratedColumn<String?> tieuchuan = GeneratedColumn<String?>(
      'tieuchuan', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dientichchotMeta =
      const VerificationMeta('dientichchot');
  @override
  late final GeneratedColumn<double?> dientichchot = GeneratedColumn<double?>(
      'dientichchot', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _sanluongdukienMeta =
      const VerificationMeta('sanluongdukien');
  @override
  late final GeneratedColumn<double?> sanluongdukien = GeneratedColumn<double?>(
      'sanluongdukien', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _ngaythuhoachdkMeta =
      const VerificationMeta('ngaythuhoachdk');
  @override
  late final GeneratedColumn<String?> ngaythuhoachdk = GeneratedColumn<String?>(
      'ngaythuhoachdk', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ngaycogheMeta = const VerificationMeta('ngaycoghe');
  @override
  late final GeneratedColumn<String?> ngaycoghe = GeneratedColumn<String?>(
      'ngaycoghe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ngaycoghestrMeta =
      const VerificationMeta('ngaycoghestr');
  @override
  late final GeneratedColumn<String?> ngaycoghestr = GeneratedColumn<String?>(
      'ngaycoghestr', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _taitrongkenhMeta =
      const VerificationMeta('taitrongkenh');
  @override
  late final GeneratedColumn<double?> taitrongkenh = GeneratedColumn<double?>(
      'taitrongkenh', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _magheMeta = const VerificationMeta('maghe');
  @override
  late final GeneratedColumn<String?> maghe = GeneratedColumn<String?>(
      'maghe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tengheMeta = const VerificationMeta('tenghe');
  @override
  late final GeneratedColumn<String?> tenghe = GeneratedColumn<String?>(
      'tenghe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _sophuongtienMeta =
      const VerificationMeta('sophuongtien');
  @override
  late final GeneratedColumn<String?> sophuongtien = GeneratedColumn<String?>(
      'sophuongtien', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ngaylengheMeta = const VerificationMeta('ngaylenghe');
  @override
  late final GeneratedColumn<String?> ngaylenghe = GeneratedColumn<String?>(
      'ngaylenghe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ngayghevenhamayMeta =
      const VerificationMeta('ngayghevenhamay');
  @override
  late final GeneratedColumn<String?> ngayghevenhamay =
      GeneratedColumn<String?>('ngayghevenhamay', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _giavanchuyenMeta =
      const VerificationMeta('giavanchuyen');
  @override
  late final GeneratedColumn<double?> giavanchuyen = GeneratedColumn<double?>(
      'giavanchuyen', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _giabocxepMeta = const VerificationMeta('giabocxep');
  @override
  late final GeneratedColumn<double?> giabocxep = GeneratedColumn<double?>(
      'giabocxep', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _luongvanchuyenMeta =
      const VerificationMeta('luongvanchuyen');
  @override
  late final GeneratedColumn<double?> luongvanchuyen = GeneratedColumn<double?>(
      'luongvanchuyen', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _thuhoachdieughechitietidenctMeta =
      const VerificationMeta('thuhoachdieughechitietidenct');
  @override
  late final GeneratedColumn<double?> thuhoachdieughechitietidenct =
      GeneratedColumn<double?>(
          'thuhoachdieughechitietidenct', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _trangthaivcMeta =
      const VerificationMeta('trangthaivc');
  @override
  late final GeneratedColumn<double?> trangthaivc = GeneratedColumn<double?>(
      'trangthaivc', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _tentrangthaivcMeta =
      const VerificationMeta('tentrangthaivc');
  @override
  late final GeneratedColumn<String?> tentrangthaivc = GeneratedColumn<String?>(
      'tentrangthaivc', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _thanhtienMeta = const VerificationMeta('thanhtien');
  @override
  late final GeneratedColumn<double?> thanhtien = GeneratedColumn<double?>(
      'thanhtien', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _tenchugheMeta = const VerificationMeta('tenchughe');
  @override
  late final GeneratedColumn<String?> tenchughe = GeneratedColumn<String?>(
      'tenchughe', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dienthoaichugheMeta =
      const VerificationMeta('dienthoaichughe');
  @override
  late final GeneratedColumn<String?> dienthoaichughe =
      GeneratedColumn<String?>('dienthoaichughe', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _cmndMeta = const VerificationMeta('cmnd');
  @override
  late final GeneratedColumn<String?> cmnd = GeneratedColumn<String?>(
      'cmnd', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ngaycapMeta = const VerificationMeta('ngaycap');
  @override
  late final GeneratedColumn<String?> ngaycap = GeneratedColumn<String?>(
      'ngaycap', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _noicapMeta = const VerificationMeta('noicap');
  @override
  late final GeneratedColumn<String?> noicap = GeneratedColumn<String?>(
      'noicap', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _loaigheMeta = const VerificationMeta('loaighe');
  @override
  late final GeneratedColumn<int?> loaighe = GeneratedColumn<int?>(
      'loaighe', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _denghiduyetgiaMeta =
      const VerificationMeta('denghiduyetgia');
  @override
  late final GeneratedColumn<String?> denghiduyetgia = GeneratedColumn<String?>(
      'denghiduyetgia', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _dongiathuongMeta =
      const VerificationMeta('dongiathuong');
  @override
  late final GeneratedColumn<double?> dongiathuong = GeneratedColumn<double?>(
      'dongiathuong', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _phulucsoMeta = const VerificationMeta('phulucso');
  @override
  late final GeneratedColumn<String?> phulucso = GeneratedColumn<String?>(
      'phulucso', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _vanchuyenveMeta =
      const VerificationMeta('vanchuyenve');
  @override
  late final GeneratedColumn<String?> vanchuyenve = GeneratedColumn<String?>(
      'vanchuyenve', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _idctMeta = const VerificationMeta('idct');
  @override
  late final GeneratedColumn<String?> idct = GeneratedColumn<String?>(
      'idct', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _makenhbhMeta = const VerificationMeta('makenhbh');
  @override
  late final GeneratedColumn<String?> makenhbh = GeneratedColumn<String?>(
      'makenhbh', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenkenhbhMeta = const VerificationMeta('tenkenhbh');
  @override
  late final GeneratedColumn<String?> tenkenhbh = GeneratedColumn<String?>(
      'tenkenhbh', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _makhachMeta = const VerificationMeta('makhach');
  @override
  late final GeneratedColumn<String?> makhach = GeneratedColumn<String?>(
      'makhach', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenkhachMeta = const VerificationMeta('tenkhach');
  @override
  late final GeneratedColumn<String?> tenkhach = GeneratedColumn<String?>(
      'tenkhach', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _sanluongcanMeta =
      const VerificationMeta('sanluongcan');
  @override
  late final GeneratedColumn<double?> sanluongcan = GeneratedColumn<double?>(
      'sanluongcan', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _sobaoMeta = const VerificationMeta('sobao');
  @override
  late final GeneratedColumn<double?> sobao = GeneratedColumn<double?>(
      'sobao', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _khoiluong_baoMeta =
      const VerificationMeta('khoiluong_bao');
  @override
  late final GeneratedColumn<double?> khoiluong_bao = GeneratedColumn<double?>(
      'khoiluong_bao', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _tongkhoiluong_tru_baoMeta =
      const VerificationMeta('tongkhoiluong_tru_bao');
  @override
  late final GeneratedColumn<double?> tongkhoiluong_tru_bao =
      GeneratedColumn<double?>('tongkhoiluong_tru_bao', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _khoiluong_tapchatMeta =
      const VerificationMeta('khoiluong_tapchat');
  @override
  late final GeneratedColumn<double?> khoiluong_tapchat =
      GeneratedColumn<double?>('khoiluong_tapchat', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _tongkhoiluong_tru_tapchatMeta =
      const VerificationMeta('tongkhoiluong_tru_tapchat');
  @override
  late final GeneratedColumn<double?> tongkhoiluong_tru_tapchat =
      GeneratedColumn<double?>('tongkhoiluong_tru_tapchat', aliasedName, true,
          type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _tongkhoiluongMeta =
      const VerificationMeta('tongkhoiluong');
  @override
  late final GeneratedColumn<double?> tongkhoiluong = GeneratedColumn<double?>(
      'tongkhoiluong', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _giachotMeta = const VerificationMeta('giachot');
  @override
  late final GeneratedColumn<double?> giachot = GeneratedColumn<double?>(
      'giachot', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _bacung_canMeta = const VerificationMeta('bacung_can');
  @override
  late final GeneratedColumn<bool?> bacung_can = GeneratedColumn<bool?>(
      'bacung_can', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (bacung_can IN (0, 1))');
  final VerificationMeta _tinhMeta = const VerificationMeta('tinh');
  @override
  late final GeneratedColumn<String?> tinh = GeneratedColumn<String?>(
      'tinh', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _huyenMeta = const VerificationMeta('huyen');
  @override
  late final GeneratedColumn<String?> huyen = GeneratedColumn<String?>(
      'huyen', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _xaMeta = const VerificationMeta('xa');
  @override
  late final GeneratedColumn<String?> xa = GeneratedColumn<String?>(
      'xa', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tentinhMeta = const VerificationMeta('tentinh');
  @override
  late final GeneratedColumn<String?> tentinh = GeneratedColumn<String?>(
      'tentinh', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenhuyenMeta = const VerificationMeta('tenhuyen');
  @override
  late final GeneratedColumn<String?> tenhuyen = GeneratedColumn<String?>(
      'tenhuyen', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenxaMeta = const VerificationMeta('tenxa');
  @override
  late final GeneratedColumn<String?> tenxa = GeneratedColumn<String?>(
      'tenxa', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _ghichuMeta = const VerificationMeta('ghichu');
  @override
  late final GeneratedColumn<String?> ghichu = GeneratedColumn<String?>(
      'ghichu', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  @override
  late final GeneratedColumn<bool?> isSync = GeneratedColumn<bool?>(
      'is_sync', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_sync IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idenct,
        sophieucan,
        sophieu,
        so_bbtm,
        ngaycandb,
        createdon,
        ngaycan,
        mand,
        tennd,
        makhuruong,
        idCanLua,
        tenkhuruong,
        tengiong,
        magiong,
        tencaytrong,
        tieuchuan,
        dientichchot,
        sanluongdukien,
        ngaythuhoachdk,
        ngaycoghe,
        ngaycoghestr,
        taitrongkenh,
        maghe,
        tenghe,
        sophuongtien,
        ngaylenghe,
        ngayghevenhamay,
        giavanchuyen,
        giabocxep,
        luongvanchuyen,
        thuhoachdieughechitietidenct,
        trangthaivc,
        tentrangthaivc,
        thanhtien,
        tenchughe,
        dienthoaichughe,
        cmnd,
        ngaycap,
        noicap,
        loaighe,
        denghiduyetgia,
        dongiathuong,
        phulucso,
        vanchuyenve,
        idct,
        makenhbh,
        tenkenhbh,
        makhach,
        tenkhach,
        sanluongcan,
        sobao,
        khoiluong_bao,
        tongkhoiluong_tru_bao,
        khoiluong_tapchat,
        tongkhoiluong_tru_tapchat,
        tongkhoiluong,
        giachot,
        bacung_can,
        tinh,
        huyen,
        xa,
        tentinh,
        tenhuyen,
        tenxa,
        ghichu,
        isSync
      ];
  @override
  String get aliasedName => _alias ?? 'tickets';
  @override
  String get actualTableName => 'tickets';
  @override
  VerificationContext validateIntegrity(Insertable<TicketEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('idenct')) {
      context.handle(_idenctMeta,
          idenct.isAcceptableOrUnknown(data['idenct']!, _idenctMeta));
    } else if (isInserting) {
      context.missing(_idenctMeta);
    }
    if (data.containsKey('sophieucan')) {
      context.handle(
          _sophieucanMeta,
          sophieucan.isAcceptableOrUnknown(
              data['sophieucan']!, _sophieucanMeta));
    } else if (isInserting) {
      context.missing(_sophieucanMeta);
    }
    if (data.containsKey('sophieu')) {
      context.handle(_sophieuMeta,
          sophieu.isAcceptableOrUnknown(data['sophieu']!, _sophieuMeta));
    }
    if (data.containsKey('so_bbtm')) {
      context.handle(_so_bbtmMeta,
          so_bbtm.isAcceptableOrUnknown(data['so_bbtm']!, _so_bbtmMeta));
    }
    if (data.containsKey('ngaycandb')) {
      context.handle(_ngaycandbMeta,
          ngaycandb.isAcceptableOrUnknown(data['ngaycandb']!, _ngaycandbMeta));
    }
    if (data.containsKey('createdon')) {
      context.handle(_createdonMeta,
          createdon.isAcceptableOrUnknown(data['createdon']!, _createdonMeta));
    }
    if (data.containsKey('ngaycan')) {
      context.handle(_ngaycanMeta,
          ngaycan.isAcceptableOrUnknown(data['ngaycan']!, _ngaycanMeta));
    }
    if (data.containsKey('mand')) {
      context.handle(
          _mandMeta, mand.isAcceptableOrUnknown(data['mand']!, _mandMeta));
    }
    if (data.containsKey('tennd')) {
      context.handle(
          _tenndMeta, tennd.isAcceptableOrUnknown(data['tennd']!, _tenndMeta));
    }
    if (data.containsKey('makhuruong')) {
      context.handle(
          _makhuruongMeta,
          makhuruong.isAcceptableOrUnknown(
              data['makhuruong']!, _makhuruongMeta));
    }
    if (data.containsKey('id_can_lua')) {
      context.handle(_idCanLuaMeta,
          idCanLua.isAcceptableOrUnknown(data['id_can_lua']!, _idCanLuaMeta));
    }
    if (data.containsKey('tenkhuruong')) {
      context.handle(
          _tenkhuruongMeta,
          tenkhuruong.isAcceptableOrUnknown(
              data['tenkhuruong']!, _tenkhuruongMeta));
    }
    if (data.containsKey('tengiong')) {
      context.handle(_tengiongMeta,
          tengiong.isAcceptableOrUnknown(data['tengiong']!, _tengiongMeta));
    }
    if (data.containsKey('magiong')) {
      context.handle(_magiongMeta,
          magiong.isAcceptableOrUnknown(data['magiong']!, _magiongMeta));
    }
    if (data.containsKey('tencaytrong')) {
      context.handle(
          _tencaytrongMeta,
          tencaytrong.isAcceptableOrUnknown(
              data['tencaytrong']!, _tencaytrongMeta));
    }
    if (data.containsKey('tieuchuan')) {
      context.handle(_tieuchuanMeta,
          tieuchuan.isAcceptableOrUnknown(data['tieuchuan']!, _tieuchuanMeta));
    }
    if (data.containsKey('dientichchot')) {
      context.handle(
          _dientichchotMeta,
          dientichchot.isAcceptableOrUnknown(
              data['dientichchot']!, _dientichchotMeta));
    }
    if (data.containsKey('sanluongdukien')) {
      context.handle(
          _sanluongdukienMeta,
          sanluongdukien.isAcceptableOrUnknown(
              data['sanluongdukien']!, _sanluongdukienMeta));
    }
    if (data.containsKey('ngaythuhoachdk')) {
      context.handle(
          _ngaythuhoachdkMeta,
          ngaythuhoachdk.isAcceptableOrUnknown(
              data['ngaythuhoachdk']!, _ngaythuhoachdkMeta));
    }
    if (data.containsKey('ngaycoghe')) {
      context.handle(_ngaycogheMeta,
          ngaycoghe.isAcceptableOrUnknown(data['ngaycoghe']!, _ngaycogheMeta));
    }
    if (data.containsKey('ngaycoghestr')) {
      context.handle(
          _ngaycoghestrMeta,
          ngaycoghestr.isAcceptableOrUnknown(
              data['ngaycoghestr']!, _ngaycoghestrMeta));
    }
    if (data.containsKey('taitrongkenh')) {
      context.handle(
          _taitrongkenhMeta,
          taitrongkenh.isAcceptableOrUnknown(
              data['taitrongkenh']!, _taitrongkenhMeta));
    }
    if (data.containsKey('maghe')) {
      context.handle(
          _magheMeta, maghe.isAcceptableOrUnknown(data['maghe']!, _magheMeta));
    }
    if (data.containsKey('tenghe')) {
      context.handle(_tengheMeta,
          tenghe.isAcceptableOrUnknown(data['tenghe']!, _tengheMeta));
    }
    if (data.containsKey('sophuongtien')) {
      context.handle(
          _sophuongtienMeta,
          sophuongtien.isAcceptableOrUnknown(
              data['sophuongtien']!, _sophuongtienMeta));
    }
    if (data.containsKey('ngaylenghe')) {
      context.handle(
          _ngaylengheMeta,
          ngaylenghe.isAcceptableOrUnknown(
              data['ngaylenghe']!, _ngaylengheMeta));
    }
    if (data.containsKey('ngayghevenhamay')) {
      context.handle(
          _ngayghevenhamayMeta,
          ngayghevenhamay.isAcceptableOrUnknown(
              data['ngayghevenhamay']!, _ngayghevenhamayMeta));
    }
    if (data.containsKey('giavanchuyen')) {
      context.handle(
          _giavanchuyenMeta,
          giavanchuyen.isAcceptableOrUnknown(
              data['giavanchuyen']!, _giavanchuyenMeta));
    }
    if (data.containsKey('giabocxep')) {
      context.handle(_giabocxepMeta,
          giabocxep.isAcceptableOrUnknown(data['giabocxep']!, _giabocxepMeta));
    }
    if (data.containsKey('luongvanchuyen')) {
      context.handle(
          _luongvanchuyenMeta,
          luongvanchuyen.isAcceptableOrUnknown(
              data['luongvanchuyen']!, _luongvanchuyenMeta));
    }
    if (data.containsKey('thuhoachdieughechitietidenct')) {
      context.handle(
          _thuhoachdieughechitietidenctMeta,
          thuhoachdieughechitietidenct.isAcceptableOrUnknown(
              data['thuhoachdieughechitietidenct']!,
              _thuhoachdieughechitietidenctMeta));
    }
    if (data.containsKey('trangthaivc')) {
      context.handle(
          _trangthaivcMeta,
          trangthaivc.isAcceptableOrUnknown(
              data['trangthaivc']!, _trangthaivcMeta));
    }
    if (data.containsKey('tentrangthaivc')) {
      context.handle(
          _tentrangthaivcMeta,
          tentrangthaivc.isAcceptableOrUnknown(
              data['tentrangthaivc']!, _tentrangthaivcMeta));
    }
    if (data.containsKey('thanhtien')) {
      context.handle(_thanhtienMeta,
          thanhtien.isAcceptableOrUnknown(data['thanhtien']!, _thanhtienMeta));
    }
    if (data.containsKey('tenchughe')) {
      context.handle(_tenchugheMeta,
          tenchughe.isAcceptableOrUnknown(data['tenchughe']!, _tenchugheMeta));
    }
    if (data.containsKey('dienthoaichughe')) {
      context.handle(
          _dienthoaichugheMeta,
          dienthoaichughe.isAcceptableOrUnknown(
              data['dienthoaichughe']!, _dienthoaichugheMeta));
    }
    if (data.containsKey('cmnd')) {
      context.handle(
          _cmndMeta, cmnd.isAcceptableOrUnknown(data['cmnd']!, _cmndMeta));
    }
    if (data.containsKey('ngaycap')) {
      context.handle(_ngaycapMeta,
          ngaycap.isAcceptableOrUnknown(data['ngaycap']!, _ngaycapMeta));
    }
    if (data.containsKey('noicap')) {
      context.handle(_noicapMeta,
          noicap.isAcceptableOrUnknown(data['noicap']!, _noicapMeta));
    }
    if (data.containsKey('loaighe')) {
      context.handle(_loaigheMeta,
          loaighe.isAcceptableOrUnknown(data['loaighe']!, _loaigheMeta));
    }
    if (data.containsKey('denghiduyetgia')) {
      context.handle(
          _denghiduyetgiaMeta,
          denghiduyetgia.isAcceptableOrUnknown(
              data['denghiduyetgia']!, _denghiduyetgiaMeta));
    }
    if (data.containsKey('dongiathuong')) {
      context.handle(
          _dongiathuongMeta,
          dongiathuong.isAcceptableOrUnknown(
              data['dongiathuong']!, _dongiathuongMeta));
    }
    if (data.containsKey('phulucso')) {
      context.handle(_phulucsoMeta,
          phulucso.isAcceptableOrUnknown(data['phulucso']!, _phulucsoMeta));
    }
    if (data.containsKey('vanchuyenve')) {
      context.handle(
          _vanchuyenveMeta,
          vanchuyenve.isAcceptableOrUnknown(
              data['vanchuyenve']!, _vanchuyenveMeta));
    }
    if (data.containsKey('idct')) {
      context.handle(
          _idctMeta, idct.isAcceptableOrUnknown(data['idct']!, _idctMeta));
    }
    if (data.containsKey('makenhbh')) {
      context.handle(_makenhbhMeta,
          makenhbh.isAcceptableOrUnknown(data['makenhbh']!, _makenhbhMeta));
    }
    if (data.containsKey('tenkenhbh')) {
      context.handle(_tenkenhbhMeta,
          tenkenhbh.isAcceptableOrUnknown(data['tenkenhbh']!, _tenkenhbhMeta));
    }
    if (data.containsKey('makhach')) {
      context.handle(_makhachMeta,
          makhach.isAcceptableOrUnknown(data['makhach']!, _makhachMeta));
    }
    if (data.containsKey('tenkhach')) {
      context.handle(_tenkhachMeta,
          tenkhach.isAcceptableOrUnknown(data['tenkhach']!, _tenkhachMeta));
    }
    if (data.containsKey('sanluongcan')) {
      context.handle(
          _sanluongcanMeta,
          sanluongcan.isAcceptableOrUnknown(
              data['sanluongcan']!, _sanluongcanMeta));
    }
    if (data.containsKey('sobao')) {
      context.handle(
          _sobaoMeta, sobao.isAcceptableOrUnknown(data['sobao']!, _sobaoMeta));
    }
    if (data.containsKey('khoiluong_bao')) {
      context.handle(
          _khoiluong_baoMeta,
          khoiluong_bao.isAcceptableOrUnknown(
              data['khoiluong_bao']!, _khoiluong_baoMeta));
    }
    if (data.containsKey('tongkhoiluong_tru_bao')) {
      context.handle(
          _tongkhoiluong_tru_baoMeta,
          tongkhoiluong_tru_bao.isAcceptableOrUnknown(
              data['tongkhoiluong_tru_bao']!, _tongkhoiluong_tru_baoMeta));
    }
    if (data.containsKey('khoiluong_tapchat')) {
      context.handle(
          _khoiluong_tapchatMeta,
          khoiluong_tapchat.isAcceptableOrUnknown(
              data['khoiluong_tapchat']!, _khoiluong_tapchatMeta));
    }
    if (data.containsKey('tongkhoiluong_tru_tapchat')) {
      context.handle(
          _tongkhoiluong_tru_tapchatMeta,
          tongkhoiluong_tru_tapchat.isAcceptableOrUnknown(
              data['tongkhoiluong_tru_tapchat']!,
              _tongkhoiluong_tru_tapchatMeta));
    }
    if (data.containsKey('tongkhoiluong')) {
      context.handle(
          _tongkhoiluongMeta,
          tongkhoiluong.isAcceptableOrUnknown(
              data['tongkhoiluong']!, _tongkhoiluongMeta));
    }
    if (data.containsKey('giachot')) {
      context.handle(_giachotMeta,
          giachot.isAcceptableOrUnknown(data['giachot']!, _giachotMeta));
    }
    if (data.containsKey('bacung_can')) {
      context.handle(
          _bacung_canMeta,
          bacung_can.isAcceptableOrUnknown(
              data['bacung_can']!, _bacung_canMeta));
    }
    if (data.containsKey('tinh')) {
      context.handle(
          _tinhMeta, tinh.isAcceptableOrUnknown(data['tinh']!, _tinhMeta));
    }
    if (data.containsKey('huyen')) {
      context.handle(
          _huyenMeta, huyen.isAcceptableOrUnknown(data['huyen']!, _huyenMeta));
    }
    if (data.containsKey('xa')) {
      context.handle(_xaMeta, xa.isAcceptableOrUnknown(data['xa']!, _xaMeta));
    }
    if (data.containsKey('tentinh')) {
      context.handle(_tentinhMeta,
          tentinh.isAcceptableOrUnknown(data['tentinh']!, _tentinhMeta));
    }
    if (data.containsKey('tenhuyen')) {
      context.handle(_tenhuyenMeta,
          tenhuyen.isAcceptableOrUnknown(data['tenhuyen']!, _tenhuyenMeta));
    }
    if (data.containsKey('tenxa')) {
      context.handle(
          _tenxaMeta, tenxa.isAcceptableOrUnknown(data['tenxa']!, _tenxaMeta));
    }
    if (data.containsKey('ghichu')) {
      context.handle(_ghichuMeta,
          ghichu.isAcceptableOrUnknown(data['ghichu']!, _ghichuMeta));
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    } else if (isInserting) {
      context.missing(_isSyncMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TicketEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TicketEntry.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TicketsTable createAlias(String alias) {
    return $TicketsTable(attachedDatabase, alias);
  }
}

class BagRicesEntryDelete extends DataClass
    implements Insertable<BagRicesEntryDelete> {
  final int id;
  final int idLocalBaoLua;
  final int? idOnlineBaoLua;
  final String idCanLua;
  final String sophieucan;
  BagRicesEntryDelete(
      {required this.id,
      required this.idLocalBaoLua,
      this.idOnlineBaoLua,
      required this.idCanLua,
      required this.sophieucan});
  factory BagRicesEntryDelete.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BagRicesEntryDelete(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idLocalBaoLua: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_local_bao_lua'])!,
      idOnlineBaoLua: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_online_bao_lua']),
      idCanLua: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_can_lua'])!,
      sophieucan: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sophieucan'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_local_bao_lua'] = Variable<int>(idLocalBaoLua);
    if (!nullToAbsent || idOnlineBaoLua != null) {
      map['id_online_bao_lua'] = Variable<int?>(idOnlineBaoLua);
    }
    map['id_can_lua'] = Variable<String>(idCanLua);
    map['sophieucan'] = Variable<String>(sophieucan);
    return map;
  }

  BagRicesDeleteCompanion toCompanion(bool nullToAbsent) {
    return BagRicesDeleteCompanion(
      id: Value(id),
      idLocalBaoLua: Value(idLocalBaoLua),
      idOnlineBaoLua: idOnlineBaoLua == null && nullToAbsent
          ? const Value.absent()
          : Value(idOnlineBaoLua),
      idCanLua: Value(idCanLua),
      sophieucan: Value(sophieucan),
    );
  }

  factory BagRicesEntryDelete.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BagRicesEntryDelete(
      id: serializer.fromJson<int>(json['id']),
      idLocalBaoLua: serializer.fromJson<int>(json['idLocalBaoLua']),
      idOnlineBaoLua: serializer.fromJson<int?>(json['idOnlineBaoLua']),
      idCanLua: serializer.fromJson<String>(json['idCanLua']),
      sophieucan: serializer.fromJson<String>(json['sophieucan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idLocalBaoLua': serializer.toJson<int>(idLocalBaoLua),
      'idOnlineBaoLua': serializer.toJson<int?>(idOnlineBaoLua),
      'idCanLua': serializer.toJson<String>(idCanLua),
      'sophieucan': serializer.toJson<String>(sophieucan),
    };
  }

  BagRicesEntryDelete copyWith(
          {int? id,
          int? idLocalBaoLua,
          int? idOnlineBaoLua,
          String? idCanLua,
          String? sophieucan}) =>
      BagRicesEntryDelete(
        id: id ?? this.id,
        idLocalBaoLua: idLocalBaoLua ?? this.idLocalBaoLua,
        idOnlineBaoLua: idOnlineBaoLua ?? this.idOnlineBaoLua,
        idCanLua: idCanLua ?? this.idCanLua,
        sophieucan: sophieucan ?? this.sophieucan,
      );
  @override
  String toString() {
    return (StringBuffer('BagRicesEntryDelete(')
          ..write('id: $id, ')
          ..write('idLocalBaoLua: $idLocalBaoLua, ')
          ..write('idOnlineBaoLua: $idOnlineBaoLua, ')
          ..write('idCanLua: $idCanLua, ')
          ..write('sophieucan: $sophieucan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idLocalBaoLua, idOnlineBaoLua, idCanLua, sophieucan);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BagRicesEntryDelete &&
          other.id == this.id &&
          other.idLocalBaoLua == this.idLocalBaoLua &&
          other.idOnlineBaoLua == this.idOnlineBaoLua &&
          other.idCanLua == this.idCanLua &&
          other.sophieucan == this.sophieucan);
}

class BagRicesDeleteCompanion extends UpdateCompanion<BagRicesEntryDelete> {
  final Value<int> id;
  final Value<int> idLocalBaoLua;
  final Value<int?> idOnlineBaoLua;
  final Value<String> idCanLua;
  final Value<String> sophieucan;
  const BagRicesDeleteCompanion({
    this.id = const Value.absent(),
    this.idLocalBaoLua = const Value.absent(),
    this.idOnlineBaoLua = const Value.absent(),
    this.idCanLua = const Value.absent(),
    this.sophieucan = const Value.absent(),
  });
  BagRicesDeleteCompanion.insert({
    this.id = const Value.absent(),
    required int idLocalBaoLua,
    this.idOnlineBaoLua = const Value.absent(),
    required String idCanLua,
    required String sophieucan,
  })  : idLocalBaoLua = Value(idLocalBaoLua),
        idCanLua = Value(idCanLua),
        sophieucan = Value(sophieucan);
  static Insertable<BagRicesEntryDelete> custom({
    Expression<int>? id,
    Expression<int>? idLocalBaoLua,
    Expression<int?>? idOnlineBaoLua,
    Expression<String>? idCanLua,
    Expression<String>? sophieucan,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idLocalBaoLua != null) 'id_local_bao_lua': idLocalBaoLua,
      if (idOnlineBaoLua != null) 'id_online_bao_lua': idOnlineBaoLua,
      if (idCanLua != null) 'id_can_lua': idCanLua,
      if (sophieucan != null) 'sophieucan': sophieucan,
    });
  }

  BagRicesDeleteCompanion copyWith(
      {Value<int>? id,
      Value<int>? idLocalBaoLua,
      Value<int?>? idOnlineBaoLua,
      Value<String>? idCanLua,
      Value<String>? sophieucan}) {
    return BagRicesDeleteCompanion(
      id: id ?? this.id,
      idLocalBaoLua: idLocalBaoLua ?? this.idLocalBaoLua,
      idOnlineBaoLua: idOnlineBaoLua ?? this.idOnlineBaoLua,
      idCanLua: idCanLua ?? this.idCanLua,
      sophieucan: sophieucan ?? this.sophieucan,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idLocalBaoLua.present) {
      map['id_local_bao_lua'] = Variable<int>(idLocalBaoLua.value);
    }
    if (idOnlineBaoLua.present) {
      map['id_online_bao_lua'] = Variable<int?>(idOnlineBaoLua.value);
    }
    if (idCanLua.present) {
      map['id_can_lua'] = Variable<String>(idCanLua.value);
    }
    if (sophieucan.present) {
      map['sophieucan'] = Variable<String>(sophieucan.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BagRicesDeleteCompanion(')
          ..write('id: $id, ')
          ..write('idLocalBaoLua: $idLocalBaoLua, ')
          ..write('idOnlineBaoLua: $idOnlineBaoLua, ')
          ..write('idCanLua: $idCanLua, ')
          ..write('sophieucan: $sophieucan')
          ..write(')'))
        .toString();
  }
}

class $BagRicesDeleteTable extends BagRicesDelete
    with TableInfo<$BagRicesDeleteTable, BagRicesEntryDelete> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BagRicesDeleteTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idLocalBaoLuaMeta =
      const VerificationMeta('idLocalBaoLua');
  @override
  late final GeneratedColumn<int?> idLocalBaoLua = GeneratedColumn<int?>(
      'id_local_bao_lua', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idOnlineBaoLuaMeta =
      const VerificationMeta('idOnlineBaoLua');
  @override
  late final GeneratedColumn<int?> idOnlineBaoLua = GeneratedColumn<int?>(
      'id_online_bao_lua', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _idCanLuaMeta = const VerificationMeta('idCanLua');
  @override
  late final GeneratedColumn<String?> idCanLua = GeneratedColumn<String?>(
      'id_can_lua', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sophieucanMeta = const VerificationMeta('sophieucan');
  @override
  late final GeneratedColumn<String?> sophieucan = GeneratedColumn<String?>(
      'sophieucan', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, idLocalBaoLua, idOnlineBaoLua, idCanLua, sophieucan];
  @override
  String get aliasedName => _alias ?? 'bag_rices_delete';
  @override
  String get actualTableName => 'bag_rices_delete';
  @override
  VerificationContext validateIntegrity(
      Insertable<BagRicesEntryDelete> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_local_bao_lua')) {
      context.handle(
          _idLocalBaoLuaMeta,
          idLocalBaoLua.isAcceptableOrUnknown(
              data['id_local_bao_lua']!, _idLocalBaoLuaMeta));
    } else if (isInserting) {
      context.missing(_idLocalBaoLuaMeta);
    }
    if (data.containsKey('id_online_bao_lua')) {
      context.handle(
          _idOnlineBaoLuaMeta,
          idOnlineBaoLua.isAcceptableOrUnknown(
              data['id_online_bao_lua']!, _idOnlineBaoLuaMeta));
    }
    if (data.containsKey('id_can_lua')) {
      context.handle(_idCanLuaMeta,
          idCanLua.isAcceptableOrUnknown(data['id_can_lua']!, _idCanLuaMeta));
    } else if (isInserting) {
      context.missing(_idCanLuaMeta);
    }
    if (data.containsKey('sophieucan')) {
      context.handle(
          _sophieucanMeta,
          sophieucan.isAcceptableOrUnknown(
              data['sophieucan']!, _sophieucanMeta));
    } else if (isInserting) {
      context.missing(_sophieucanMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BagRicesEntryDelete map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BagRicesEntryDelete.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BagRicesDeleteTable createAlias(String alias) {
    return $BagRicesDeleteTable(attachedDatabase, alias);
  }
}

class DiaPhuongEntry extends DataClass implements Insertable<DiaPhuongEntry> {
  final int id;
  final String? madp;
  final String? tenkhac;
  final String? mapl;
  DiaPhuongEntry({required this.id, this.madp, this.tenkhac, this.mapl});
  factory DiaPhuongEntry.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DiaPhuongEntry(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      madp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}madp']),
      tenkhac: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tenkhac']),
      mapl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mapl']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || madp != null) {
      map['madp'] = Variable<String?>(madp);
    }
    if (!nullToAbsent || tenkhac != null) {
      map['tenkhac'] = Variable<String?>(tenkhac);
    }
    if (!nullToAbsent || mapl != null) {
      map['mapl'] = Variable<String?>(mapl);
    }
    return map;
  }

  DiaPhuongCompanion toCompanion(bool nullToAbsent) {
    return DiaPhuongCompanion(
      id: Value(id),
      madp: madp == null && nullToAbsent ? const Value.absent() : Value(madp),
      tenkhac: tenkhac == null && nullToAbsent
          ? const Value.absent()
          : Value(tenkhac),
      mapl: mapl == null && nullToAbsent ? const Value.absent() : Value(mapl),
    );
  }

  factory DiaPhuongEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaPhuongEntry(
      id: serializer.fromJson<int>(json['id']),
      madp: serializer.fromJson<String?>(json['madp']),
      tenkhac: serializer.fromJson<String?>(json['tenkhac']),
      mapl: serializer.fromJson<String?>(json['mapl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'madp': serializer.toJson<String?>(madp),
      'tenkhac': serializer.toJson<String?>(tenkhac),
      'mapl': serializer.toJson<String?>(mapl),
    };
  }

  DiaPhuongEntry copyWith(
          {int? id, String? madp, String? tenkhac, String? mapl}) =>
      DiaPhuongEntry(
        id: id ?? this.id,
        madp: madp ?? this.madp,
        tenkhac: tenkhac ?? this.tenkhac,
        mapl: mapl ?? this.mapl,
      );
  @override
  String toString() {
    return (StringBuffer('DiaPhuongEntry(')
          ..write('id: $id, ')
          ..write('madp: $madp, ')
          ..write('tenkhac: $tenkhac, ')
          ..write('mapl: $mapl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, madp, tenkhac, mapl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaPhuongEntry &&
          other.id == this.id &&
          other.madp == this.madp &&
          other.tenkhac == this.tenkhac &&
          other.mapl == this.mapl);
}

class DiaPhuongCompanion extends UpdateCompanion<DiaPhuongEntry> {
  final Value<int> id;
  final Value<String?> madp;
  final Value<String?> tenkhac;
  final Value<String?> mapl;
  const DiaPhuongCompanion({
    this.id = const Value.absent(),
    this.madp = const Value.absent(),
    this.tenkhac = const Value.absent(),
    this.mapl = const Value.absent(),
  });
  DiaPhuongCompanion.insert({
    this.id = const Value.absent(),
    this.madp = const Value.absent(),
    this.tenkhac = const Value.absent(),
    this.mapl = const Value.absent(),
  });
  static Insertable<DiaPhuongEntry> custom({
    Expression<int>? id,
    Expression<String?>? madp,
    Expression<String?>? tenkhac,
    Expression<String?>? mapl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (madp != null) 'madp': madp,
      if (tenkhac != null) 'tenkhac': tenkhac,
      if (mapl != null) 'mapl': mapl,
    });
  }

  DiaPhuongCompanion copyWith(
      {Value<int>? id,
      Value<String?>? madp,
      Value<String?>? tenkhac,
      Value<String?>? mapl}) {
    return DiaPhuongCompanion(
      id: id ?? this.id,
      madp: madp ?? this.madp,
      tenkhac: tenkhac ?? this.tenkhac,
      mapl: mapl ?? this.mapl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (madp.present) {
      map['madp'] = Variable<String?>(madp.value);
    }
    if (tenkhac.present) {
      map['tenkhac'] = Variable<String?>(tenkhac.value);
    }
    if (mapl.present) {
      map['mapl'] = Variable<String?>(mapl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaPhuongCompanion(')
          ..write('id: $id, ')
          ..write('madp: $madp, ')
          ..write('tenkhac: $tenkhac, ')
          ..write('mapl: $mapl')
          ..write(')'))
        .toString();
  }
}

class $DiaPhuongTable extends DiaPhuong
    with TableInfo<$DiaPhuongTable, DiaPhuongEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaPhuongTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _madpMeta = const VerificationMeta('madp');
  @override
  late final GeneratedColumn<String?> madp = GeneratedColumn<String?>(
      'madp', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _tenkhacMeta = const VerificationMeta('tenkhac');
  @override
  late final GeneratedColumn<String?> tenkhac = GeneratedColumn<String?>(
      'tenkhac', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _maplMeta = const VerificationMeta('mapl');
  @override
  late final GeneratedColumn<String?> mapl = GeneratedColumn<String?>(
      'mapl', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, madp, tenkhac, mapl];
  @override
  String get aliasedName => _alias ?? 'dia_phuong';
  @override
  String get actualTableName => 'dia_phuong';
  @override
  VerificationContext validateIntegrity(Insertable<DiaPhuongEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('madp')) {
      context.handle(
          _madpMeta, madp.isAcceptableOrUnknown(data['madp']!, _madpMeta));
    }
    if (data.containsKey('tenkhac')) {
      context.handle(_tenkhacMeta,
          tenkhac.isAcceptableOrUnknown(data['tenkhac']!, _tenkhacMeta));
    }
    if (data.containsKey('mapl')) {
      context.handle(
          _maplMeta, mapl.isAcceptableOrUnknown(data['mapl']!, _maplMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaPhuongEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DiaPhuongEntry.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DiaPhuongTable createAlias(String alias) {
    return $DiaPhuongTable(attachedDatabase, alias);
  }
}

abstract class _$CLDatabase extends GeneratedDatabase {
  _$CLDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BagRicesTable bagRices = $BagRicesTable(this);
  late final $TicketsTable tickets = $TicketsTable(this);
  late final $BagRicesDeleteTable bagRicesDelete = $BagRicesDeleteTable(this);
  late final $DiaPhuongTable diaPhuong = $DiaPhuongTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [bagRices, tickets, bagRicesDelete, diaPhuong];
}
