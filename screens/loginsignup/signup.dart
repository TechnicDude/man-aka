// ignore_for_file:

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/screens/loginsignup/components/sign_up_form.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/mainbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreenActivity extends StatefulWidget {
  const SignupScreenActivity({super.key});

  @override
  State<SignupScreenActivity> createState() => _SignupScreenActivityState();
}

class _SignupScreenActivityState extends State<SignupScreenActivity> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
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
                  MainBar(text: Languages.of(context)!.signup),
                  SafeArea(
                      child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignUpForm(
                          callback: (value) {
                            if (value) {
                              setState(() {
                                _isLoading = true;
                              });
                            } else {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: Languages.of(context)!.alreadyregister,
                            style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.w500,
                            ),
                            // style: Style_File.subtitle.copyWith(
                            //   color: Colors.grey,
                            // ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "  ${Languages.of(context)!.login}",
                                  style:
                                      TextStyle(color: AppColors.primarycolor),
                                  // style: Style_File.subtitle.copyWith(
                                  //     color: colorBlack, fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(
                                        context, Routes.loginScreen)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              height: 80.h,
              width: 100.w,
              color: Colors.transparent,
              child: LoaderScreen(),
            )
        ],
      ),
    );
  }
}
