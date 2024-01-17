
import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart'; 

class NoDataView extends StatelessWidget {
  const NoDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Text(
        "Không có dữ liệu",
        style: UITextStyle.robotoMediumStyle(),
      ),
    );
  }
}
