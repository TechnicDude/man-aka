import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/webviewscreenshow.dart';

class TermsAndCondition extends StatefulWidget {
  final String url;
  final String title;
  const TermsAndCondition({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Text(widget.title, style: AppStyle.mytexttitle),
        ),
        body: WebViewScreensShow(url: widget.url));
  }
}
