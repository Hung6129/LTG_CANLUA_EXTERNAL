// ignore_for_file: must_be_immutable, implementation_imports

import 'package:flutter/material.dart';

import 'package:base_project/src/base_project.dart';

class SizeBoxHeightWidget extends StatelessWidget {
  double? height;
  SizeBoxHeightWidget({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height ?? kdefaultPadding);
  }
}

class SizeBoxWidthWidget extends StatelessWidget {
  double? width;
  SizeBoxWidthWidget({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width ?? kdefaultPadding);
  }
}
