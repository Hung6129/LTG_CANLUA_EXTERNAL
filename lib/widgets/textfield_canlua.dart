// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

import 'package:loctroi_canlua_external/constants/assets.dart';

class InputCanLuaWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final String hint;
  final String label;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? unit;
  final bool? autofocus;
  final int? maxLine;
  final FocusNode? focusNode;
  final bool? isDotDecimal;
  const InputCanLuaWidget(
      {Key? key,
      required this.ctrl,
      required this.hint,
      required this.label,
      this.inputAction,
      this.inputType,
      this.focusNode,
      this.isDotDecimal,
      this.maxLine,
      this.autofocus = false,
      this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: TextFormField(
        controller: ctrl,
        autofocus: autofocus!,
        focusNode: focusNode,
        maxLines: maxLine ?? 1,
        minLines: 1,
        keyboardType: maxLine == null || maxLine == 1
            ? inputType ?? TextInputType.text
            : TextInputType.multiline,
        textInputAction: maxLine == null || maxLine == 1
            ? inputAction ?? TextInputAction.next
            : TextInputAction.newline,
        inputFormatters:
            isDotDecimal == true ? [CommaTextInputFormatter()] : null,
        style: UITextStyle.mulishMediumStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: UIColor.green_dark_text),
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          contentPadding: const EdgeInsets.only(top: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // enabledBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: UIColor.gray_80),
          // ),
          // focusedBorder: const UnderlineInputBorder(
          //   borderSide: BorderSide(color: UIColor.gray_80),
          // ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: UIColor.gray_80),
          ),
          suffix: unit == null
              ? IconButton(
                  constraints: const BoxConstraints(maxHeight: 20),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  iconSize: 20,
                  icon: IconButton(
                    onPressed: () {
                      ctrl.clear();
                    },
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset(
                      CanLuaEXTAssets.icX,
                      fit: BoxFit.cover,
                      color: UIColor.green_dark_text,
                    ),
                  ))
              : Text(
                  '$unit',
                  style: UITextStyle.mulishMediumStyle(
                      height: 1.5, fontSize: 16, color: UIColor.black),
                ),
          floatingLabelStyle: UITextStyle.mulishMediumStyle(
              fontSize: 16, color: UIColor.gray_90),
          labelStyle: UITextStyle.mulishBoldStyle(
              fontSize: 16, color: UIColor.green_dark_text),
          alignLabelWithHint: true,
          hintStyle:
              UITextStyle.sfProDisplayStyleS14W400(color: UIColor.gray_90),
        ),
      ),
    );
  }
}

class ConfigEditextPassword {
  final bool isShowPassword;
  final Function suffixIconShowPassClick;
  ConfigEditextPassword({
    required this.isShowPassword,
    required this.suffixIconShowPassClick,
  });
}

class InputCanLuaTypeUserWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final String hint;
  final String label;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? unit;
  final bool? autofocus;
  final FocusNode? focusNode;
  final ConfigEditextPassword? configPass;

  final bool? isDotDecimal;
  const InputCanLuaTypeUserWidget(
      {Key? key,
      required this.ctrl,
      required this.hint,
      required this.label,
      this.inputAction,
      this.inputType,
      this.focusNode,
      this.isDotDecimal,
      this.configPass,
      this.autofocus = false,
      this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      autofocus: autofocus!,
      focusNode: focusNode,
      keyboardType: inputType ?? TextInputType.text,
      textInputAction: inputAction ?? TextInputAction.next,
      inputFormatters:
          isDotDecimal == true ? [CommaTextInputFormatter()] : null,
      style: UITextStyle.mulishMediumStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: UIColor.dark_text),
      obscureText: configPass != null ? !configPass!.isShowPassword : false,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        // contentPadding: const EdgeInsets.only(top: 05),
        floatingLabelBehavior: FloatingLabelBehavior.always,

        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: UIColor.gray_80, width: 0.5),
        ),
        suffix: configPass != null
            ? SizedBox(
                height: 16,
                child: IconButton(
                  icon: Icon(
                    configPass!.isShowPassword == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: UIColor.gray,
                    size: 16,
                  ),
                  iconSize: 16,
                  onPressed: () {
                    configPass!.suffixIconShowPassClick();
                  },
                ),
              )
            : unit == null
                ? IconButton(
                    constraints: const BoxConstraints(maxHeight: 20),
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    iconSize: 20,
                    icon: IconButton(
                      onPressed: () {
                        ctrl.clear();
                      },
                      padding: EdgeInsets.zero,
                      icon: SvgPicture.asset(
                        CanLuaEXTAssets.icX,
                        fit: BoxFit.cover,
                        color: UIColor.green_dark_text,
                      ),
                    ))
                : Text(
                    '$unit',
                    style: UITextStyle.mulishMediumStyle(
                        height: 1.5, fontSize: 16, color: UIColor.black),
                  ),
        floatingLabelStyle: UITextStyle.mulishBoldStyle(
            fontWeight: FontWeight.w800,
            fontSize: 17,
            color: UIColor.secondary_dark),
        labelStyle: UITextStyle.mulishBoldStyle(
            fontWeight: FontWeight.w800,
            fontSize: 17,
            color: UIColor.secondary_dark),
        alignLabelWithHint: true,
        hintStyle: UITextStyle.sfProDisplayStyleS14W400(color: UIColor.gray_60),
      ),
    );
  }
}
