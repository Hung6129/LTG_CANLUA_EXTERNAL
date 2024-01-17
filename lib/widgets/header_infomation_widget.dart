// ignore_for_file: implementation_imports 
import 'package:flutter/material.dart';
import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart';

class HeaderInfomationWidget extends StatelessWidget {
  final int flex, color;
  final String lable, value;
  const HeaderInfomationWidget(
      {Key? key,
      required this.color,
      required this.flex,
      required this.lable,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(kdefaultPadding),
        decoration: BoxDecoration(
            color: Color(color),
            borderRadius:
                const BorderRadius.all(Radius.circular(borderDefault)),
            border: Border.all(color: Color(colors[0]))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            lable,
            style: UITextStyle.mulishMediumStyle(
                color: UIColor.gray_80, fontSize: 12),
          ),
          SizeBoxHeightWidget(),
          Text(value,
              style: UITextStyle.mulishMediumStyle(color: UIColor.dark_text))
        ]),
      ),
    );
  }
}
