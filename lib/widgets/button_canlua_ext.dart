import 'package:base_project/export.dart';
import 'package:flutter/material.dart';

class PrimaryBtnCLExt extends StatelessWidget {
  final double? height, width;
  final String label;
  final bool? enebale;
  final void Function() onClick;
  const PrimaryBtnCLExt(
      {Key? key,
      this.height,
      this.width,
      this.enebale = true,
      required this.label,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 42,
      width: width ?? MediaQuery.of(context).size.width / 2,
      child: PrimaryButton(
        onPressed: onClick, enabled: enebale == true,
        borderRadius: 38,
        // title: label,
        widget: Text(
          label,
          style: UITextStyle.mulishBoldStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: UIColor.white),
        ),
      ),
    );
  }
}
