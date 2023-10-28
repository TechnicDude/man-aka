import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductBiddingForm extends StatefulWidget {
  const ProductBiddingForm({super.key});

  @override
  State<ProductBiddingForm> createState() => _ProductBiddingFormState();
}

class _ProductBiddingFormState extends State<ProductBiddingForm> {
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.95),
          title: AppBarScreens(
            text: "Bidding Form",
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 2.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Bidding Form",
                //       style: AppStyle.texttitle.copyWith(color: Colors.black),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Product Name",
                  style: AppStyle.texttitle.copyWith(color: Colors.black),
                ),
                TextFormScreen(
                  hinttext: 'enter product name',
                  icon: Icons.account_circle,
                  textEditingController: firstnameController,
                  validator: AppValidator.nameValidator,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "Quantity",
                  style: AppStyle.texttitle.copyWith(color: Colors.black),
                ),
                TextFormScreen(
                  hinttext: 'Quantity',
                  icon: Icons.apps,
                  textEditingController: lastnameController,
                  validator: AppValidator.lastnameValidator,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "Description",
                  style: AppStyle.texttitle.copyWith(color: Colors.black),
                ),
                TextFormScreen(
                  textEditingController: emailController,
                  hinttext: "Description",
                  icon: Icons.deblur,
                  validator: AppValidator.emailValidator,
                ),
                SizedBox(
                  height: 4.h,
                ),
                !isLoading
                    ? ButtonWidget(
                        text: "Submit Bid",
                        onTap: () {},
                      )
                    : ButtonWidgetLoader(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
