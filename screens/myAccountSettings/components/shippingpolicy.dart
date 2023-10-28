import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/webviewscreenshow.dart';

class ShippingPolicy extends StatefulWidget {
  const ShippingPolicy({super.key});

  @override
  State<ShippingPolicy> createState() => _ShippingPolicyState();
}

class _ShippingPolicyState extends State<ShippingPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Text(Languages.of(context)!.shippingpolicy,
              style: AppStyle.mytexttitle),
        ),
        body: WebViewScreensShow(url: ""));
  }
}
