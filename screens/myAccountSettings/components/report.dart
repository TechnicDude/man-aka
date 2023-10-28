import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';

import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:manaqa_app/utils/webviewscreenshow.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Feedbacks extends StatefulWidget {
  const Feedbacks({super.key});

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: AppBarScreens(
            text: Languages.of(context)!.report,
          )),
      body: Padding(
          padding: EdgeInsets.only(
            left: 1.5.h,
            right: 1.5.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormScreen(
                          hinttext: Languages.of(context)!.name,
                          icon: Icons.account_circle,
                          textEditingController: firstnameController,
                          validator: AppValidator.nameValidator,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormScreen(
                          hinttext: Languages.of(context)!.email,
                          icon: Icons.mail,
                          textEditingController: emailController,
                          validator: AppValidator.emailValidator,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormScreen(
                          hinttext: Languages.of(context)!.title,
                          icon: Icons.text_fields_rounded,
                          textEditingController: lastnameController,
                          validator: AppValidator.lastnameValidator,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              Languages.of(context)!.enterdescription,
                              style: AppStyle.textsubtitle
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 8,
                          maxLength: 1000,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 2.h,
                ),
                ButtonWidget(
                  text: Languages.of(context)!.submit,
                  onTap: () {
                    if (isLoading) {
                      return;
                    }

                    // feedbacksubit();
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          )),
    );
  }
}
