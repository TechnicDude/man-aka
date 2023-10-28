import 'dart:io';

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/likeapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/wishlistModel.dart';
import 'package:manaqa_app/provider/wishlistProvider.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/nodatafoundscreen.dart';
import 'package:manaqa_app/utils/nointernetconnection.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  WishlistProvider _wishlistProvider = WishlistProvider();

  @override
  void initState() {
    // TODO: implement initState
    _wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);
    fetchdatas();

    super.initState();
  }

  bool isPressed = false;
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  bool searchshow = false;
  bool datashow = false;

  List<WishlistDataData> wishlistdata = [];

  Future fetchdatas() async {
    await _wishlistProvider.wishlist();
  }

  Future dislike(String wishlistid) async {
    var body = {"product_id": wishlistid};
    LikeApi _likeapi = new LikeApi(body);
    final response = await _likeapi.disfav();
    print(response);
    fetchdatas();

    DialogHelper.showFlutterToast(
        strMsg: "Your Wishlist Removed Successfully ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          // backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: searchshow
              ? Container(
                  width: double.infinity,
                  height: 5.h,
                  decoration: BoxDecoration(
                      color: AppColors.colorWhite,
                      border: Border.all(color: AppColors.colorGrey),
                      borderRadius: BorderRadius.circular(2.h)),
                  child: Center(
                    child: TextField(
                      controller: sercheditcontroler,
                      onChanged: ((value) {
                        setState(() {
                          searchString = sercheditcontroler.text;
                        });
                      }),
                      decoration: InputDecoration(
                          isDense: true,
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: AppColors.colorGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                searchshow = false;
                                sercheditcontroler.clear();
                                searchString = '';
                              });
                            },
                          ),
                          hintText: Languages.of(context)!.search,
                          hintStyle: AppStyle.textsubtitle
                              .copyWith(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                )
              : Row(
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
                    Text(
                      Languages.of(context)!.wishlist,
                      style: AppStyle.mytexttitle,
                    ),
                  ],
                ),
          automaticallyImplyLeading: false,
          actions: [
            if (!searchshow)
              IconButton(
                onPressed: () {
                  setState(() {
                    searchshow = true;
                  });
                },
                icon: Icon(Icons.search, color: AppColors.colorBlack),
              ),
          ],
          centerTitle: true,
        ),
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : Consumer<WishlistProvider>(
                builder: (context, wishlistProvider, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!_wishlistProvider.datanotfound)
                        SizedBox(
                            height: 80.h, child: Center(child: LoaderScreen())),
                      if (wishlistProvider.datanotfound)
                        if (wishlistProvider.wishlistList.isEmpty)
                          NoDataFoundErrorScreens(),
                      if (wishlistProvider.datanotfound)
                        if (wishlistProvider.wishlistList.isNotEmpty)
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: wishlistProvider.wishlistList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: 1.h,
                                      bottom: 0.5.h,
                                      left: 1.5.h,
                                      right: 1.5.h),
                                  child: InkWell(
                                    child: Container(
                                      // height: 14.h,
                                      //borderRadius: 1.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.colorWhite,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.h)),
                                        border: Border.all(
                                            color: AppColors.colorGrey
                                                .withOpacity(0.2),
                                            width: 1),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(0.2.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 17.h,
                                                      width: 22.w,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      1.h),
                                                          color: AppColors
                                                              .colorGrey,
                                                          image: wishlistProvider
                                                                      .wishlistList[
                                                                          index]
                                                                      .image
                                                                      .toString() !=
                                                                  "null"
                                                              ? DecorationImage(
                                                                  image:
                                                                      NetworkImage(
                                                                    ApiUrl.imageurl +
                                                                        (wishlistProvider
                                                                            .wishlistList[index]
                                                                            .image!),
                                                                  ),
                                                                  fit: BoxFit
                                                                      .fill)
                                                              : DecorationImage(
                                                                  image: AssetImage(
                                                                      AppImages
                                                                          .outro1),
                                                                  fit: BoxFit
                                                                      .fill),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: AppColors
                                                                  .colorGrey,
                                                              blurRadius: 2,
                                                            ),
                                                          ]),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 50.w,
                                                      child: Text(
                                                          wishlistProvider
                                                              .wishlistList[
                                                                  index]
                                                              .name!,

                                                          //  "The Complete Guide Developement Course with scratch ",
                                                          maxLines: 1,
                                                          style: AppStyle
                                                              .textcatsubtitle
                                                              .copyWith(
                                                                  fontSize:
                                                                      15.sp)),
                                                    ),
                                                    SizedBox(
                                                      height: 0.5.h,
                                                    ),
                                                    SizedBox(
                                                      width: 50.w,
                                                      child: Text(
                                                          "by ${wishlistProvider.wishlistList[index].brandName}",
                                                          maxLines: 1,
                                                          style: AppStyle
                                                              .textsubsubtitle),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                            wishlistProvider
                                                                .wishlistList[
                                                                    index]
                                                                .rating
                                                                .toString(),
                                                            style: AppStyle
                                                                .textsubsubtitle),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        RatingBar.builder(
                                                          initialRating: double
                                                              .parse(wishlistProvider
                                                                  .wishlistList[
                                                                      index]
                                                                  .rating
                                                                  .toString()),
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemSize: 14,
                                                          itemPadding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      1.0),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  Icon(
                                                            Icons.star,
                                                            color: AppColors
                                                                .rating,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            print(rating);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    TitleTextStyle(
                                                      text:
                                                          "\$ ${wishlistProvider.wishlistList[index].salePrice.toString()}",
                                                      style: AppStyle.cardtitle
                                                          .copyWith(
                                                              fontSize: 16.sp,
                                                              color: AppColors
                                                                  .primarycolor),
                                                    ),
                                                    SizedBox(
                                                      width: 50.w,
                                                      child: Text(
                                                          "${wishlistProvider.wishlistList[index].shipping} Delivery",
                                                          maxLines: 1,
                                                          style: AppStyle
                                                              .textsubsubtitle),
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 4.h,
                                                          width: 30.w,
                                                          child: ButtonWidget(
                                                            text: Languages.of(
                                                                    context)!
                                                                .addtocart,
                                                            onTap: () {},
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        SizedBox(
                                                          height: 4.h,
                                                          width: 30.w,
                                                          child: ButtonWidget(
                                                            text: Languages.of(
                                                                    context)!
                                                                .remove,
                                                            onTap: () {
                                                              dislike(wishlistProvider
                                                                  .wishlistList[
                                                                      index]
                                                                  .id
                                                                  .toString());
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
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
                                  ),
                                );
                              }),
                    ],
                  ),
                );
              }));
  }
}
