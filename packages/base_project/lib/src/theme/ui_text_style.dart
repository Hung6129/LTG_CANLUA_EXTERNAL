import 'ui_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 

class UITextStyle {
  static TextStyle robotoBoldStyle({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.roboto(
        color: color ?? UIColor.black,
        height: height ?? 1.0,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? 14,
        decoration: textDecoration ?? TextDecoration.none,
        backgroundColor: backgroundColor,
      );

  static TextStyle robotoMediumStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.roboto(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);


  static TextStyle mulishBoldStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.mulish(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);
          
  static TextStyle mulishMediumStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.mulish(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);


  static TextStyle robotoW500S14Style({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.roboto(
        color: color ?? UIColor.black,
        height: height ?? 1.0,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? 14,
        decoration: textDecoration ?? TextDecoration.none,
        backgroundColor: backgroundColor,
      );

  static TextStyle ibmBoldStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle ibmBoldStyleSmall({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 12,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle ibmMediumStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle ibmW500S14({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle ibmMediumStyleSmall({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 12,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle heading1({
    Color color = UIColor.black,
    Color? backgroundColor,
    double? fontSize = 16,
    double? height,
    FontWeight? fontWeight = FontWeight.w400,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration? textDecoration,
    double opacity = .54,
  }) {
    return robotoBoldStyle(
      color: color.withOpacity(opacity),
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: height,
      textDecoration: textDecoration,
      backgroundColor: backgroundColor,
    );
  }

  static TextStyle heading2({
    Color color = UIColor.black,
    double? fontSize = 14,
    double? height,
    FontWeight? fontWeight = FontWeight.w400,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration? textDecoration,
    double opacity = .54,
  }) {
    return robotoBoldStyle(
      color: color.withOpacity(opacity),
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: height,
      textDecoration: textDecoration,
    );
  }

  static TextStyle content({
    Color color = UIColor.black,
    double? fontSize = 14,
    double? height,
    FontWeight? fontWeight = FontWeight.w400,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration? textDecoration,
    double opacity = .87,
  }) {
    return robotoBoldStyle(
      color: color.withOpacity(opacity),
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      height: height,
      textDecoration: textDecoration,
    );
  }

  static TextStyle barlowMediumStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.barlow(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle barlowBoldStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.barlow(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle interMediumStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.inter(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle poppinsMediumStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.poppins(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle interBoldStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.inter(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);

  static TextStyle sfProDisplayStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: '.SF Pro Display',
        color: color ?? UIColor.black,
        height: height ?? 1.0,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? 14,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        letterSpacing: letterSpacing,
      );

  static TextStyle sfProDisplayStyleS12W400({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
          fontFamily: '.SF Pro Display',
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 12,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle nunito({
    Color? color,
    double? fontSize,
    double? height,
    double? wordSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.nunito(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle sfProDisplayStyleS14W400({
    Color? color,
    double? fontSize,
    double? height,
    double? wordSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
          fontFamily: '.SF Pro Display',
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          wordSpacing: wordSpacing ?? 0,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle sfProDisplayStyleS14W600({
    Color? color,
    double? fontSize,
    double? height,
    double? wordSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
          fontFamily: '.SF Pro Display',
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 14,
          wordSpacing: wordSpacing ?? 0,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle robotoMediumSmallStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.roboto(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 12,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle sfProDisplayStyleS18W600({
    Color? color,
    double? fontSize,
    double? height,
    double? wordSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
          fontFamily: '.SF Pro Display',
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 18,
          wordSpacing: wordSpacing ?? 0,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle ibmStyleS16W400({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 16,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle ibmLinkUnderlineStyle({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
        shadows: [const Shadow(color: UIColor.primary_light, offset: Offset(0, -3))],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue,
        decorationThickness: 1,
        height: height ?? 1.3,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? 14,
      );
  static TextStyle ibmUnderlineStyle({
    Color? textColor,
    Color? underlineColor,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
        shadows: [
          Shadow(color: textColor ?? UIColor.black60, offset: const Offset(0, -3))
        ],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationColor: underlineColor ?? textColor ?? UIColor.black60,
        decorationThickness: 1,
        height: height ?? 1.3,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? 14,
      );

      

  static TextStyle ibmStyleS16W600({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.black,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 16,
          decoration: textDecoration ?? TextDecoration.none);
  static TextStyle ibmItalicW500({
    Color? color,
    double? fontSize,
    double? height,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      GoogleFonts.ibmPlexSans(
          color: color ?? UIColor.primary_light,
          height: height ?? 1.0,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontStyle: fontStyle ?? FontStyle.italic,
          fontSize: fontSize ?? 14,
          decoration: textDecoration ?? TextDecoration.none);
}
