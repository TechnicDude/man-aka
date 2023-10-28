import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangenewPasswordForm extends StatefulWidget {
  const ChangenewPasswordForm({super.key});

  @override
  State<ChangenewPasswordForm> createState() => _ChangenewPasswordFormState();
}

class _ChangenewPasswordFormState extends State<ChangenewPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  bool _obscureText = true;
  bool _obscureText1 = true;

  String _error = '';

  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewpasswordController = TextEditingController();

  bool isShowLoading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),

                TextFormScreen(
                  textEditingController: newpasswordController,
                  hinttext: "New Password",
                  suffixIcon: true,
                  icon: Icons.lock,
                  obscure: _obscureText,
                  onPressed: _toggle,
                  validator: AppValidator.passwordValidator,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  textEditingController: confirmnewpasswordController,
                  hinttext: "Confirm New Password",
                  suffixIcon: true,
                  icon: Icons.lock,
                  obscure: _obscureText1,
                  onPressed: _toggle1,
                  validator: AppValidator.confirm_passwordValidator,
                ),
                SizedBox(
                  height: 5.h,
                ),
                // Text(
                //   _error,
                //   style: Style_File.subtitle
                //       .copyWith(color: Colors.red, fontSize: 15.sp),
                // ),

                SizedBox(
                  height: 3.h,
                ),

                !isLoading
                    ? ButtonWidget(
                        text: 'Change new password',
                        onTap: () {
                          setState(() {
                            _error = '';
                          });
                          if (isLoading) {
                            return;
                          }

                          resetPassword(newpasswordController.text,
                              confirmnewpasswordController.text);
                        },
                      )
                    : ButtonWidgetLoader(),
              ],
            )),
      ],
    );
  }

  resetPassword(String newpassword, String confirmpassword) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          DialogHelper.showFlutterToast(
              strMsg: "New Password update successfully!!");
          Navigator.pushNamed(context, Routes.loginScreen);
        } else {
          DialogHelper.showFlutterToast(
              strMsg: "The password and confirm password must be match.");
        }
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
