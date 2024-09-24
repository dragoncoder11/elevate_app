import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle setTextStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle textGrey(double fontSize, FontWeight fontWeight) {
    return setTextStyle(
      color: AppColors.mainGrey,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle textBlack(double fontSize, FontWeight fontWeight) {
    return setTextStyle(
      color: AppColors.mainBlack,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle textLightBlue(double fontSize, FontWeight fontWeight) {
    return setTextStyle(
      color: AppColors.lightBlue,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

}
