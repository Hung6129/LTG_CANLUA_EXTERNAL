// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';

class TextFielBorderdWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final TextInputType? inputType;
  final String hintLabel;
  final int? maxLine;
  const TextFielBorderdWidget({
    Key? key,
    required this.ctrl,
    required this.hintLabel,
    this.inputType,
    this.maxLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      keyboardType: inputType,
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
        labelText: hintLabel,
        hintText: hintLabel,
        labelStyle: UITextStyle.mulishBoldStyle(fontSize: 16),
        alignLabelWithHint: true,
        floatingLabelStyle: UITextStyle.mulishBoldStyle(
            fontSize: 20, fontWeight: FontWeight.w800, color: UIColor.primary),
        hintStyle:
            UITextStyle.sfProDisplayStyleS14W400(color: Colors.grey[700]),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
