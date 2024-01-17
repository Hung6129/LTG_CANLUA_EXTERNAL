import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';

Widget defaultLoadingWidget = const SizedBox(
  width: 30,
  height: 30,
  child: LoadingView(),
);

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key,
      this.title = '',
      this.child,
      required this.onPressed,
      this.enabled = true,
      this.borderColor = UIColor.primary,
      this.textColor = UIColor.primary,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 14,
      this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      this.backgroundColor = Colors.white,
      this.height = 40,
      this.borderRadius})
      : super(key: key);
  final String title;
  final Widget? child;
  final bool enabled;
  final void Function() onPressed;
  final Color borderColor;
  final Color textColor;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final double height;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
          primary: UIColor.white,
          backgroundColor: backgroundColor,
          padding: padding,
          side: BorderSide(color: enabled ? borderColor : UIColor.seperated),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
          fixedSize: Size.fromHeight(height)),
      child: child ??
          Text(
            title,
            style: UITextStyle.robotoBoldStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: UIColor.primary),
          ),
    );
  }
}

class GradientButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const GradientButton({
    this.height = 46,
    required this.title,
    this.borderRadius = 4,
    required this.onPressed,
    this.fontSize = 15,
    this.enabled = true,
    this.loading = false,
  });

  final double fontSize;
  final double height;
  final String title;
  final double borderRadius;
  final bool enabled;
  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (enabled) ? onPressed : null,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: enabled ? null : UIColor.gray_85,
          gradient: enabled
              ? const LinearGradient(
                  end: Alignment(-1.0, -1.0),
                  begin: Alignment(1.0, 2.0),
                  colors: [
                    UIColor.primary,
                    UIColor.primary_light,
                  ],
                )
              : null,
        ),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3.5,
                    ),
                  )
                ],
              )
            : Center(
                child: Text(
                  title,
                  style: UITextStyle.robotoBoldStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: UIColor.white),
                ),
              ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.title,
    this.widget,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    this.buttonColor = UIColor.secondary_dark,
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = 5,
    this.fixedHeight,
    this.maxLines,
    this.isBold,
  }) : super(key: key);

  const PrimaryButton.red(
      {Key? key,
      this.title,
      this.widget,
      this.enabled = true,
      this.isLoading = false,
      required this.onPressed,
      this.buttonColor = UIColor.primary,
      this.textColor = Colors.white,
      this.padding = const EdgeInsets.all(12),
      this.borderRadius = 5,
      this.maxLines,
      this.fixedHeight,
      this.isBold})
      : super(key: key);

  final String? title;
  final Widget? widget;
  final bool enabled;
  final void Function() onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final bool isLoading;
  final double? fixedHeight;
  final double borderRadius;
  final int? maxLines;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return _RenderButton(
      title: title,
      widget: widget,
      onPressed: onPressed,
      enabled: enabled,
      maxLines: maxLines,
      buttonColor: buttonColor,
      textColor: textColor,
      padding: padding,
      isLoading: isLoading,
      borderRadius: borderRadius,
      fixedHeight: fixedHeight ?? 40,
      isBold: isBold ?? false,
    );
  }
}

class _RenderButton extends StatelessWidget {
  _RenderButton(
      {Key? key,
      this.title,
      this.widget,
      required this.onPressed,
      this.enabled = true,
      this.buttonColor,
      this.textColor,
      this.padding = const EdgeInsets.all(12),
      this.isLoading = false,
      this.fixedHeight,
      this.borderRadius = 5,
      this.maxLines,
      this.isBold = false})
      : super(key: key);
  final String? title;
  final Widget? widget;
  final bool enabled;
  final void Function() onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  final bool isLoading;
  final double? fixedHeight;
  final double borderRadius;
  final int? maxLines;
  final bool isBold;

  late final Widget button = MaterialButton(
    onPressed: (enabled && !isLoading) ? onPressed : null,
    padding: fixedHeight != null ? const EdgeInsets.all(0) : padding,
    color: buttonColor ?? UIColor.primary_light,
    disabledColor: UIColor.gray_85,
    splashColor: enabled ? null : Colors.transparent,
    highlightColor: enabled ? null : Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius)),
    child: isLoading
        ? defaultLoadingWidget
        : widget ??
            Text(
              title ?? "",
              maxLines: maxLines,
              textAlign: TextAlign.center,
              style: (isBold
                  ? UITextStyle.robotoBoldStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: UIColor.white)
                  : UITextStyle.robotoBoldStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: UIColor.white,
                    )),
            ),
  );

  @override
  Widget build(BuildContext context) {
    if (fixedHeight == null) {
      return button;
    }
    return SizedBox(height: fixedHeight, child: button);
  }
}

class CircleGradientButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CircleGradientButton(
      {this.onTapCallBack,
      this.width,
      this.height,
      this.child,
      this.disable = false});
  final VoidCallback? onTapCallBack;
  final double? width;
  final double? height;
  final Widget? child;
  final bool disable;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disable ? () {} : onTapCallBack,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            end: const Alignment(1.0, -1.0),
            begin: const Alignment(-0.5, 1.0),
            colors: [
              disable ? UIColor.neutral_gray_10 : UIColor.primary,
              disable ? UIColor.neutral_gray_10 : UIColor.blue_magenta,
            ],
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.width,
    this.height = 40.0,
    this.flex = 0,
    this.textStyle,
    this.color,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final double? width;
  final double? height;
  final int flex;
  final TextStyle? textStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color ?? UIColor.white,
              border: Border.all(
                color: const Color(0xFFE7E7E8),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Center(
              child: Text(label,
                  style: textStyle ??
                      UITextStyle.sfProDisplayStyle(
                          fontSize: 14, fontWeight: FontWeight.w400)),
            ),
          ),
        ),
      ),
    );
  }
}
