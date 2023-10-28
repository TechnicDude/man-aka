import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/homeprovider.dart';
import 'package:manaqa_app/provider/profileuserProvider.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/changelanguagepopup.dart';
import 'package:manaqa_app/utils/nointernetconnection.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class AccountScreen extends StatefulWidget {
  final Function? callback;
  const AccountScreen({this.callback, super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool showpop = false;

  @override
  Widget build(BuildContext context) {
    return Provider.of<InternetConnectionStatus>(context) ==
            InternetConnectionStatus.disconnected
        ? InternetNotAvailable()
        : Shimmer(
            duration: Duration(seconds: 3),
            // This is NOT the default value. Default value: Duration(seconds: 0)
            interval: Duration(seconds: 3),
            // This is the default value
            color: Colors.white,
            // This is the default value
            colorOpacity: 0.3,
            // This is the default value
            enabled: true,
            // This is the default value
            direction: ShimmerDirection.fromLTRB(),
            child: Scaffold(
              backgroundColor: AppColors.primarycolor,
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
                      child: Text(Languages.of(context)!.myaccount,
                          style: AppStyle.mytexttitle.copyWith(
                            color: AppColors.colorWhite,
                          )),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.addToCardScreenActivity);
                        },
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: AppColors.colorWhite,
                        )),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 10.h,
                        color: AppColors.primarycolor,
                      ),
                      Container(
                        height: 100.h - 24.h,
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 1.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 250,
                                      height: 80,
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '${AppHelper.person!.person!.name}',
                                                    style: AppStyle.textsubtitle
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Text(
                                                    '${AppHelper.person!.person!.lastName}',
                                                    style: AppStyle.textsubtitle
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Text(
                                                '${AppHelper.person!.email}',
                                                style: AppStyle.textsubsubtitle
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontSize: 15.sp),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  Routes.profileScreen);
                                            },
                                            child: CircleAvatar(
                                              radius: 2.h,
                                              backgroundColor: AppColors.grey
                                                  .withOpacity(0.2),
                                              child: CircleAvatar(
                                                radius: 12,
                                                child: Icon(
                                                  Icons.edit,
                                                  color: AppColors.primarycolor,
                                                ),
                                                backgroundColor:
                                                    AppColors.colorWhite,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 1.h,
                              // ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 0.1.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.changelanguage,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showpop = true;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Languages.of(context)!.aboutmanaqa,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.termsAndCondition,
                                            arguments: {
                                              AppStringFile.title:
                                                  Languages.of(context)!
                                                      .aboutmanaqa,
                                              AppStringFile.url:
                                                  ApiUrl.shippingpolicy,
                                            });
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Report",
                                    // Languages.of(context)!.feedback,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.feedbacks);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.contactus,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.termsAndCondition,
                                            arguments: {
                                              AppStringFile.title:
                                                  Languages.of(context)!
                                                      .contactus,
                                              AppStringFile.url:
                                                  ApiUrl.shippingpolicy,
                                            });
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.shippingpolicy,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.termsAndCondition,
                                            arguments: {
                                              AppStringFile.title:
                                                  Languages.of(context)!
                                                      .shippingpolicy,
                                              AppStringFile.url:
                                                  ApiUrl.shippingpolicy,
                                            });
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.cancelationpolicy,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.termsAndCondition,
                                            arguments: {
                                              AppStringFile.title:
                                                  Languages.of(context)!
                                                      .cancelationpolicy,
                                              AppStringFile.url:
                                                  ApiUrl.cancellationpolicy,
                                            });
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.privacypolicy,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.termsAndCondition,
                                          arguments: {
                                            AppStringFile.title:
                                                Languages.of(context)!
                                                    .privacypolicy,
                                            AppStringFile.url:
                                                ApiUrl.privacypolicy,
                                          });
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 23.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.cookiespolicy,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.cookiesPolicy);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),

                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Languages.of(context)!.termsandcondition,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, Routes.termsAndCondition,
                                            arguments: {
                                              AppStringFile.title:
                                                  Languages.of(context)!
                                                      .termsandcondition,
                                              AppStringFile.url:
                                                  ApiUrl.shippingpolicy,
                                            });
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    Languages.of(context)!.shareapp,
                                    style: AppStyle.textsubtitle
                                        .copyWith(color: Colors.black),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Share.share(
                                            'hey! check out Manaqa app https://play.google.com/store/apps/details?id=com.manaqa.app');
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 23.0,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              const Divider(
                                color: Colors.black12,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.INFO,
                                        btnOkColor: AppColors.appPrimarycolor,
                                        borderSide: BorderSide(
                                            color: AppColors.appPrimarycolor,
                                            width: 0.1.h),
                                        buttonsBorderRadius: BorderRadius.all(
                                            Radius.circular(2)),
                                        headerAnimationLoop: false,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: Languages.of(context)!.logout,
                                        desc:
                                            'Are you sure wants to logout Manaqa?',
                                        showCloseIcon: true,
                                        // btnCancelOnPress: () {
                                        //   Navigator.pop(context);
                                        // },
                                        btnOkOnPress: () {
                                          AppHelper.logout();
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pushNamedAndRemoveUntil(
                                                  Routes.loginScreen,
                                                  (Route<dynamic> route) =>
                                                      false);
                                        },
                                      )..show();
                                    },
                                    child: Text(
                                      Languages.of(context)!.logout,
                                      style: AppStyle.texttitle.copyWith(
                                          color: AppColors.appPrimarycolor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Manaqa v1.0.0",
                                    style: AppStyle.textsubsubtitle.copyWith(
                                        color: AppColors.colorBlack,
                                        fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (showpop)
                    Center(child: EditLanguagePopup(
                      callback: (value) {
                        setState(() {
                          showpop = false;
                        });
                      },
                    )),
                  Padding(
                      padding: EdgeInsets.only(top: 3.h, left: 5.w),
                      child: CircleAvatar(
                        radius: 6.h,
                        backgroundColor: AppColors.primarycolor,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 5.2.h,
                          backgroundImage:
                              AppHelper.person!.person!.image != null
                                  ? NetworkImage(ApiUrl.imageurl +
                                      AppHelper.person!.person!.image!)
                                  : AssetImage(
                                      AppImages.profile,
                                    ) as ImageProvider,
                        ),
                      )),
                ],
              ),
            ),
          );
  }
}
