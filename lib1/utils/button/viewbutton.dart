import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewButtonWidget extends StatefulWidget {
  final String? image;
  final String? text;
  final Color? boxcolor;
  final Color? textcolor;
  final Color? bordercolor;
  final double? height;
  final Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? finalbuttextstyle;
  final EdgeInsetsGeometry? padding;
  const ViewButtonWidget({
    Key? key,
    this.image,
    this.text,
    this.onTap,
    this.boxcolor,
    this.textcolor,
    this.bordercolor,
    this.height,
    this.borderRadius,
    this.finalbuttextstyle,
    this.padding,
  }) : super(key: key);

  @override
  State<ViewButtonWidget> createState() => _ViewButtonWidgetState();
}

class _ViewButtonWidgetState extends State<ViewButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 7.h,
        decoration: BoxDecoration(
            color: widget.boxcolor ?? Colors.black,
            border: Border.all(
                color: widget.bordercolor ??
                    widget.boxcolor ??
                    Colors.transparent),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(2.w)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: Text(
                widget.text ?? '',
                style: widget.finalbuttextstyle ??
                    AppStyle.onbaordtitle.copyWith(
                        color: widget.textcolor ?? Colors.white,
                        fontSize: 15.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
