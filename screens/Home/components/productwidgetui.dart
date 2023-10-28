import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getproductModel.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductlistcarduiScreenActivity extends StatelessWidget {
  final GetproductModelDatas getproduct;
  final Function? callback;
  const ProductlistcarduiScreenActivity({
    super.key,
    required this.getproduct,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: AppColors.backgroundshadow,
                    blurRadius: 10,
                    spreadRadius: 5),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100.w,
                  height: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        ApiUrl.root + '/' + getproduct.image!,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                TitleTextStyle(
                  text: getproduct.name!,
                  style: AppStyle.cardtitle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleTextStyle(
                      text:
                          "${AppHelper.language == "en" ? "\$" : "RD\$"}${getproduct.minRegularPrice.toString()} - ",
                      // fontSize: product.isSelected ? 14 : 12,

                      style: AppStyle.cardssubtitle,
                    ),
                    TitleTextStyle(
                      text:
                          "${AppHelper.language == "en" ? "\$" : "RD\$"}${getproduct.maxRegularPrice.toString()}",
                      style: AppStyle.cardssubtitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: 30.w,
                  child: ViewButtonWidget(
                    height: 3.h,
                    text: Languages.of(context)!.selectoption,
                    textcolor: AppColors.primarycolor,
                    boxcolor: Colors.transparent,
                    bordercolor: AppColors.primarycolor,
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ).ripple(() {
              Navigator.pushNamed(context, Routes.productDetails, arguments: {
                AppStringFile.productid: getproduct.id.toString(),
                AppStringFile.productname: getproduct.name.toString(),
                AppStringFile.productcategoryid:
                    getproduct.productCategoryId.toString()
              });
            }, borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          Positioned(
            top: 5,
            left: 5,
            right: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 10.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.ratingbackground),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.rating,
                        size: 2.2.h,
                      ),
                      TitleTextStyle(
                        text: getproduct.rating!.toString(),
                        style: AppStyle.cardssubtitle.copyWith(
                          fontSize: 14.sp,
                          color: AppColors.rating,
                        ),
                        // fontSize: product.isSelected ? 16 : 14,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    callback!("wishlist");
                    // wishlist(getproduct[index].id.toString());
                  },
                  child: Icon(
                    getproduct.wishlistStatus != 'false'
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: getproduct.wishlistStatus != 'false'
                        ? AppColors.red
                        : AppColors.red,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
