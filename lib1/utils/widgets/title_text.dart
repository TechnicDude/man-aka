import 'package:flutter/material.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.color = AppColors.titleTextColor,
      this.fontWeight = FontWeight.w800})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.textsubtitle.copyWith(
        color: AppColors.colorBlack,
        fontSize: 16.sp,
      ),
    );
  }
}
