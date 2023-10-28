import 'package:flutter/material.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormAddScreen extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hinttext;
  final IconData? icon;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscure;
  final bool obscure1;
  final bool suffixIcon;
  final Widget? suffixIconWidget;
  final void Function()? onPressed;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  TextFormAddScreen({
    Key? key,
    required this.textEditingController,
    required this.hinttext,
    this.icon,
    this.obscure = true,
    this.obscure1 = true,
    this.validator,
    this.readOnly = false,
    this.suffixIcon = false,
    this.suffixIconWidget,
    this.onPressed,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: TextFormField(
        onChanged: onChanged,
        controller: textEditingController,
        readOnly: readOnly,
        obscureText: suffixIcon ? obscure : false,
        keyboardType: keyboardType,
        cursorColor: AppColors.primarycolor,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(
              fontSize: 14.sp,
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                )),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(2.w),
                )),
            prefixIcon: Icon(
              icon,
              color: AppColors.primarycolor,
              size: 2.5.h,
              // color: AppColors.appPrimarycolor,
            ),
            suffixIcon: suffixIcon
                ? suffixIconWidget ??
                    IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          obscure ? Icons.visibility_off : Icons.visibility,
                          //   obscure1 ? Icons.visibility_off : Icons.visibility,
                          // color: colorBlack,
                        ))
                : null),
        validator: validator,
      ),
    );
  }
}
