// ignore_for_file: implementation_imports
import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loctroi_canlua_external/models/suffix_icon_model.dart';
import 'package:loctroi_canlua_external/run_config.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isShowBack;
  final List<SuffixIconModel>? lstSuff;
  final Future<bool> Function()? backFunc;
  const AppBarWidget(
      {Key? key,
      required this.title,
      this.lstSuff,
      this.isShowBack,
      this.backFunc})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: UIColor.primary,
    ));
    return AppBar(
      backgroundColor: UIColor.primary,
      leading: isShowBack == true
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () async {
                // Navigator.of(context).pop();
                if (backFunc != null) await backFunc!();
              })
          : null,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0))),
      elevation: 0,
      centerTitle: true,
      title: Text(
        RunConfig.isDev ? 'DEV: ${title.toUpperCase()}' : title.toUpperCase(),
        style: UITextStyle.interBoldStyle(
            fontSize: 20, color: UIColor.white, fontWeight: FontWeight.w700),
      ),
      actions: _rendenSuffixAction(),
    );
    // return AppBar(
    //   title: Text(
    //     title,
    //     style: UITextStyle.interBoldStyle(fontSize: 20, color: UIColor.white),
    //   ),
    // );
  }

  _rendenSuffixAction() {
    List<Widget> result = [];
    if (lstSuff != null) {
      for (var item in lstSuff!) {
        result.add(IconButton(
          icon: item.icon != null
              ? Icon(
                  item.icon,
                  color: Colors.white,
                  size: 24,
                )
              : item.svgIcon!,
          onPressed: () {
            item.calback();
          },
        ));
      }
    }
    return result;
  }
}
