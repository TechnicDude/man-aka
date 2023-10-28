import 'package:flutter/material.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SimpleButton extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const SimpleButton({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: 6.h,
          width: 90.w,
          decoration: BoxDecoration(
            color: AppColors.appPrimarycolor,
            borderRadius: BorderRadius.circular(1.h),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(-1, 3),
              )
            ],
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Text(
              widget.text ?? '',
              style: AppStyle.texttitle.copyWith(color: Colors.white),
            ),
          )),
        ));
  }
}
