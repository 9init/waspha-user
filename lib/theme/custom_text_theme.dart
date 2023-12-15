import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waspha/core/assets_gen/fonts.gen.dart';

class CustomTextTheme {
  static TextTheme textTheme() {
    const FontWeight medium = FontWeight.w600;
    const FontWeight regular = FontWeight.w400;
    const FontWeight normal = FontWeight.w500;
    const FontWeight normalBold = FontWeight.w700;
    const FontWeight bold = FontWeight.w800;
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: ScreenUtil().setSp(26),
        fontWeight: medium,
        fontFamily: MyFontFamily.openSans,
      ),
      titleMedium: TextStyle(
        fontSize: ScreenUtil().setSp(14),
        fontWeight: normal,
        fontFamily: MyFontFamily.openSans,
      ),
      titleSmall: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        fontWeight: regular,
        fontFamily: MyFontFamily.openSans,
      ),
      displayLarge: TextStyle(
        fontSize: ScreenUtil().setSp(30),
        fontWeight: bold,
        fontFamily: MyFontFamily.openSans,
      ),
      displayMedium: TextStyle(
        fontSize: ScreenUtil().setSp(26),
        fontWeight: normal,
        fontFamily: MyFontFamily.openSans,
      ),
      displaySmall: TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: normal,
        fontFamily: MyFontFamily.openSans,
      ),
      labelSmall: TextStyle(
        fontSize: ScreenUtil().setSp(16),
        fontWeight: regular,
        fontFamily: MyFontFamily.openSans,

      ),
      headlineMedium: TextStyle(
        fontSize: ScreenUtil().setSp(20),
        fontWeight: normalBold,
        fontFamily: MyFontFamily.openSans,
      ),
      headlineSmall: TextStyle(
        fontSize: ScreenUtil().setSp(18),
        fontWeight: medium,
        fontFamily: MyFontFamily.openSans,
      ),
      headlineLarge: TextStyle(
        fontSize: ScreenUtil().setSp(24),
        fontWeight: medium,
        fontFamily: MyFontFamily.openSans,
      ),
    );
  }
}
