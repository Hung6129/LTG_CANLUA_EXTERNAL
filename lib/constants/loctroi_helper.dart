// ignore_for_file: implementation_imports
import 'package:base_project/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loctroi_canlua_external/models/bag_rice_entity.dart';

class LocTroiHelper {
  static bool is3CungFromChotGia = false;
  static bool is3CungFromChotGiaThongKe = false;
  static UserType userLoginType = UserType.ERR;
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  static double convertDoubleFormListIn(List<int> charCode) {
    String rawData = String.fromCharCodes(charCode);
    if (isNumeric(rawData.substring(1, rawData.length))) {
      rawData = double.parse(rawData.substring(1, rawData.length)).toString();
      rawData = rawData.split("").reversed.join("");
      double weight = double.parse(rawData).toPrecision(2);
      return weight;
    }
    return 0;
  }

  static Future<bool> willPopScopeCall(BuildContext context) async {
// code to show toast or modal
    Navigator.of(context, rootNavigator: true).pop();
    return false; // return true to exit app or return false to cancel exit
  }

  String getNameBagRice(List<BagRiceEntity>? lst) {
// .toString().padLeft(3, '0')
    // String result = '';
    // result = lst.length.toString().padLeft(3, '0');
    int stt = 0;
    if (lst != null && lst.isNotEmpty) {
      stt = int.tryParse(lst.last.name ?? "") ?? 999;
    }
    return (stt + 1).toString().padLeft(3, '0');
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

String converLocalPhone(String localPhone, String internalPhone) {
  if (internalPhone.contains('+84') && localPhone[0] != '0') {
    localPhone = '0$localPhone';
  }
  return localPhone;
}

String converInternalPhone(String localPhone, String internalPhone) {
  if (internalPhone.contains('+84') && localPhone[0] == '0') {
    internalPhone = internalPhone.replaceFirst("0", "");
  }
  return internalPhone;
}

class StringValueModel {
  int value;
  String content;
  StringValueModel({
    required this.value,
    required this.content,
  });
}
