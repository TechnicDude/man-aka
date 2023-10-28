import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/loginapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatefulWidget {
  final Function callback;
  SignInForm({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowLoading = false;
  bool _obscureText = true;
  String error = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoading = false;
  bool valuedata = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   Languages.of(context)!.email,
          //   style: AppStyle.texttitle.copyWith(color: Colors.black),
          // ),
          TextFormScreen(
            textEditingController: emailController,
            hinttext: Languages.of(context)!.email,
            icon: Icons.email,
            validator: AppValidator.emailValidator,
          ),
          SizedBox(
            height: 2.h,
          ),
          // Text(
          //   Languages.of(context)!.password,
          //   style: AppStyle.texttitle.copyWith(color: Colors.black),
          // ),
          TextFormScreen(
            hinttext: Languages.of(context)!.password,
            icon: Icons.lock,
            textEditingController: passwordController,
            validator: AppValidator.passwordValidator,
            suffixIcon: true,
            obscure: _obscureText,
            onPressed: _toggle,
          ),
          SizedBox(
            height: 1.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.forgetPassword);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Languages.of(context)!.forgotpassword,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Text(
              error,
              style: AppStyle.textcatsubtitle.copyWith(color: Colors.red),
            ),
          ),

          ButtonWidget(
            text: Languages.of(context)!.login,
            onTap: () {
              if (isLoading) {
                return;
              }

              login(emailController.text, passwordController.text);
            },
          )
        ],
      ),
    );
  }

  login(email, password) async {
    setState(() {
      isLoading = true;
      widget.callback(true);
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = false;
          widget.callback(false);
        });
        var data = {
          "email": emailController.text.toString().trim(),
          "password": passwordController.text.toString().trim(),
        };
        LoginApi loginApi = LoginApi(data);
        final response = await loginApi.login();
        log(response.toString());
        if (response['status'].toString().toLowerCase() == "success") {
          AppHelper.AUTH_TOKEN_VALUE = response['access_token'];
          AppHelper.email_VALUE = response['user']['email'];
          AppHelper.userid = response['user']['id'].toString();
          AppHelper.name = response['user']['person']['name'].toString();
          AppHelper.lastname =
              response['user']['person']['last_name'].toString();
          AppHelper.role = response['user']['roles'][0]['id'].toString();

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString(
              AppStringFile.userid, response['user']['id'].toString());
          sharedPreferences.setString(
              AppStringFile.email, response['user']['email'].toString());
          sharedPreferences.setString(AppStringFile.name,
              response['user']['person']['name'].toString());
          sharedPreferences.setString(AppStringFile.lastname,
              response['user']['person']['last_name'].toString());
          sharedPreferences.setString(
              AppStringFile.authtoken, response['access_token'].toString());
          sharedPreferences.setString(AppStringFile.role,
              response['user']['roles'][0]['id'].toString());

          DialogHelper.showFlutterToast(
              strMsg: Languages.of(context)!.loginsussces);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.bottomNav,
            (Route<dynamic> route) => false,
            arguments: {AppStringFile.email: emailController.text},
          );
          setState(() {
            widget.callback(false);
            isLoading = false;
          });
        } else {
          DialogHelper.showFlutterToast(strMsg: response['error'].toString());
          setState(() {
            error = response['error'].toString();
            widget.callback(false);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
          widget.callback(false);
        });
      }
    } else {
      AppHelper()
          .dialogBuilder(context, "", "Internet connection not available");
      setState(() {
        isLoading = false;
        widget.callback(false);
      });
    }
  }
}
