// ignore_for_file:

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/loginapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordForm extends StatefulWidget {
  final Function? callback;
  const ForgetPasswordForm({
    super.key,
    this.callback,
  });

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = new TextEditingController();

  bool isShowLoading = false;
  bool _obscureText = true;
  String _error = '';

  bool isLoading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
              Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 3.h),
                child: TextFormScreen(
                  textEditingController: _emailcontroller,
                  hinttext: Languages.of(context)!.email,
                  icon: Icons.email,
                  validator: AppValidator.emailValidator,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: Text(
                  _error,
                  style: AppStyle.textcatsubtitle.copyWith(color: Colors.red),
                ),
              ),
              ButtonWidget(
                text: Languages.of(context)!.sendrequest,
                onTap: () {
                  setState(() {
                    _error = '';
                  });
                  if (isLoading) {
                    return;
                  }

                  forgotPassword(_emailcontroller.text);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  forgotPassword(String email) async {
    setState(() {
      isLoading = true;
      widget.callback!(true);
    });
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        var data = {
          "email": _emailcontroller.text.toString().trim(),
        };
        print(data);
        LoginApi loginApi = LoginApi(data);
        final response = await loginApi.forgetpassword();
        if (response['status'].toString().toLowerCase() == "success") {
          AppHelper().dialogBuilderforget(context, "Check Your Email",
              "Please check the email address ${email} for instructions to reset your password.");
          setState(() {
            isLoading = false;
            widget.callback!(false);
          });
        } else {
          DialogHelper.showFlutterToast(strMsg: response['error'].toString());
          setState(() {
            _error = response['error'].toString();
            widget.callback!(false);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
          widget.callback!(false);
        });
      }
    }
  }
}
