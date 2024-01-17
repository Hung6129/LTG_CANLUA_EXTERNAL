// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'dart:math';

class CheckDataHelper {
  // String convertToTnternationalPhoneNumber(String localPhone) {
  //   String resull = '';
  //   if (localPhone[0] == '0') {

  //   }
  // }

  static bool checkIsUrl(String url) {
    return Uri.parse(url).isAbsolute;
  }

  static Future<FileSizeModel?> getFileSize(
      String filepath, int decimals) async {
    FileSizeModel _fileSizeModel = FileSizeModel();

    var _file = File(filepath);

    int _bytes = await _file.length();

    if (_bytes <= 0) return _fileSizeModel;

    double _sizeInKB = double.parse((_bytes / 1024).toStringAsFixed(decimals));

    double _sizeInMB =
        double.parse((_sizeInKB / 1024).toStringAsFixed(decimals));

    double _sizeInGB =
        double.parse((_sizeInMB / 1024).toStringAsFixed(decimals));

    double _sizeInTB =
        double.parse((_sizeInGB / 1024).toStringAsFixed(decimals));

    const _suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];

    var i = (log(_bytes) / log(1024)).floor();

    String _fileSize =
        '${(_bytes / pow(1024, i)).toStringAsFixed(decimals)} ${_suffixes[i]}';

    _fileSizeModel.b = _bytes;
    _fileSizeModel.kb = _sizeInKB;
    _fileSizeModel.mb = _sizeInMB;
    _fileSizeModel.gb = _sizeInGB;
    _fileSizeModel.tb = _sizeInTB;
    _fileSizeModel.fileSize = _fileSize;
    return _fileSizeModel;
  }
}

class FileSizeModel {
  FileSizeModel({
    this.b,
    this.kb,
    this.mb,
    this.gb,
    this.tb,
    this.fileSize,
  });
  int? b;
  double? kb;
  double? mb;
  double? gb;
  double? tb;
  String? fileSize;
}
