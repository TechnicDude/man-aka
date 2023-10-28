import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manaqa_app/screens/loginsignup/components/change_newpassword_form.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/mainbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangenewPassword extends StatefulWidget {
  const ChangenewPassword({super.key});

  @override
  State<ChangenewPassword> createState() => _ChangenewPasswordState();
}

class _ChangenewPasswordState extends State<ChangenewPassword> {
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
                ],
              ),
              const MainBar(
                text: "Change New Password",
              ),
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ChangenewPasswordForm(),
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
