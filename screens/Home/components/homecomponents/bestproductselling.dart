import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/banner_model.dart';
import 'package:manaqa_app/model/category.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeBestProductSellingScreen extends StatelessWidget {
  //final ValueChanged<BestSellingProducts> onSelected;
  final BestSellingProducts model;
  final Function? callback;
  const HomeBestProductSellingScreen({
    Key? key,
    this.callback,
    required this.model,
    //  required this.onSelected
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
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
                              ApiUrl.imageurl + (model.image!),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TitleTextStyle(
                        text: model.name!,
                        style: AppStyle.cardtitle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleTextStyle(
                            text:
                                "${AppHelper.language == "en" ? "\$" : "RD\$"}${model.minRegularPrice.toString()} - ",
                            // fontSize: product.isSelected ? 14 : 12,

                            style: AppStyle.cardssubtitle,
                          ),
                          TitleTextStyle(
                            text:
                                "${AppHelper.language == "en" ? "\$" : "RD\$"}${model.maxRegularPrice.toString()}",
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
                          height: 3.2.h,
                          text: Languages.of(context)!.buy,
                          textcolor: AppColors.colorWhite,
                          boxcolor: AppColors.primarycolor,
                          bordercolor: AppColors.primarycolor,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ).ripple(() {
                    Navigator.pushNamed(context, Routes.productDetails,
                        arguments: {
                          AppStringFile.productid: model.id.toString(),
                          AppStringFile.productname: model.name.toString(),
                          AppStringFile.productcategoryid:
                              model.productCategoryId.toString()
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
                              text: model.rating!.toString(),
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
                        },
                        child: Icon(
                          model.wishlistStatus != 'false'
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: model.wishlistStatus != 'false'
                              ? AppColors.red
                              : AppColors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

            // Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //       Container(
            //         height: 30.w,
            //         width: 25.w,
            //         decoration: BoxDecoration(
            //             shape: BoxShape.rectangle,
            //             borderRadius: BorderRadius.circular(1.h),
            //             color: AppColors.colorGrey,
            //             image: model.image.toString() != "null"
            //                 ? DecorationImage(
            //                     image: NetworkImage(
            //                       ApiUrl.imageurl + (model.image!),
            //                     ),
            //                     fit: BoxFit.fill)
            //                 : DecorationImage(
            //                     image: AssetImage(AppImages.outro2),
            //                     fit: BoxFit.fill),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: AppColors.colorGrey,
            //                 blurRadius: 2,
            //               ),
            //             ]),
            //       ),
            //       SizedBox(
            //         height: 1.h,
            //       ),
            //       TitleTextStyle(
            //         text: model.name!,
            //         style: AppStyle.cardtitle.copyWith(fontSize: 15.sp),
            //         maxline: 2,
            //         textAlign: TextAlign.center,
            //         // fontSize: product.isSelected ? 16 : 14,
            //       ),
            //       SizedBox(
            //         height: 0.6.h,
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           TitleTextStyle(
            //             text: "\$${model.salePrice.toString()}",

            //             style: AppStyle.cardtitle.copyWith(
            //                 color: AppColors.primarycolor, fontSize: 14.sp),
            //             maxline: 2,
            //             textAlign: TextAlign.center,
            //             // fontSize: product.isSelected ? 16 : 14,
            //           ),
            //           SizedBox(
            //             width: 0.3.w,
            //           ),
            //           TitleTextStyle(
            //             text: "${model.regularPrice.toString()}",
            //             style: AppStyle.cardtitle.copyWith(
            //                 decoration: TextDecoration.lineThrough,
            //                 color: AppColors.grey,
            //                 fontSize: 14.sp),
            //           ),
            //         ],
            //       ),
            //     ],
            //   )

            .ripple(() {
            Navigator.pushNamed(context, Routes.productDetails, arguments: {
              AppStringFile.productid: model.id.toString(),
              AppStringFile.productname: model.name.toString(),
              AppStringFile.productcategoryid:
                  model.productCategoryId.toString()
            });

            //onSelected(model);
          }, borderRadius: BorderRadius.all(Radius.circular(2.h)));
  }
}
