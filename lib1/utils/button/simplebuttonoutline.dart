import 'package:flutter/material.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SimpleButtonOutline extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const SimpleButtonOutline({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<SimpleButtonOutline> createState() => _SimpleButtonOutlineState();
}

class _SimpleButtonOutlineState extends State<SimpleButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: 6.h,
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h),
          border: Border.all(color: AppColors.colorBlack, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          child: Text(
            widget.text ?? '',
            style: AppStyle.texttitle.copyWith(color: Colors.black),
          ),
        )),
      ),
    );
  }
}
