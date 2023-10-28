import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BiddingScreen extends StatefulWidget {
  const BiddingScreen({super.key});

  @override
  State<BiddingScreen> createState() => _BiddingScreenState();
}

class _BiddingScreenState extends State<BiddingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.colorWhite,
        ),
        backgroundColor: AppColors.primarycolor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 2.w,
            ),
            Center(
              child: Text(Languages.of(context)!.bidding,
                  style: AppStyle.mytexttitle.copyWith(
                    color: AppColors.colorWhite,
                  )),
            ),
            Spacer(),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.biddingForm);
                },
                child: Icon(
                  Icons.add_box_rounded,
                  size: 4.h,
                  color: AppColors.colorWhite,
                )),
          ],
        ),
      ),
      body: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  top: 1.h, bottom: 0.5.h, left: 1.5.h, right: 1.5.h),
              child: InkWell(
                child: Container(
                  // height: 14.h,
                  //borderRadius: 1.h,
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    borderRadius: BorderRadius.all(Radius.circular(2.h)),
                    border: Border.all(
                        color: AppColors.colorGrey.withOpacity(0.2), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 17.h,
                                width: 22.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(1.h),
                                  color: AppColors.colorGrey.withOpacity(0.3),
                                ),
                                child: CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 3.h,
                                    backgroundImage: AssetImage(
                                      AppImages.loginimg,
                                    )),
                              ),
                              // Container(
                              //   height: 17.h,
                              //   width: 22.w,
                              //   decoration: BoxDecoration(
                              //       shape: BoxShape.rectangle,
                              //       borderRadius: BorderRadius.circular(1.h),
                              //       color: AppColors.colorGrey,
                              //       image:
                              //       wishlistProvider
                              //                   .wishlistList[index].image
                              //                   .toString() !=
                              //               "null"
                              //           ? DecorationImage(
                              //               image: NetworkImage(
                              //                 ApiUrl.imageurl +
                              //                     (wishlistProvider
                              //                         .wishlistList[index]
                              //                         .image!),
                              //               ),
                              //               fit: BoxFit.fill)
                              //           : DecorationImage(
                              //               image:
                              //                   AssetImage(AppImages.outro1),
                              //               fit: BoxFit.fill),
                              //       boxShadow: [
                              //         BoxShadow(
                              //           color: AppColors.colorGrey,
                              //           blurRadius: 2,
                              //         ),
                              //       ]),
                              // ),
                            ],
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 60.w,
                                child: Text(
                                    // wishlistProvider
                                    //     .wishlistList[index].name!,

                                    "Fashion Bidding Developement Course",
                                    maxLines: 1,
                                    style: AppStyle.textcatsubtitle
                                        .copyWith(fontSize: 15.sp)),
                              ),
                              SizedBox(
                                width: 60.w,
                                child: Text(
                                    "Lorem ipsum Fashion Developement Course, Fashion Developement Course. Fashion Developement Course",
                                    // "${wishlistProvider.wishlistList[index].shipping} Delivery",
                                    maxLines: 2,
                                    style: AppStyle.textsubsubtitle),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text("Maximum Bid",
                                          style: AppStyle.textsubsubtitle),
                                      Text("\$126",
                                          style: AppStyle.textcatsubtitle
                                              .copyWith(fontSize: 15.sp)),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    children: [
                                      Text("My Bid",
                                          style: AppStyle.textsubsubtitle
                                              .copyWith(
                                                  color:
                                                      AppColors.primarycolor)),
                                      Row(
                                        children: [
                                          Text(
                                            "\$126",
                                            style: AppStyle.textcatsubtitle
                                                .copyWith(
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          Icon(
                                            Icons.edit,
                                            size: 2.2.h,
                                            color: AppColors.primarycolor,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Column(
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         dislike(wishlistProvider
                      //             .wishlistList[index].id
                      //             .toString());
                      //       },
                      //       icon: Icon(Icons
                      //           .delete_sweep_rounded),
                      //       color: Colors.red,
                      //     ),
                      //     IconButton(
                      //       onPressed: () {
                      //         dislike(wishlistProvider
                      //             .wishlistList[index].id
                      //             .toString());
                      //       },
                      //       icon:
                      //           Icon(Icons.shopping_cart),
                      //       color: AppColors.primarycolor,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, Routes.biddingForm);
        },
        label: const Text(
          'Add New Bidding',
          style: TextStyle(color: AppColors.colorWhite),
        ),
        icon: const Icon(
          Icons.add_circle_outlined,
          color: AppColors.colorWhite,
        ),
        backgroundColor: AppColors.primarycolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
