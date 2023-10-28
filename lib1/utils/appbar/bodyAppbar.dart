import 'package:flutter/material.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/appbar/bodyiconbar.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BodyAppBarScreenActivity extends StatelessWidget {
  final String title;
  final Function? onPressed;
  const BodyAppBarScreenActivity({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.primarycolor,
      padding: AppTheme.padding,
      child: Row(
        children: <Widget>[
          BodyIconsBarScreenActivity(
            icon: Icons.arrow_back_ios,
            color: Colors.black54,
            onPressed: onPressed ??
                () {
                  Navigator.pop(context);
                },
          ),
          SizedBox(
            width: 100.w - 100,
            child: Center(
              child: TitleTextStyle(
                text: title,
                style: AppStyle.texttitlemain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
