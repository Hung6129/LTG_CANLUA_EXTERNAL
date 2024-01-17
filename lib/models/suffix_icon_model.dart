import 'package:flutter/cupertino.dart';

class SuffixIconModel {
  IconData? icon;
  Function calback;
  Widget? svgIcon;
  SuffixIconModel({
    this.icon,
    this.svgIcon,
    required this.calback,
  });
}
