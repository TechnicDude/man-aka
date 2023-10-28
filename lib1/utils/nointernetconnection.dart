import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InternetNotAvailable extends StatelessWidget {
  double? height;
  InternetNotAvailable({Key? key, double? height});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height != null ? height : 55.h,
        width: 50.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.nointernet,
                  color: AppColors.colorGrey.withOpacity(0.3)),
              Text(
                Languages.of(context)!.nointernetconnection,
                // 'No internet connection!',
                style: AppStyle.texttitle.copyWith(
                    color: AppColors.colorGrey.withOpacity(0.5),
                    fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
