import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardScreenthree extends StatefulWidget {
  const OnBoardScreenthree({super.key});

  @override
  State<OnBoardScreenthree> createState() => _OnBoardScreenthreeState();
}

class _OnBoardScreenthreeState extends State<OnBoardScreenthree> {
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
                child: Image.asset(AppImages.outro3,
                    width: 90.w, height: 45.h, fit: BoxFit.fill),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "All Types Offer\nWithin Your Reach",
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.loginScreen);
                    },
                    child: Container(
                      height: 6.h,
                      width: 17.h,
                      decoration: BoxDecoration(
                          color: AppColors.colorBlack,
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login ",
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
