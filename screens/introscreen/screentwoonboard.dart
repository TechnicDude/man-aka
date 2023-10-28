import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardScreentwo extends StatefulWidget {
  const OnBoardScreentwo({super.key});

  @override
  State<OnBoardScreentwo> createState() => _OnBoardScreentwoState();
}

class _OnBoardScreentwoState extends State<OnBoardScreentwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 2.h, right: 2.h, left: 2.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
                    ),
                    color: Colors.black,
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(2.h)),
                child: Image.asset(AppImages.outro1,
                    width: 90.w, height: 50.h, fit: BoxFit.fill),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Take Advantage\nOf The Offer Shopping",
                    style: AppStyle.onbaordtitle.copyWith(
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Publish up your selfies to make yoursef \nmore beautiful with this app",
                    style: AppStyle.textsubsubtitle
                        .copyWith(color: AppColors.colorBlack, fontSize: 16.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.loginScreen);
                    },
                    child: Container(
                      height: 5.h,
                      width: 9.h,
                      decoration: BoxDecoration(
                          color: AppColors.colorBlack,
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Skip",
                            style: AppStyle.texttitle.copyWith(
                                color: AppColors.colorWhite, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.OnBoardScreenthree);
                    },
                    child: Container(
                      height: 5.h,
                      width: 9.h,
                      decoration: BoxDecoration(
                          color: AppColors.colorBlack,
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Next",
                            style: AppStyle.texttitle.copyWith(
                                color: AppColors.colorWhite, fontSize: 16.sp),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.colorWhite,
                            size: 3.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
