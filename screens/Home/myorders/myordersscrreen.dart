import 'dart:io';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';

import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class MyordersScreen extends StatefulWidget {
  @override
  State<MyordersScreen> createState() => _MyordersScreenState();
}

class _MyordersScreenState extends State<MyordersScreen> {
  bool isPressed = false;
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  bool searchshow = false;
  bool datashow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        //backgroundColor: AppColors.primarycolor,
        iconTheme: IconThemeData(
          color: AppColors.colorBlack,
        ),
        // backgroundColor: Colors.white.withOpacity(0.95),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Text(
              Languages.of(context)!.myorder,
              style: AppStyle.mytexttitle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.globalSearch);
                    },
                    child: Icon(Icons.search, color: AppColors.colorBlack)),
                SizedBox(
                  width: 4.w,
                ),
                Icon(Icons.shopping_cart_rounded, color: AppColors.colorBlack),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h, right: 2.h, bottom: 1.h),
                child: SizedBox(
                  height: 6.h,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2.w)),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.w),
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search),
                          color: AppColors.colorGrey,
                          onPressed: () {},
                        ),
                        hintText: Languages.of(context)!.searchyourorder,
                        hintStyle:
                            AppStyle.textsubsubtitle.copyWith(fontSize: 15.sp)),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 2.h,
                              right: 2.h,
                            ),
                            child: ClayContainer(
                              borderRadius: 1.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.colorGrey.withOpacity(0.2),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(1.w),
                                      ),
                                    ),
                                    child: Image.asset(
                                      AppImages.package,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.5.h, bottom: 0.5.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 60.w,
                                          child: Text('Delivered Today, May 16',
                                              maxLines: 1,
                                              style: AppStyle.textcatsubtitle
                                                  .copyWith(
                                                      fontSize: 15.sp,
                                                      color: Colors.green)),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        SizedBox(
                                          width: 60.w,
                                          child: Text(
                                              'Online Shopping Site for Fashion & Lifestyle, API is to build notify',
                                              maxLines: 1,
                                              style: AppStyle.textsubsubtitle
                                                  .copyWith(fontSize: 15.sp)),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 15,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(
                                          width: 60.w,
                                          child: Text('Rate this product now',
                                              maxLines: 1,
                                              style: AppStyle.textsubsubtitle),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColors.colorGrey,
                                        size: 3.h,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                          Divider(
                            color: AppColors.colorGrey.withOpacity(0.4),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 1.w,
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
