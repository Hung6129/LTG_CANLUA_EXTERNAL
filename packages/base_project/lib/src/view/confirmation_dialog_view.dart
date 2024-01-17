// ignore_for_file: use_key_in_widget_constructors

import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key? key,
    required this.content,
    required this.onConfirm,
    this.onCancel,
    this.title,
    this.isFullWidth = false,
    this.padding,
    this.positiveLabel = 'Xác Nhận',
    this.negativeLabel = 'Hủy Bỏ',
  }) : super(key: key);
  final EdgeInsetsGeometry? padding;
  final String content;
  final String? title;
  final String positiveLabel;
  final String negativeLabel;
  final bool? isFullWidth;
  final Function() onConfirm;
  final Function()? onCancel;

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
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: UITextStyle.mulishMediumStyle(
                      fontSize: 20,
                      color: UIColor.dark_text,
                      fontWeight: FontWeight.w700),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                content,
                textAlign: TextAlign.center,
                style: UITextStyle.mulishMediumStyle(fontSize: 16),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SecondaryButton(
                    padding: padding ??
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    onPressed: onCancel ?? () => {Navigator.of(context).pop()},
                    borderRadius: BorderRadius.circular(5),
                    height: 40,
                    child: Text(
                      negativeLabel,
                      style: UITextStyle.sfProDisplayStyleS14W600(
                          color: UIColor.primary, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                    fixedHeight: 40,
                    padding: padding ??
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    onPressed: onConfirm,
                    widget: Text(
                      positiveLabel,
                      style: UITextStyle.sfProDisplayStyleS14W600(
                          color: UIColor.white, fontSize: 16),
                    ),
                    // title: positiveLabel,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
