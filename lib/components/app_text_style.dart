import 'package:bmi_calculator/contants/app_color_path.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static final TextStyle textFont18W600 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColorPath.black.withValues(alpha: 75),
  );
  static final TextStyle textFontI30W800 = TextStyle(
    fontFamily: 'Inter',
    fontSize: 30.42,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w800,
    color: AppColorPath.white,
  );
  static final TextStyle textFont15W400 = TextStyle(
    fontFamily: 'Inter-regular',
    fontSize: 15.33,
    fontWeight: FontWeight.w400,
    color: AppColorPath.lavenderLight,
  );
  static final TextStyle textFont17W400 = TextStyle(
    fontFamily: 'Inter-regular',
    fontSize: 17.6,
    fontWeight: FontWeight.w400,
    color: AppColorPath.darkBlue,
  );
  static final TextStyle textFont13W400 = TextStyle(
    fontFamily: 'Inter-regular',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColorPath.darkBlue,
  );

  static final TextStyle textFontI25W700 = TextStyle(
    fontFamily: 'Inter-Bold',
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: AppColorPath.white,
  );
  static final TextStyle textFontB537W700 = TextStyle(
    fontFamily: 'Inter-Bold',
    fontSize: 57.39,
    fontWeight: FontWeight.w700,
    color: AppColorPath.lavender,
  );
  static final TextStyle textFontM17W500 = TextStyle(
    fontFamily: 'Inter-Medium',
    fontSize: 17.6,
    fontWeight: FontWeight.w500,
    color: AppColorPath.darkBlue,
  );
}
