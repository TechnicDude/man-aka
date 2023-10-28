import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarScreens extends StatelessWidget {
  final String? image;
  final String? text;
  final String? icon2;
  final String? icon3;

  final Function()? onPressed;
  const AppBarScreens({
    Key? key,
    this.image,
    this.text,
    this.icon2,
    this.icon3,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
        //   ),
        //   color: Colors.black,
        // ),

        SizedBox(
          width: 2.w,
        ),
        Text(
          text ?? '',
          style: AppStyle.texttitle.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
