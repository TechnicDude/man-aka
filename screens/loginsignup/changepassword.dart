import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manaqa_app/screens/loginsignup/components/change_password_form.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/mainbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
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
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              const MainBar(
                text: "Change Password",
              ),
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ChangePasswordForm(),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
