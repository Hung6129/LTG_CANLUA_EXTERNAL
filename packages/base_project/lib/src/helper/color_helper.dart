import 'package:flutter/material.dart';

class ColorHelper{
  static Color? hexColor(String value) {
    return Color(int.parse('0xff$value'));
  }
}
