import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/data.dart';
import 'package:manaqa_app/model/product.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/themes/light_color.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/checkoutcart.dart';
import 'package:manaqa_app/utils/widgets/title_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  Widget _cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
              aspectRatio: 1.2,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 20.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              model.image,
                            ))),
                  ))),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: model.name,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: '\$ ',
                        color: LightColor.red,
                        fontSize: 12,
                      ),
                      TitleText(
                        text: model.price.toString(),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                      width: 20.w,
                      height: 4.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0.5.h)),
                        border:
                            Border.all(color: AppColors.colorGrey, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Qty: ${model.id}",
                            style: AppStyle.textsubsubtitle.copyWith(
                                color: AppColors.colorBlack, fontSize: 14.sp),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: AppColors.black,
                            size: 4.h,
                          )
                        ],
                      )
                      // TitleText(
                      //   text: 'Qty: ${model.id}',
                      //   fontSize: 12,
                      // ),

                      )))
        ],
      ),
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: '${AppData.cartList.length} Items',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: '\$${getPrice()}',
          fontSize: 18,
        ),
      ],
    );
  }

  // Widget _submitButton(BuildContext context) {
  //   return TextButton(
  //     onPressed: () {},
  //     style: ButtonStyle(
  //       shape: MaterialStateProperty.all(
  //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //       ),
  //       backgroundColor: MaterialStateProperty.all<Color>(LightColor.orange),
  //     ),
  //     child: Container(
  //       alignment: Alignment.center,
  //       padding: EdgeInsets.symmetric(vertical: 4),
  //       width: AppTheme.fullWidth(context) * .75,
  //       child: TitleText(
  //         text: 'CHeckou',
  //         color: LightColor.background,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //   );
  // }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CheckoutCart(
        text1: "\$ 1320.0",
        text2: "Place Order",
        //Languages.of(context)!.checkout,
        onTap: () {
          //  Navigator.pushNamed(context, Routes.checkoutScreen);
        },
      ),
      body: Container(
        padding: AppTheme.padding,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Total:  ",
                      style: AppStyle.textsubtitle.copyWith(
                          color: AppColors.colorGrey, fontSize: 16.sp)),
                  Text("\$1,320.0 ",
                      style: AppStyle.mytexttitle.copyWith(
                          color: AppColors.colorBlack, fontSize: 19.sp)),
                  Text("81% off",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorBlack,
                        fontSize: 16.sp,
                      )),
                ],
              ),

              Divider(
                color: Colors.grey.withOpacity(0.4),
                thickness: 1,
              ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Coupens",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorBlack,
                      )),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.close,
                    size: 2.5.h,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text("FT3VGHBKND34",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorGrey,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text("is applied",
                      style: AppStyle.textsubtitle.copyWith(
                        color: AppColors.colorGrey,
                      )),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    width: 60.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.w)),
                            borderSide: BorderSide(color: Colors.black)),
                        filled: true,
                        contentPadding:
                            EdgeInsets.only(bottom: 1.h, left: 1.h, right: 1.h),
                        labelText: "Enter Coupen",
                        labelStyle: AppStyle.textsubtitle.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 20.w,
                    child: Center(
                      child: Text("Apply",
                          style: AppStyle.textsubtitle.copyWith(
                            color: AppColors.colorWhite,
                          )),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.appPrimarycolor,
                      borderRadius: BorderRadius.all(Radius.circular(2.w)),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 2.h,
              ),
              _cartItems(),
              Divider(
                thickness: 1,
                height: 2.h,
              ),
              _price(),
              SizedBox(height: 3.h),

              // ButtonWidget(
              //   text: "Next",
              //   onTap: () {},
              // )

              // _submitButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
