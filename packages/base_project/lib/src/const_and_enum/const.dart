// ignore_for_file: constant_identifier_names

import 'package:base_project/export.dart';

const String SALT = "loctroi@(*&^%#@!)";
const String TOKEN_LOGIN = "TOKEN_LOGIN";
const String APPID = "APPID";
const String USERNAME = "USERNAME";
const String FULLNAME = "FULLNAME";
const String EMAIL = "EMAIL";
const String PASS = "PASS";
const String USER_TYPE = "USER_TYPE";
const String tokenExpiredErr = "{message: Bạn chưa được cấp quyền truy cập}",
    networkErr = "Network is unreachable";
const String emailSupport = "nha.t.nguyen2@loctroi.vn";

// const platform = MethodChannel('com.vnpt.bioid/sdk');
const String permissionView = '-1111',
    permissionInsert = '-2222',
    permissionDel = '-3333',
    permissionEdit = '-4444',
    permissionReport = '-5555',
    permissionXuatFile = '-6666',
    permissionUploadFile = '-7777',
    permissionDownloadFile = '-8888';

UserType getUserType(int type) {
  switch (type) {
    case 1:
      return UserType.LTG;
    case 2:
      return UserType.GHE;
    case 3:
      return UserType.USER_NGOAI;
    case 99:
      return UserType.OTHER_APP;
    default:
      return UserType.ERR;
  }
}
