import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackButtonscreen extends StatelessWidget {
  final String? text;
  const BackButtonscreen({this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          ),
          color: Colors.black,
        ),
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
