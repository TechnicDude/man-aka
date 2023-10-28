import 'package:flutter/material.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppStyle {
  static final onbaordtitle = TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
  );
  static final onbaordtitlesubtitle = TextStyle(
    color: Colors.white,
    fontSize: 17.sp,
    fontWeight: FontWeight.w800,
  );

  static final texttitle = TextStyle(
    color: Colors.white,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
  );
  static final texttitlemain = TextStyle(
    color: Colors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
  );

  static final textsubtitlemain = TextStyle(
    color: Colors.black,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );

  static final mytexttitle = TextStyle(
    color: Colors.black,
    fontSize: 17.sp,
    fontWeight: FontWeight.w700,
  );
  static final textsubtitle = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final textdrawertitle = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final textcatsubtitle = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );

  static final textsubsubtitle = TextStyle(
      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400);

  // Card
  static final cardsubtitle = TextStyle(
      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final cardssubtitle =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);
  static final cardpricesubtitle = TextStyle(
      color: AppColors.primarycolor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600);
  static final textdescription = TextStyle(
      color: AppColors.black, fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final cardtitle = TextStyle(
      color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w600);
}
