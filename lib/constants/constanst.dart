// ignore: implementation_imports
import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

const double paddingDefaultLeftRight = 15,
    paddingDefaultTop = 28,
    borderDefault = 10;
const paddingDefaultScreen = EdgeInsets.fromLTRB(
    paddingDefaultLeftRight, paddingDefaultTop, paddingDefaultLeftRight, 0);

const String tokenExpiredErrApp = "{message: Bạn chưa được cấp quyền truy cập}";

const int tabSetting = 0, tabScale = 1, tabReport = 2;
const timeBluetoothScan = 3000;

const serviceScaleID = "ffe0", characteristicsServiceScaleID = "ffe1";

const String homeRoute = "homeRoute",
    loginRoute = "loginRoute",
    myCanLuaAppRoute = "myCanLuaAppRoute",
    splashRoute = "splashRoute";

const String argMaXa = "argMaXa",
    argMaHtxTht = "argMaHtxTht",
    argMaDuAn = 'argMaDuAn',
    argMaND = 'argMaND',
    argSoPhieu = 'argSoPhieu',
    argLstMakeDeal = "argLstMakeDeal",
    argLstGhe = "argLstGhe",
    argIDEN = "argIDEN",
    argThuMua = "argThuMua",
    argLevelPheDuyet = "argLevelPheDuyet",
    argMakeDeal = "argMakeDeal";
String tuCan = "Tự cân", ltCan = "Dữ liệu từ Lộc Trời";
const String prefLstDevicesConnected = "prefLstDevicesConnected";

enum SplashScreenRedirect { noThing, login, home }

List<PermissionLoctroiModel> permissonsLocTroi = [];
List<BDiaPhuongEntity> dsTinh = [];
List<BDiaPhuongEntity> dsDiaPhuong = [];

final List<int> colors = [
  0XFFFFF1DC,
  0XFFE0F2FF,
  0XFFEAFFED,
  0XFFFFF5F5,
  0XFFFDDFDF,
  0XFFF3E9FF,
  0XFFFFF1DC,
  0xFFE0F2FF,
  0XFFEAFFED,
  0xFFFFF5F5,
  0XFFFDDFDF,
  0XFFF3E9FF,
];

// ignore: constant_identifier_names
enum DeviceBtType { LE, CLASSIC, DUAL, UNKNOWN }

enum BlueConnectStatus { failed, success, nothing }
