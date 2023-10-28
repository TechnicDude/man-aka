import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BodyIconsBarScreenActivity extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Function onPressed;
  const BodyIconsBarScreenActivity({
    super.key,
    required this.icon,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1.h)),
        // color: AppColors.primarycolor,
      ),
      child: Icon(
        icon,
        color: color ?? AppColors.iconColor,
      ),
    ).ripple(onPressed, borderRadius: BorderRadius.all(Radius.circular(13)));
  }
}
