// import 'dart:convert';

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

class FormatHelper {
  static String getMoneySymbol() {
    return '₫';
  }

  static String cryptoSHA256(String input) {
    var bytes = utf8.encode(input);
    var output = sha256.convert(bytes);
    return output.toString();
  }

  static String numberToMoney(double number) {
    final oCcy = NumberFormat("#,##0.##", "en_US");
    return oCcy.format(number);
  }

  static String numberToDoubleStr1(num? number) {
    if (number == null) return "0";
    final oCcy = NumberFormat("#,##0.#", "en_US");
    return oCcy.format(number);
  }

  static String numberToMoney3(num number) {
    final oCcy = NumberFormat("#,##0.##", "en_US");
    return oCcy.format(number);
  }

  static String numberToMoney1(double number) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    // ignore: prefer_function_declarations_over_variables
    final matchFunc = (Match match) => '${match[0]},';
    String numResult =
        number.round().toString().replaceAllMapped(reg, matchFunc);
    return numResult;
  }

  static String numberToMoney2(num? number) {
    if (number == null) return "0";
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    // ignore: prefer_function_declarations_over_variables
    final matchFunc = (Match match) => '${match[0]},';
    String numResult =
        number.round().toString().replaceAllMapped(reg, matchFunc);
    return numResult;
  }

  static String joinMap(Map map) {
    var keys = map.keys;
    return keys.map((key) => '$key: ${map[key]}').join(', ');
  }

  static int stringToInt(String str, {int defaultValue = 0}) {
    // ignore: unnecessary_null_comparison
    if (str == null) return defaultValue;
    return int.parse(str);
  }

  static String deFormat(String val) {
    final deFormat = NumberFormat.decimalPattern(
      'de',
    );
    return deFormat.format(double.parse(val));
  }

  static num enFormat(String val) {
    final deFormat = NumberFormat.decimalPattern(
      'de',
    );
    return deFormat.parse(val);
  }

  static dynamic removeNull(dynamic params) {
    if (params is Map) {
      var _map = {};
      params.forEach((key, value) {
        var _value = removeNull(value);
        if (_value != null) {
          _map[key] = _value;
        }
      });
      if (_map.isNotEmpty) return _map;
    } else if (params is List) {
      var _list = [];
      for (var val in params) {
        var _value = removeNull(val);
        if (_value != null) {
          _list.add(_value);
        }
      }
      if (_list.isNotEmpty) return _list;
    } else if (params != null) {
      return params;
    }
    return null;
  }

  static Future<String> convertFileToStringBase64(File file) async {
    // Uint8List imagebytes = await file.readAsBytes();
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    return fileInBase64;
    // return base64.encode(imagebytes);
  }
}
