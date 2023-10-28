import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductBuyForm extends StatefulWidget {
  final String name;
  final String id;
  final String price;
  final String quantity;
  final String unity;
  const ProductBuyForm({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.unity,
  });

  @override
  State<ProductBuyForm> createState() => _ProductBuyFormState();
}

class _ProductBuyFormState extends State<ProductBuyForm> {
  bool isLoading = false;
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  String priceproduct = "";
  @override
  void initState() {
    // TODO: implement initState
    fetdata();
    super.initState();
  }

  fetdata() {
    if (widget.quantity != "") {
      quantityController.text = widget.quantity;
    }
    if (widget.price != "") {
      setState(() {
        priceproduct = widget.price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Languages.of(context)!.buy,
                      style: AppStyle.texttitle.copyWith(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                // Text(
                //   Languages.of(context)!.productname,
                //   style: AppStyle.texttitle.copyWith(color: Colors.black),
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                TitleTextStyle(
                  text: Languages.of(context)!.productname,
                  style: AppStyle.cardtitle,
                ),
                Text(
                  widget.name,
                  style: AppStyle.texttitle
                      .copyWith(color: AppColors.primarycolor),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TitleTextStyle(
                  text: Languages.of(context)!.price,
                  style: AppStyle.cardtitle,
                ),
                Text(
                  "\$ $priceproduct ${widget.unity}",
                  style: AppStyle.texttitle
                      .copyWith(color: AppColors.primarycolor),
                ),
                // Text(
                //   Languages.of(context)!.price,
                //   style: AppStyle.texttitle.copyWith(color: Colors.black),
                // ),

                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "Quantity",
                  style: AppStyle.texttitle.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextFormScreen(
                  onChanged: (value) {
                    if (widget.price != "") {
                      if (quantityController.text.isNotEmpty) {
                        double price = double.parse(widget.price);
                        int quantityget = int.parse(widget.quantity);

                        int quantity = int.parse(quantityController.text);

                        double perproductprice = price / quantityget;

                        double totalprice = perproductprice * quantity;
                        setState(() {
                          priceproduct =
                              totalprice.toStringAsFixed(2).toString();
                        });
                        print(priceproduct);
                      }
                    }
                  },
                  hinttext: 'Quantity',
                  icon: Icons.apps,
                  textEditingController: quantityController,
                  validator: AppValidator.lastnameValidator,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  Languages.of(context)!.address,
                  style: AppStyle.texttitle.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextFormScreen(
                  textEditingController: addressController,
                  hinttext: Languages.of(context)!.address,
                  icon: Icons.home,
                  validator: AppValidator.emailValidator,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  Languages.of(context)!.pincode,
                  style: AppStyle.texttitle.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextFormScreen(
                  textEditingController: pincodeController,
                  hinttext: Languages.of(context)!.pincode,
                  icon: Icons.home,
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
