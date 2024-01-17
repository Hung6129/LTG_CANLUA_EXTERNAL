// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';

class TextFieldDatePickerWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final String? label, hint;
  const TextFieldDatePickerWidget(
      {Key? key, required this.ctrl, this.label, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            "$label",
            style: UITextStyle.mulishBoldStyle(
                fontSize: 12.5, color: UIColor.green_dark_text),
          ),
        SizedBox(
          height: 28,
          child: TextFormField(
            controller: ctrl,
            readOnly: true,
            onTap: () {
              _selectDate(context, ctrl);
            },
            decoration: InputDecoration(
              hintText: hint,
              alignLabelWithHint: true,
              suffixIcon: const Icon(Icons.calendar_today),
              contentPadding: const EdgeInsets.only(bottom: 15),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: UIColor.gray_80),
              ),
              floatingLabelStyle: UITextStyle.mulishMediumStyle(
                  fontSize: 16, color: UIColor.gray_90),
              labelStyle: UITextStyle.mulishBoldStyle(
                  fontSize: 16, color: UIColor.green_dark_text),
              hintStyle:
                  UITextStyle.sfProDisplayStyleS14W400(color: UIColor.gray_90),
              disabledBorder: const UnderlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class DialogDatePickerWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final String? label, hint;
  const DialogDatePickerWidget(
      {Key? key, required this.ctrl, this.label, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: TextFormField(
        controller: ctrl,
        readOnly: true,
        onTap: () {
          _selectDate(context, ctrl);
        },
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
          suffix: IconButton(
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
              )),
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

class DatePickerUserTypeWidget extends StatelessWidget {
  final TextEditingController ctrl;
  final String? label, hint;
  const DatePickerUserTypeWidget(
      {Key? key, required this.ctrl, this.label, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      readOnly: true,
      onTap: () {
        _selectDate(context, ctrl);
      },
      style: UITextStyle.mulishMediumStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: UIColor.dark_text),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: UIColor.gray_80, width: 1),
        ),
        suffix: IconButton(
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
            )),
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

Future _selectDate(BuildContext context, TextEditingController ctl) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ctl.text.isNotEmpty
          ? DateTimeHelper.getDateTime(ctl.text)
          : DateTime.now(),
      firstDate: DateTime(1901, 1),
      lastDate: DateTime(2100));

  ctl.text = picked != null
      ? DateTimeHelper.getDateStrByDateTime(picked,
          format: DateFormats.YEAR_MONTH_DAY)
      : "";
}
