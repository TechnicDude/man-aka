import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final Function()? onTap;
  const ButtonWidget({
    Key? key,
    this.image,
    this.text,
    this.onTap,
    this.boxcolor,
    this.textcolor,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
            color: widget.boxcolor ?? AppColors.primarycolor,
            border: Border.all(
              color: AppColors.primarycolor,
            ),
            borderRadius: BorderRadius.circular(10.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text ?? '',
              style: AppStyle.onbaordtitle.copyWith(
                  color: widget.textcolor ?? Colors.white, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
