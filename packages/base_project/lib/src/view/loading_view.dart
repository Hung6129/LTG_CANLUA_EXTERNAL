import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final String? title;

  const LoadingView({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(UIColor.primary),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title ?? "Đang tải...",
            style: UITextStyle.robotoMediumStyle(),
          ),
        ],
      ),
    );
  }
}
