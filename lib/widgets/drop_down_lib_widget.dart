// ignore_for_file: implementation_imports, must_be_immutable, deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';

class DropDownLibWidget<T> extends StatelessWidget {
  final List<T> lstData;
  final T? selectedValue;
  final Function(T?) onChange;
  final String? label;
  final double? height, width;
  final TextStyle? labelStyle;
  final String Function(T?)? itemAsString;
  final Future<List<T>> Function(String?)? onFind;
  const DropDownLibWidget(
      {Key? key,
      required this.lstData,
      required this.onChange,
      this.label,
      this.labelStyle,
      this.height,
      this.width,
      required this.itemAsString,
      required this.onFind,
      this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Stack(
        // direction: Axis.vertical,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              "$label",
              style: labelStyle ??
                  UITextStyle.mulishBoldStyle(
                      fontSize: 12.5, color: UIColor.green_dark_text),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: SizedBox(
                width: width ??
                    MediaQuery.of(context).size.width -
                        paddingDefaultLeftRight * 1.8,
                height: height ?? 45,
                child: DropdownSearch<T>(
                  // mode: Mode.BOTTOM_SHEET,
                  // showClearButton: true,
                  // showAsSuffixIcons: true,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: label,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: UIColor.gray_80),
                      ),
                      floatingLabelStyle: UITextStyle.mulishMediumStyle(
                          fontSize: 16, color: UIColor.gray_90),
                      labelStyle: UITextStyle.mulishBoldStyle(
                          fontSize: 16, color: UIColor.green_dark_text),
                      alignLabelWithHint: true,
                      hintStyle: UITextStyle.sfProDisplayStyleS14W400(
                          color: UIColor.gray_90),
                    ),
                  ),
                  clearButtonProps: ClearButtonProps(
                      isVisible: true,
                      iconSize: 16,
                      icon: SvgPicture.asset(
                        CanLuaEXTAssets.icX,
                        color: UIColor.green_dark_text,
                      )),

                  // hint: S.of(context).txt_hint_search,
                  dropdownButtonProps: DropdownButtonProps(
                      icon: SvgPicture.asset(
                    CanLuaEXTAssets.icDropDown,
                    color: UIColor.green_dark_text,
                  )),
                  itemAsString: itemAsString,
                  items: lstData,
                  selectedItem: selectedValue,
                  // onFind: onFind,
                  onChanged: onChange,
                  popupProps: const PopupProps.menu(
                    isFilterOnline: true,
                    showSelectedItems: false,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class DropDownLibUserTypeWidget<T> extends StatelessWidget {
  final List<T> lstData;
  final T? selectedValue;
  final Function(T?) onChange;
  final String? label;
  final double? height, width;
  final TextStyle? labelStyle;
  final String Function(T?)? itemAsString;
  final Future<List<T>> Function(String?)? onFind;
  const DropDownLibUserTypeWidget(
      {Key? key,
      required this.lstData,
      required this.onChange,
      this.label,
      this.labelStyle,
      this.height,
      this.width,
      required this.itemAsString,
      required this.onFind,
      this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        if (label != null)
          Text(
            "$label",
            style: labelStyle ??
                UITextStyle.mulishBoldStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 12.5,
                    color: UIColor.secondary_dark),
          ),
        SizedBox(
          width: width ??
              MediaQuery.of(context).size.width - paddingDefaultLeftRight * 1.9,
          height: height ?? 45,
          child: DropdownSearch<T>(
            // mode: Mode.BOTTOM_SHEET,
            // showClearButton: true,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: label,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: UIColor.gray_80, width: 1),
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
                hintStyle: UITextStyle.sfProDisplayStyleS14W400(
                    color: UIColor.gray_60),
              ),
            ),
            // clearButtonProps: IconButtonProps(
            //     alignment: Alignment.centerRight,
            //     icon: SvgPicture.asset(
            //       CanLuaEXTAssets.icX,
            //       color: UIColor.green_dark_text,
            //     )),
            clearButtonProps: ClearButtonProps(
              isVisible: true,
              icon: SvgPicture.asset(
                CanLuaEXTAssets.icX,
                color: UIColor.green_dark_text,
                height: 20,
              ),
            ),
            dropdownButtonProps: DropdownButtonProps(
                icon: SvgPicture.asset(
              CanLuaEXTAssets.icDropDown,
              color: UIColor.green_dark_text,
              height: 20,
            )),
            // dropdownButtonProps: IconButtonProps(
            //     alignment: Alignment.centerRight,
            //     icon: SvgPicture.asset(
            //       CanLuaEXTAssets.icDropDown,
            //       color: UIColor.green_dark_text,
            //       height: 20,
            //     )),
            itemAsString: itemAsString,
            items: lstData,
            // showSearchBox: true,
            selectedItem: selectedValue,
            // onFind: onFind,
            onChanged: onChange,
          ),
        ),
      ],
    );
  }
}
