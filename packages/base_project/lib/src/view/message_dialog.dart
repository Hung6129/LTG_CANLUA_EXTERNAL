import 'package:base_project/src/base_project.dart';
import 'package:flutter/cupertino.dart'; 
// import 'package:flutter/material.dart';

Future<void> messageDialog(BuildContext context, String message,
    {VoidCallback? callback}) async {
  return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Text(
            message,
            style: UITextStyle.robotoBoldStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: UIColor.black,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                'Đóng',
                style: UITextStyle.robotoBoldStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: UIColor.primary),
              ),
              onPressed: () {
                Navigator.pop(context);
                if (callback != null) {
                  callback();
                }
              },
            ),
          ],
        );
      });
}
