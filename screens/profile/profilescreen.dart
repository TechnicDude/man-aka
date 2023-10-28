import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/profileuserProvider.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/nointernetconnection.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = false;

  ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();

    _profileuserProvider =
        Provider.of<ProfileUserProvider>(context, listen: false);
    _profileuserProvider.profileuserlist(AppHelper.userid ?? '');
  }

  String _error = '';

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
                backgroundColor: Colors.white.withOpacity(0.95),
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: AppColors.colorWhite,
                  ),
                  backgroundColor: AppColors.primarycolor,
                  elevation: 0,
                ),
                body: Consumer<ProfileUserProvider>(
                  builder: ((context, profileUserProvider, child) {
                    print(profileUserProvider.profileuserList);
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              height: 18.h,
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
                                    bottom: 2.h),
                                child: profileUserProvider
                                            .profileuserList.length !=
                                        0
                                    ? Row(
                                        children: [
                                          SizedBox(
                                            height: 12.h,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: CircleAvatar(
                                                radius: 5.5.h,
                                                backgroundColor: Color.fromARGB(
                                                    85, 240, 235, 235),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.grey,
                                                  radius: 5.h,
                                                  backgroundImage: profileUserProvider
                                                              .profileuserList[
                                                                  0]
                                                              .person!
                                                              .image !=
                                                          null
                                                      ? NetworkImage(ApiUrl
                                                              .imageurl +
                                                          profileUserProvider
                                                              .profileuserList[
                                                                  0]
                                                              .person!
                                                              .image!)
                                                      : AssetImage(
                                                          AppImages.profile,
                                                        ) as ImageProvider,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   height: 11.h,
                                          //   child: GestureDetector(
                                          //     onTap: () {},
                                          //     child: CircleAvatar(
                                          //         backgroundColor: Colors.grey,
                                          //         radius: 6.h,
                                          //         backgroundImage: AssetImage(
                                          //           AppImages.profile,
                                          //         )),
                                          //   ),
                                          // ),

                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 2.h,
                                                left: 4.h,
                                                right: 1.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      profileUserProvider
                                                              .profileuserList
                                                              .isNotEmpty
                                                          ? profileUserProvider
                                                                  .profileuserList[
                                                                      0]
                                                                  .person!
                                                                  .name ??
                                                              ''
                                                          : '',
                                                      style: AppStyle
                                                          .textsubtitle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    //Text(' '),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Text(
                                                      profileUserProvider
                                                              .profileuserList
                                                              .isNotEmpty
                                                          ? profileUserProvider
                                                                  .profileuserList[
                                                                      0]
                                                                  .person!
                                                                  .lastName ??
                                                              ''
                                                          : '',
                                                      style: AppStyle
                                                          .textsubtitle
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                Text(
                                                  profileUserProvider
                                                          .profileuserList
                                                          .isNotEmpty
                                                      ? profileUserProvider
                                                              .profileuserList[
                                                                  0]
                                                              .email ??
                                                          ''
                                                      : '',
                                                  style: AppStyle
                                                      .textsubsubtitle
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 15.sp),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                profileUserProvider
                                                        .profileuserList
                                                        .isNotEmpty
                                                    ? InkWell(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              Routes
                                                                  .editProfile,
                                                              arguments: {
                                                                AppStringFile
                                                                        .profileuserdata:
                                                                    profileUserProvider
                                                                        .profileuserList,
                                                              }).then((value) {
                                                            _profileuserProvider
                                                                .profileuserlist(
                                                                    AppHelper
                                                                            .userid ??
                                                                        '');
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 4.h,
                                                          width: 16.h,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                Languages.of(
                                                                        context)!
                                                                    .editprofile,
                                                                style: AppStyle
                                                                    .textsubtitle
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black),
                                                              ),
                                                              Icon(
                                                                Icons.edit,
                                                                size: 20,
                                                                color: AppColors
                                                                    .appPrimarycolor,
                                                              )
                                                            ],
                                                          ),
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .colorWhite,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4.w),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: AppColors
                                                                      .colorWhite,
                                                                  blurRadius:
                                                                      1.h,
                                                                ),
                                                              ]),
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              )),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 4.h, left: 1.5.h, right: 1.5.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.lock_outline,
                                          size: 25.0,
                                          color: AppColors.colorGrey,
                                        ),
                                        label: Text(
                                          Languages.of(context)!.changepassword,
                                          style: AppStyle.textsubtitle
                                              .copyWith(color: Colors.black),
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  Routes.changePassword);
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 25.0,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     TextButton.icon(
                                //         onPressed: () {},
                                //         icon: Icon(
                                //           Icons.shopping_bag,
                                //           size: 25.0,
                                //           color: AppColors.colorGrey,
                                //         ),
                                //         label: Text(
                                //           "Orders",
                                //           style: AppStyle.textsubtitle
                                //               .copyWith(color: Colors.black),
                                //         )),
                                //     Row(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       children: [
                                //         IconButton(
                                //             onPressed: () {
                                //               // Navigator.pushNamed(
                                //               //     context, Routes.packageScreen);
                                //             },
                                //             icon: Icon(
                                //               Icons.arrow_forward_ios,
                                //               size: 25.0,
                                //               color: Colors.grey,
                                //             )),
                                //       ],
                                //     ),
                                //   ],
                                // ),
                                // const Divider(
                                //   color: Colors.grey,
                                //   thickness: 1,
                                // ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.person_pin_circle_rounded,
                                          size: 25.0,
                                          color: AppColors.colorGrey,
                                        ),
                                        label: Text(
                                          Languages.of(context)!.address,
                                          style: AppStyle.textsubtitle
                                              .copyWith(color: Colors.black),
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  Routes.customerAddressScreen);
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 25.0,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.settings,
                                          size: 25.0,
                                          color: AppColors.colorGrey,
                                        ),
                                        label: Text(
                                          Languages.of(context)!.settings,
                                          style: AppStyle.textsubtitle
                                              .copyWith(color: Colors.black),
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  Routes.accountScreen);
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 25.0,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    !isLoading
                                        ? TextButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete,
                                              size: 25.0,
                                              color: AppColors.colorGrey,
                                            ),
                                            label: Text(
                                              Languages.of(context)!
                                                  .deleteaccount,
                                              // "Delete Account",
                                              style: AppStyle.textsubtitle
                                                  .copyWith(
                                                      color: Colors.black),
                                            ))
                                        : ButtonWidgetLoader(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.INFO,
                                                btnOkColor:
                                                    AppColors.appPrimarycolor,
                                                borderSide: BorderSide(
                                                    color: AppColors
                                                        .appPrimarycolor,
                                                    width: 0.1.h),
                                                buttonsBorderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(2)),
                                                headerAnimationLoop: false,
                                                animType: AnimType.BOTTOMSLIDE,
                                                title:
                                                    //'Delete Account',
                                                    Languages.of(context)!
                                                        .deleteaccount,
                                                desc: Languages.of(context)!
                                                    .deleteaccountmsg,
                                                //'Are you sure want to delete your account?',
                                                showCloseIcon: true,
                                                // btnCancelOnPress: () {
                                                //   Navigator.pop(context);
                                                // },
                                                btnOkOnPress: () {
                                                  setState(() {
                                                    _error = '';
                                                  });
                                                  if (isLoading) {
                                                    return;
                                                  }

                                                  // deleteAccount(
                                                  //     profileUserProvider
                                                  //         .profileuserList[0].id
                                                  //         .toString(),
                                                  //     context);
                                                },
                                              )..show();
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 25.0,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.logout_outlined,
                                          size: 25.0,
                                          color: AppColors.colorGrey,
                                        ),
                                        label: Text(
                                          Languages.of(context)!.logout,
                                          // "Logout",
                                          style: AppStyle.textsubtitle
                                              .copyWith(color: Colors.black),
                                        )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.INFO,
                                                btnOkColor:
                                                    AppColors.appPrimarycolor,
                                                borderSide: BorderSide(
                                                    color: AppColors
                                                        .appPrimarycolor,
                                                    width: 0.1.h),
                                                buttonsBorderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(2)),
                                                headerAnimationLoop: false,
                                                animType: AnimType.BOTTOMSLIDE,
                                                title: Languages.of(context)!
                                                    .logout,
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
                                                          (Route<dynamic>
                                                                  route) =>
                                                              false);
                                                },
                                              )..show();
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              size: 25.0,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                )),
          );
  }
}

Widget accountTextUI(
  BuildContext context,
  IconData icon1,
  String title,
  IconData icon2,
  String navigation, {
  Object? arguments,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon1,
            size: 25.0,
            color: AppColors.appPrimarycolor,
          ),
          label: Text(
            title,
            // style: Style_File.title
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () => navigation,
              //onPressed: () {},
              icon: Icon(
                icon2,
                size: 25.0,
                color: Colors.grey,
              )),
        ],
      ),
    ],
  );
}
