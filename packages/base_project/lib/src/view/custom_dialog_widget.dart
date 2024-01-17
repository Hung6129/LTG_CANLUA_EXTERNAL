// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({
    Key? key,
    required this.child,
    required this.action,
    this.isFullWidth = false,
    this.padding,
  }) : super(key: key);
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Widget action;
  final bool? isFullWidth;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      insetPadding: isFullWidth == true
          ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0)
          : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [child, action],
        ),
      ),
    );
  }
}
