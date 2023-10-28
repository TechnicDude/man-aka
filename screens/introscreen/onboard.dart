import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
          child: Column(
            children: [
              // Container(
              //   width: 90.w,
              //   height: 50.h,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     // color: AppColors.colorGrey,
              //     image: DecorationImage(
              //         image: NetworkImage(
              //           AppImages.outro2,
              //         ) as ImageProvider,
              //         fit: BoxFit.fill),
              //   ),
              // ),

              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(2.h)),
                child: Image.asset(AppImages.outro2,
                    width: 90.w, height: 50.h, fit: BoxFit.fill),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "20% Discount\nNew Arrival Product",
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
                            Languages.of(context)!.skip,
                            style: AppStyle.texttitle.copyWith(
                                color: AppColors.colorWhite, fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.OnBoardScreentwo);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorBlack,
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Languages.of(context)!.next,
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
