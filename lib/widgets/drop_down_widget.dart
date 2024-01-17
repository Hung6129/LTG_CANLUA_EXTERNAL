// ignore_for_file: implementation_imports, must_be_immutable

import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/constants/assets.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/models/key_value_model.dart';

class DropDownWidget extends StatelessWidget {
  final List<KeyValueModel> lstData;
  final KeyValueModel? selectedValue;
  final Function(KeyValueModel?) onChange;
  final String? label;
  final Function onClean;
  const DropDownWidget(
      {Key? key,
      required this.lstData,
      required this.onChange,
      required this.onClean,
      this.label,
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
            style: UITextStyle.mulishMediumStyle(fontSize: 16),
          ),
        SizedBox(
          width:
              MediaQuery.of(context).size.width - paddingDefaultLeftRight * 2,
          child: DropdownButton<KeyValueModel>(
            value: selectedValue,
            isExpanded: true,
            hint: Text(
              '-Select-',
              style: UITextStyle.mulishMediumStyle(
                  fontSize: 18, color: UIColor.gray),
            ),
            dropdownColor: Colors.white,
            icon: Row(
              children: [
                SvgPicture.asset(
                  CanLuaEXTAssets.icDropDown,
                  color: UIColor.green_dark_text,
                ),
                IconButton(
                  onPressed: () {
                    onClean();
                  },
                  icon: SvgPicture.asset(
                    CanLuaEXTAssets.icX,
                    color: UIColor.green_dark_text,
                  ),
                )
              ],
            ),

            iconSize: 20.0,
            style: const TextStyle(
              fontSize: 22.0,
              color: Colors.black,
            ),
            // value: "A",
            onChanged: onChange,
            items: lstData.map<DropdownMenuItem<KeyValueModel>>((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(
                  valueItem.vaule,
                  style: UITextStyle.mulishMediumStyle(fontSize: 18),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
