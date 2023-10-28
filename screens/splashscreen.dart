import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manaqa_app/api/locdb.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, homePageRoute);
  }

  // homePageRoute() async {
  //   await LocDb().isLoggedIn();
  //   bool check = LocDb().loginapp;

  //   if (check) {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //         Routes.bottomNav, (Route<dynamic> route) => false);
  //   } else {
  //     Navigator.pushNamed(context, Routes.onBoard);
  //   }
  // }

  homePageRoute() async {
    String? onboardingScreen;
    await LocDb().isLoggedIn();
    bool check = await LocDb().loginapp;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    onboardingScreen =
        preferences.getString(AppStringFile.onboardingScreen).toString();

    if (check) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.bottomNav, (Route<dynamic> route) => false);
    } else {
      if (onboardingScreen != "0") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                AppImages.splash,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Center(
                  child: LoaderScreen(),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
