import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

class LoadingDialogView {
  static final LoadingDialogView instance = LoadingDialogView();
  BuildContext? _context;

  void show(BuildContext context) {
    dismiss();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext localContext) {
        _context = localContext;
        return Stack(
          children: [
            SizedBox.expand(
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            const Center(
              child: LoadingView(),
            ),
          ],
        );
      },
    );
  }

  dismiss() {
    try {
      if (_context != null) {
        Navigator.of(_context!).pop();
        _context = null;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
