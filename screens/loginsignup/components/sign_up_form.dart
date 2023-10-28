// ignore_for_file:

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/loginapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  final Function? callback;
  const SignUpForm({
    super.key,
    this.callback,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirepasswordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  String error = "";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(Languages.of(context)!.rolemessage), value: ""),
      DropdownMenuItem(
          child: Text(Languages.of(context)!.customers), value: "3"),
      DropdownMenuItem(child: Text(Languages.of(context)!.sellers), value: "2"),
    ];
    return menuItems;
  }

  bool isLoading = false;
  bool isShowLoading = false;

  bool _obscureText = true;
  bool _obscureTexts = true;
  bool valuedata = false;
  String? selectedValue = "";
  final _dropdownFormKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggles() {
    setState(() {
      _obscureTexts = !_obscureTexts;
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
              // Text(
              //   Languages.of(context)!.firstname,
              //   style: AppStyle.texttitle.copyWith(color: Colors.black),
              // ),
              TextFormScreen(
                hinttext: Languages.of(context)!.firstname,
                icon: Icons.account_circle,
                textEditingController: firstnameController,
                validator: AppValidator.nameValidator,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // Text(
              //   Languages.of(context)!.lastname,
              //   style: AppStyle.texttitle.copyWith(color: Colors.black),
              // ),
              TextFormScreen(
                hinttext: Languages.of(context)!.lastname,
                icon: Icons.account_circle,
                textEditingController: lastnameController,
                validator: AppValidator.lastnameValidator,
              ),
              SizedBox(
                height: 1.5.h,
              ),
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
                height: 1.5.h,
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
              Text(
                "(Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character)",
                style: AppStyle.textcatsubtitle.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 1.h,
              ),
              // Text(
              //   Languages.of(context)!.confirmpassword,
              //   style: AppStyle.texttitle.copyWith(color: Colors.black),
              // ),
              TextFormScreen(
                hinttext: Languages.of(context)!.confirmpassword,
                textEditingController: confirepasswordController,
                validator: AppValidator.passwordValidator,
                obscure: _obscureTexts,
                onPressed: _toggles,
                icon: Icons.lock,
                suffixIcon: true,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // Text(
              //   Languages.of(context)!.mobile,
              //   style: AppStyle.texttitle.copyWith(color: Colors.black),
              // ),
              TextFormScreen(
                hinttext: Languages.of(context)!.mobile,
                icon: Icons.phone_android_rounded,
                textEditingController: mobileController,
                validator: AppValidator.mobileValidator,
              ),
              SizedBox(
                height: 1.h,
              ),
              // Text(
              //   Languages.of(context)!.role,
              //   style: AppStyle.texttitle.copyWith(color: Colors.black),
              // ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.w),
                        )),
                    // fillColor: ,
                  ),
                  validator: (value) =>
                      value == null ? "Select a country" : null,
                  // dropdownColor: Colors.blueAccent,
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                      print(selectedValue);
                    });
                  },
                  items: dropdownItems),

              Row(
                children: [
                  Checkbox(
                    value: this.valuedata,
                    onChanged: (value) {
                      setState(() {
                        this.valuedata = value!;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.termscondition);
                    },
                    child: Row(
                      children: [
                        Text(
                          Languages.of(context)!.iacceptthe,
                          style: AppStyle.textcatsubtitle
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          Languages.of(context)!.termsandcondition,
                          style: AppStyle.textcatsubtitle
                              .copyWith(color: AppColors.primarycolor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  error,
                  style: AppStyle.textcatsubtitle.copyWith(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              ButtonWidget(
                text: Languages.of(context)!.next,
                onTap: () {
                  if (isLoading) {
                    return;
                  }
                  setState(() {
                    error = "";
                  });

                  signup(
                    firstnameController.text,
                    lastnameController.text,
                    emailController.text,
                    passwordController.text,
                    mobileController.text,
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  signup(firatname, lastname, email, password, mobile) async {
    setState(() {
      widget.callback!(true);
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (selectedValue != "") {
          if (valuedata) {
            if (confirepasswordController.text == passwordController.text) {
              var data = {
                "email": emailController.text.toString().trim(),
                "password": passwordController.text.toString().trim(),
                "name": firstnameController.text.toString().trim(),
                "last_name": lastnameController.text.toString().trim(),
                "address": "",
                "country_code": "",
                "phone": mobileController.text,
                "image": "",
                "role_id": selectedValue,
              };
              LoginApi loginApi = LoginApi(data);
              final response = await loginApi.register();

              if (response['status'].toString().toLowerCase() == "success") {
                DialogHelper.showFlutterToast(
                    strMsg: Languages.of(context)!.labelWelcome);
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                AppHelper.role = selectedValue.toString();
                sharedPreferences.setString(
                    AppStringFile.role, selectedValue.toString());
                Navigator.pushNamed(context, Routes.otpVerify,
                    arguments: {AppStringFile.email: emailController.text});
                setState(() {
                  widget.callback!(false);
                  isLoading = false;
                });
              } else {
                DialogHelper.showFlutterToast(
                    strMsg: response['error'].toString());
                setState(() {
                  error = response['error'].toString();
                  widget.callback!(false);
                  isLoading = false;
                });
              }
            } else {
              AppHelper().dialogBuilder(context, Languages.of(context)!.alter,
                  Languages.of(context)!.pleaseaccettermesandcondtions);
              setState(() {
                widget.callback!(false);
                isLoading = false;
              });
            }
          } else {
            AppHelper().dialogBuilder(context, Languages.of(context)!.alter,
                Languages.of(context)!.pleaseaccettermesandcondtions);
            setState(() {
              widget.callback!(false);
              isLoading = false;
            });
          }
        } else {
          AppHelper().dialogBuilder(context, Languages.of(context)!.alter,
              Languages.of(context)!.rolemessage);
          setState(() {
            widget.callback!(false);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          widget.callback!(false);
          isLoading = false;
        });
      }
    } else {
      AppHelper()
          .dialogBuilder(context, "", "Internet connection not available");
      setState(() {
        widget.callback!(false);
        isLoading = false;
      });
    }
  }
}
