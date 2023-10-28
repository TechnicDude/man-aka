import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/screens/Home/relatedProducts/relatedproduct.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/changelanguagepopup.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MenuBarScreens extends StatefulWidget {
  const MenuBarScreens({Key? key}) : super(key: key);

  @override
  State<MenuBarScreens> createState() => _MenuBarScreensState();
}

class _MenuBarScreensState extends State<MenuBarScreens> {
  bool showpop = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.colorWhite,
      child: Shimmer(
        duration: Duration(seconds: 3),
        // This is NOT the default value. Default value: Duration(seconds: 0)
        interval: Duration(seconds: 3),
        // This is the default value
        color: Colors.white,
        // This is the default value
        colorOpacity: 0.4,
        // This is the default value
        enabled: true,
        // This is the default value
        direction: ShimmerDirection.fromLTRB(),

        child: Stack(
          children: [
            ListView(
              children: [
                // Container(
                //   decoration: BoxDecoration(color: AppColors.primarycolor),
                //   height: 16.h,
                //   width: 50.w,
                //   child: DrawerHeader(
                //     child: SizedBox(
                //         //   height: 50.h,
                //         // width: 50.w,
                //         child: Image.asset(AppImages.logo)),
                //   ),
                // ),

                Container(
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: AppColors.primarycolor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5.w),
                      bottomRight: Radius.circular(5.w),
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 1.h,
                        left: 3.h,
                        right: 2.h,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 4.5.h,
                            backgroundColor: Color.fromARGB(85, 240, 235, 235),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 4.h,
                              backgroundImage:
                                  AppHelper.person!.person!.image != null
                                      ? NetworkImage(ApiUrl.imageurl +
                                          AppHelper.person!.person!.image!)
                                      : AssetImage(
                                          AppImages.profile,
                                        ) as ImageProvider,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 4.h,
                              left: 2.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${AppHelper.person!.person!.name}',
                                      style: AppStyle.textsubtitle
                                          .copyWith(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(''),
                                    Text(
                                      '${AppHelper.person!.person!.lastName}',
                                      style: AppStyle.textsubtitle
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  '${AppHelper.person!.email}',
                                  style: AppStyle.textsubtitle.copyWith(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),

                ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(Languages.of(context)!.home,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.bottomNav);
                  },
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.widgets_rounded,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(Languages.of(context)!.category,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.myCategorylistScreenActivity);
                  },
                ),

                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),

                ListTile(
                  leading: const Icon(
                    Icons.add_box_rounded,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(Languages.of(context)!.bidding,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.biddingScreen);
                  },
                ),

                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(Languages.of(context)!.myorder,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.myordersScreen);
                  },
                ),

                // const Divider(
                //   color: Colors.black12,
                //   thickness: 1,
                // ),
                // ListTile(
                //   leading: const Icon(
                //     Icons.shopping_cart,
                //     size: 18,
                //     color: Colors.black,
                //   ),
                //   title: Text('My Cart', style: AppStyle.textdrawertitle),
                //   onTap: () {
                //     Navigator.pushNamed(context, Routes.addToCardScreenActivity);
                //     //shoppingCart);
                //   },
                // ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.favorite_sharp,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(Languages.of(context)!.wishlist,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.wishlistScreen);
                  },
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.translate,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(Languages.of(context)!.changelanguage,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    setState(() {
                      showpop = true;
                    });
                    // Navigator.pushNamed(context, Routes.profileScreen);
                  },
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.manage_accounts,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(Languages.of(context)!.myaccount,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.accountScreen);
                  },
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),

                ListTile(
                  leading: const Icon(
                    Icons.login,
                    size: 18,
                    color: Colors.black,
                  ),
                  title: Text(
                      AppHelper.userid == null
                          ? Languages.of(context)!.login
                          : Languages.of(context)!.logout,
                      style: AppStyle.textdrawertitle),
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      btnOkColor: AppColors.appPrimarycolor,
                      borderSide: BorderSide(
                          color: AppColors.appPrimarycolor, width: 0.1.h),
                      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: Languages.of(context)!.logout,
                      desc: 'Are you sure wants to logout Manaqa?',
                      showCloseIcon: true,
                      // btnCancelOnPress: () {
                      //   Navigator.pop(context);
                      // },
                      btnOkOnPress: () {
                        AppHelper.logout();
                        Navigator.of(context, rootNavigator: true)
                            .pushNamedAndRemoveUntil(Routes.loginScreen,
                                (Route<dynamic> route) => false);
                      },
                    )..show();
                  },
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 1,
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
          ],
        ),
      ),
    );
  }
}
