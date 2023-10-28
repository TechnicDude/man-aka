import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RelatedProductScreen extends StatefulWidget {
  const RelatedProductScreen({super.key});

  @override
  State<RelatedProductScreen> createState() => _RelatedProductScreenState();
}

class _RelatedProductScreenState extends State<RelatedProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
          child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 1.h, bottom: 0.5.h, left: 1.h, right: 1.h),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppColors.backgroundshadow,
                              blurRadius: 10,
                              spreadRadius: 2),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Container(
                          //   width: 100.w,
                          //   height: 35.w,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(10),
                          //         topRight: Radius.circular(10)),
                          //     image: DecorationImage(
                          //       fit: BoxFit.fill,
                          //       image:AppImages.outro1
                          //       // NetworkImage(
                          //       //   ApiUrl.root + '/' + getproduct[index].image!,
                          //       // ),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            height: 10.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(1.h),
                              color: AppColors.colorGrey.withOpacity(0.3),
                            ),
                            child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 3.h,
                                backgroundImage: AssetImage(
                                  AppImages.loginimg,
                                )),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TitleTextStyle(
                            text: "Fashion pearl",
                            // getproduct[index].name!,
                            style: AppStyle.cardtitle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TitleTextStyle(
                                text: "\$500",
                                // "${AppHelper.language == "en" ? "\$" : "RD\$"}${getproduct[index].minregularprice.toString()} - ",
                                // fontSize: product.isSelected ? 14 : 12,

                                style: AppStyle.cardssubtitle,
                              ),
                              TitleTextStyle(
                                text: "\$600",
                                // "${AppHelper.language == "en" ? "\$" : "RD\$"}${getproduct[index].maxregularprice.toString()}",
                                // fontSize: product.isSelected ? 14 : 12,

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
                        // Navigator.of(context).pushNamed('/detail');
                        // onSelected(product);
                        Navigator.pushNamed(
                          context, Routes.productDetails,
                          // arguments: {
                          //   AppStringFile.productid:
                          //       getproduct[index].id.toString(),
                          //   AppStringFile.productname:
                          //       getproduct[index].name.toString(),
                          // }
                        );
                      }, borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
