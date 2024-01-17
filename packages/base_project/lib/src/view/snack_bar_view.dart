import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

class MySnackBar {
  static showSnackBarInfo(GlobalKey key, String value) {
    SnackBar _snackSample() => SnackBar(
          duration: const Duration(milliseconds: 2000),
          content: Text(
            value,
            style: UITextStyle.mulishMediumStyle(),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.lightBlue.shade100,
        );
    // final bar = _snackSample();
    ScaffoldMessenger.of(key.currentContext!).showSnackBar(_snackSample());
  }

  static showSnackBarSuccess(GlobalKey key, String value) {
    SnackBar _snackSample() => SnackBar(
          duration: const Duration(milliseconds: 2000),
          content: Text(
            value,
            style: UITextStyle.mulishMediumStyle(color: UIColor.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: UIColor.primary,
        );
    // final bar = _snackSample();
    ScaffoldMessenger.of(key.currentContext!).showSnackBar(_snackSample());
  }

  static showSnackBarWarning(GlobalKey key, String value) {
    SnackBar _snackSample() => SnackBar(
          duration: const Duration(milliseconds: 2000),
          content: Text(
            value,
            style: UITextStyle.mulishMediumStyle(),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.yellowAccent.shade100,
        );
    ScaffoldMessenger.of(key.currentContext!).showSnackBar(_snackSample());
  }

  static showSnackBarError(GlobalKey key, String value) {
    SnackBar _snackSample() => SnackBar(
          duration: const Duration(milliseconds: 3000),
          content: Text(
            value,
            style: UITextStyle.mulishMediumStyle(),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.redAccent.shade100,
        );
    ScaffoldMessenger.of(key.currentContext!).showSnackBar(_snackSample());
  }
}
