import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waspha/core/assets_gen/fonts.gen.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/core/const/dimension/dimensions.dart';

class CustomTextTheme {
  static TextTheme textTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: ScreenUtil().setSp(40),
        fontWeight: AppDimensions.bold,
        fontFamily: MyFontFamily.openSans,
      ),
      titleMedium: TextStyle(
        fontSize: ScreenUtil().setSp(20),
        fontWeight: AppDimensions.bold,
        fontFamily: MyFontFamily.openSans,
      ),
      titleSmall: TextStyle(
        fontSize: ScreenUtil().setSp(17),
        fontWeight: AppDimensions.medium,
        fontFamily: MyFontFamily.openSans,
        color: WasphaColors.black,
      ),
      displayLarge: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          fontWeight: AppDimensions.medium,
          fontFamily: MyFontFamily.openSans,
          color: WasphaColors.black),
      // displayMedium: TextStyle(
      //   fontSize: ScreenUtil().setSp(26),
      //   fontWeight: normal,
      //   fontFamily: MyFontFamily.openSans,
      // ),
      displaySmall: TextStyle(
          fontSize: ScreenUtil().setSp(17),
          fontWeight: AppDimensions.regular,
          fontFamily: MyFontFamily.openSans,
          color: WasphaColors.white),
      // labelSmall: TextStyle(
      //   fontSize: ScreenUtil().setSp(16),
      //   fontWeight: regular,
      //   fontFamily: MyFontFamily.openSans,
      //
      // ),
      // headlineMedium: TextStyle(
      //   fontSize: ScreenUtil().setSp(20),
      //   fontWeight: normalBold,
      //   fontFamily: MyFontFamily.openSans,
      // ),
      // headlineSmall: TextStyle(
      //   fontSize: ScreenUtil().setSp(18),
      //   fontWeight: medium,
      //   fontFamily: MyFontFamily.openSans,
      // ),
      // headlineLarge: TextStyle(
      //   fontSize: ScreenUtil().setSp(24),
      //   fontWeight: medium,
      //   fontFamily: MyFontFamily.openSans,
      // ),
    );
  }
}
