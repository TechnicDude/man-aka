import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/screens/loginsignup/components/sign_in_form.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/mainbar.dart';
import 'package:manaqa_app/utils/socialbutton.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreenActivity extends StatefulWidget {
  const LoginScreenActivity({super.key});

  @override
  State<LoginScreenActivity> createState() => _LoginScreenActivityState();
}

class _LoginScreenActivityState extends State<LoginScreenActivity> {
  bool islooding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbakgroundcolor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 4.h, right: 2.h, left: 2.h),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        width: 100.w - 100,
                        child: Center(
                          child: Image.asset(
                            AppImages.loginimg,
                            height: 26.5.h,
                            width: 55.82.w,
                            // fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MainBar(text: Languages.of(context)!.login),
                  SafeArea(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInForm(
                          callback: (value) {
                            if (value) {
                              setState(() {
                                islooding = true;
                              });
                            } else {
                              setState(() {
                                islooding = false;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: Languages.of(context)!.donthaveaccount,
                            style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "  ${Languages.of(context)!.signup}",
                                  style: TextStyle(
                                    color: AppColors.primarycolor,
                                    // fontWeight: FontWeight.w500,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(
                                        context, Routes.signupScreen)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                Languages.of(context)!.orloginwith,
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialButton(
                                image: AppImages.fb,
                                text: Languages.of(context)!.loginwithfb,
                                boxcolor: Colors.white,
                                textcolor: Colors.black,
                                onPressed: () {}),
                            SizedBox(
                              width: 4.w,
                            ),
                            if (Platform.isIOS)
                              SocialButton(
                                  image: AppImages.applewhite,
                                  text: Languages.of(context)!.loginwithapple,
                                  boxcolor: Colors.black,
                                  textcolor: Colors.white,
                                  onPressed: () {}),
                            if (Platform.isIOS)
                              SizedBox(
                                width: 4.w,
                              ),
                            SocialButton(
                              image: AppImages.google,
                              text: Languages.of(context)!.loginwithgoogle,
                              boxcolor: Colors.white,
                              textcolor: Colors.black,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          if (islooding)
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.transparent,
              child: Center(child: LoaderScreen()),
            )
        ],
      ),
    );
  }
}
