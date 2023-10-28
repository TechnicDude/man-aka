import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/loginapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/mainbar.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerify extends StatefulWidget {
  final String email;
  const OtpVerify({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  bool isLoading = false;
  String _finalotp = '';
  String _error = '';
  TextEditingController otpController = TextEditingController();
  String error = "";

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  MainBar(text: Languages.of(context)!.otpverify),

                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormScreen(
                    hinttext: Languages.of(context)!.otpverify,
                    textEditingController: otpController,
                    validator: AppValidator.emptyValidator,
                    icon: Icons.password,
                  ),
                  // PinCodeTextField(
                  //   appContext: context,
                  //   length: 6,
                  //   obscureText: false,
                  //   cursorColor: AppColors.colorBlack,
                  //   animationType: AnimationType.fade,
                  //   pastedTextStyle: TextStyle(
                  //     color: AppColors.appPrimarycolor,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  //   pinTheme: PinTheme(
                  //       shape: PinCodeFieldShape.box,
                  //       disabledColor: AppColors.colorWhite,
                  //       borderRadius: BorderRadius.circular(1.h),
                  //       fieldHeight: 100.w / 8,
                  //       fieldWidth: 100.w / 8,
                  //       activeFillColor: AppColors.colorWhite,
                  //       inactiveColor: AppColors.colorGrey,
                  //       inactiveFillColor: AppColors.colorWhite,
                  //       selectedFillColor: AppColors.colorWhite,
                  //       selectedColor: AppColors.colorWhite,
                  //       activeColor: AppColors.colorWhite),
                  //   animationDuration: Duration(milliseconds: 300),
                  //   enableActiveFill: true,
                  //   onCompleted: (v) {
                  //     print("Completed");
                  //     _finalotp = v;
                  //     print(_finalotp);
                  //   },
                  //   onChanged: (value) {
                  //     print(value);
                  //     setState(() {
                  //       // currentText = value;
                  //     });
                  //   },
                  //   beforeTextPaste: (text) {
                  //     print("Allowing to paste $text");
                  //     return true;
                  //   },
                  // ),

                  SizedBox(
                    height: 4.h,
                  ),
                  // Center(
                  //   child: Text(
                  //     _error,
                  //     style: Style_File.subtitle
                  //         .copyWith(color: colorPrimary, fontSize: 15.sp),
                  //   ),
                  // ),
                  Center(
                    child: Text(
                      Languages.of(context)!.plzenterotpverify,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Center(
                    child: Text(
                      error,
                      style:
                          AppStyle.textcatsubtitle.copyWith(color: Colors.red),
                    ),
                  ),
                  ButtonWidget(
                      text: 'VERIFY',
                      onTap: () {
                        setState(() {
                          _error = '';
                        });

                        fetchdata();
                      }),
                  SizedBox(
                    height: 4.h,
                  ),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: Languages.of(context)!.otpnotrecive,
                        style: AppStyle.onbaordtitlesubtitle
                            .copyWith(color: Colors.grey, fontSize: 15.sp),
                        // style: Style_File.subtitle
                        //     .copyWith(color: colorGrey, fontSize: 15.sp),
                        children: <TextSpan>[
                          TextSpan(
                              text: Languages.of(context)!.resend,
                              style: AppStyle.onbaordtitlesubtitle.copyWith(
                                  color: Colors.black, fontSize: 15.sp),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //ForgetPassword();
                                }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
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

  Future<void> fetchdata() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (otpController.text.isNotEmpty) {
        if (otpController.text.length == 6) {
          // DialogHelper.showFlutterToast(strMsg: "Successful");
          // Navigator.pushNamed(context, Routes.changenewPassword);12345
          var body = {
            "email": widget.email,
            "code_verification": otpController.text,
          };
          LoginApi loginApi = LoginApi(body);
          final response = await loginApi.otpVerify();
          log(response.toString());
          if (response['status'].toString().toLowerCase() == "success") {
            DialogHelper.showFlutterToast(
                strMsg: Languages.of(context)!.loginsussces);

            AppHelper.AUTH_TOKEN_VALUE = response['access_token'];
            AppHelper.email_VALUE = response['user']['email'];
            AppHelper.userid = response['user']['id'].toString();

            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setString(
                AppStringFile.userid, response['user']['id'].toString());
            sharedPreferences.setString(
                AppStringFile.email, response['user']['email'].toString());

            sharedPreferences.setString(
                AppStringFile.authtoken, response['access_token'].toString());
            Navigator.pushNamed(
              context,
              Routes.bottomNav,
            );
            setState(() {
              isLoading = false;
            });
          } else {
            print(response);
            DialogHelper.showFlutterToast(strMsg: response['error'].toString());
            setState(() {
              error = response['error'].toString();
              isLoading = false;
            });
          }
          setState(() {
            isLoading = false;
          });
        } else {
          AppHelper().dialogBuilder(context, "", "Please enter vaild otp");
          setState(() {
            isLoading = false;
          });
        }
      } else {
        AppHelper().dialogBuilder(context, "", "Please enter otp");
        setState(() {
          isLoading = false;
        });
      }
    } else {
      AppHelper()
          .dialogBuilder(context, "", "Internet connection not available");
      setState(() {
        isLoading = false;
      });
    }
  }
}
