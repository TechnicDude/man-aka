import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getproductModel.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/seller/productcardui.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SellerProductListScreenActivity extends StatefulWidget {
  final List<GetproductModelDatas> getsellerproductlist;
  const SellerProductListScreenActivity({
    super.key,
    required this.getsellerproductlist,
  });

  @override
  State<SellerProductListScreenActivity> createState() =>
      _SellerProductListScreenActivityState();
}

class _SellerProductListScreenActivityState
    extends State<SellerProductListScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      // height: AppTheme.fullWidth(context) * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TitleTextStyle(
              text: Languages.of(context)!.myproductlist,
              style: AppStyle.texttitlemain,
            ),
          ),
          SizedBox(
            height: 30.h,
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.getsellerproductlist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductCardUIScreenActivity(
                    sellerproductdata: widget.getsellerproductlist[index],
                  );
                  // return Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ProductIcon(
                  //     model: AppData.categoryList[index],
                  //     onSelected: (model) {
                  //       Navigator.pushNamed(context, Routes.mybidding);
                  //       setState(() {
                  //         AppData.categoryList.forEach((item) {
                  //           item.isSelected = false;
                  //         });
                  //         model.isSelected = true;
                  //       });
                  //     },
                  //   ),
                  // );
                }),
          ),
        ],
      ),
    );
  }
}
