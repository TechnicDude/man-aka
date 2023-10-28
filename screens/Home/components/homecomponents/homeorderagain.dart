import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/category.dart';

import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeOrderAgainScreen extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  const HomeOrderAgainScreen(
      {Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          model.image,
                        ))),
              ),
              TitleTextStyle(
                text: model.name,
                style: AppStyle.cardtitle,
                maxline: 2,
                textAlign: TextAlign.center,
                // fontSize: product.isSelected ? 16 : 14,
              ),
              Row(
                children: [
                  TitleTextStyle(
                    text: "\$459",
                    style: AppStyle.cardtitle.copyWith(
                        color: AppColors.primarycolor, fontSize: 14.sp),
                    maxline: 2,
                    textAlign: TextAlign.center,
                    // fontSize: product.isSelected ? 16 : 14,
                  ),
                  TitleTextStyle(
                    text: " MRP: \$456",
                    style: AppStyle.cardtitle.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.grey,
                        fontSize: 14.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
                // width: 10.w,
                child: ViewButtonWidget(
                  padding: EdgeInsets.all(6.0),
                  height: 3.h,
                  borderRadius: BorderRadius.all(Radius.circular(1.w)),
                  finalbuttextstyle: AppStyle.cardssubtitle.copyWith(
                      color: AppColors.colorWhite,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.productBuynow,
                    //     arguments: {
                    //       AppStringFile.productid:
                    //           productdetails.id.toString(),
                    //       AppStringFile.price:
                    //           productdetails.salePrice.toString(),
                    //       AppStringFile.productname: productdetails.name!,
                    //       AppStringFile.unity: productdetails.unittype,
                    //       AppStringFile.quantity:
                    //           productdetails.unitvalue.toString(),
                    //     });
                  },
                  textcolor: AppColors.colorWhite,
                  boxcolor: AppColors.primarycolor,
                  bordercolor: AppColors.primarycolor,
                  text: Languages.of(context)!.buy,
                ),
              )
            ],
          ).ripple(() {
            onSelected(model);
          }, borderRadius: BorderRadius.all(Radius.circular(1.w)));
  }
}
