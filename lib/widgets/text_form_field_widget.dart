// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPading;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextStyle? hintStyle;
  final bool? isHideLable;
  final String hintLabel;
  final Function(String)? onKeyBoardSubmit;

  const TextFormFieldWidget(
      {Key? key,
      required this.ctrl,
      required this.hintLabel,
      this.padding,
      this.isHideLable,
      this.hintStyle,
      this.suffixIcon,
      this.contentPading,
      this.onKeyBoardSubmit,
      this.inputType,
      this.inputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: TextFormField(
        controller: ctrl,
        // onChanged: (v) {
        //   ctrl.text = v;
        //   if (onChange != null) {
        //     onChange!(v);
        //   }
        // },
        onSaved: (v) {
          // print(v);
        },
        onEditingComplete: () {
          if (onKeyBoardSubmit != null) {
            onKeyBoardSubmit!(ctrl.text);
          }
        },
        keyboardType: inputType ?? TextInputType.text,
        textInputAction: inputAction ?? TextInputAction.next,
        style: UITextStyle.mulishMediumStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: UIColor.gray_90),
        decoration: InputDecoration(
          hintText: hintLabel,
          suffixIcon: suffixIcon,
          labelText: isHideLable == true ? null : hintLabel,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: UIColor.gray_80),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: UIColor.gray_80),
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: UIColor.gray_80),
          ),
          contentPadding: contentPading ??
              const EdgeInsets.only(top: 3, left: 0, right: 10),
          floatingLabelStyle: UITextStyle.mulishBoldStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: UIColor.primary),
          labelStyle: UITextStyle.mulishBoldStyle(
              fontSize: 16, color: UIColor.secondary_dark),
          alignLabelWithHint: true,
          hintStyle: hintStyle ??
              UITextStyle.sfProDisplayStyleS14W400(
                  color: UIColor.secondary_dark),
        ),
      ),
    );
  }
}
