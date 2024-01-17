// ignore_for_file: implementation_imports

import 'package:base_project/src/base_project.dart';
import 'package:loctroi_canlua_external/constants/constanst.dart';
import 'package:flutter/material.dart';
import 'package:loctroi_canlua_external/generated/l10n.dart';
import 'package:loctroi_canlua_external/widgets/size_box_widget.dart'; 

class DialogAppInfo extends StatelessWidget {
  final String versionCode;
  const DialogAppInfo({Key? key, required this.versionCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding:
            const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        title: Container(
          color: UIColor.yellow_bg_header_dialog,
          child: Column(
            children: [
              Text(
                S.of(context).txt_app_infomation.toUpperCase(),
                style: UITextStyle.interBoldStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: UIColor.secondary_dark),
              ),
              SizeBoxHeightWidget(),
              SizeBoxHeightWidget(),
            ],
          ),
        ),
        backgroundColor: UIColor.yellow_bg_header_dialog,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0))),
        content: Container(
          decoration: const BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          child: Padding(
            padding: const EdgeInsets.all(paddingDefaultLeftRight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Phần mềm cân lúa V$versionCode",
                      style: UITextStyle.mulishMediumStyle()),
                ),
                SizeBoxHeightWidget(),
                SizeBoxHeightWidget(),
                Text(
                    "- Phần mềm thuộc bản quyền Công ty cổ phần Tập đoàn Lộc Trời",
                    style: UITextStyle.mulishMediumStyle()),
                SizeBoxHeightWidget(),
                SizeBoxHeightWidget(),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: S.of(context).btn_close,
                )
              ],
            ),
          ),
        ));
  }
}
