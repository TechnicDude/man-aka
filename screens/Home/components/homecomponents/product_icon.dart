import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/category.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductIcon extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  const ProductIcon({Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            width: 35.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(3.w),
                )),
            child: Column(
              children: <Widget>[
                // SizedBox(height: product.isSelected ? 15 : 0),
                Container(
                  width: 35.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3.w),
                        topLeft: Radius.circular(3.w),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            model.image,
                          ))),
                ),
                SizedBox(height: 1.h),
                TitleTextStyle(
                  text: model.name,
                  style: AppStyle.cardtitle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 17.sp),
                  // fontSize: product.isSelected ? 16 : 14,
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextStyle(
                        text: Languages.of(context)!.bid,
                        style: AppStyle.cardssubtitle.copyWith(fontSize: 14.sp),
                        // fontSize: product.isSelected ? 16 : 14,
                      ),
                      TitleTextStyle(
                        text: "2",
                        style: AppStyle.cardssubtitle,
                        // fontSize: product.isSelected ? 14 : 12,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextStyle(
                        text: Languages.of(context)!.quantity,
                        style: AppStyle.cardssubtitle.copyWith(fontSize: 14.sp),
                        // fontSize: product.isSelected ? 16 : 14,
                      ),
                      TitleTextStyle(
                        text: "200",
                        style: AppStyle.cardssubtitle,
                        // fontSize: product.isSelected ? 14 : 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).ripple(() {
            onSelected(model);
          }, borderRadius: BorderRadius.all(Radius.circular(20)));
  }
}
