import 'package:flutter/material.dart';

import 'package:manaqa_app/model/product.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/utils/widgets/title_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;
  const ProductCard({Key? key, required this.product, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  product.isliked ? Icons.favorite : Icons.favorite_border,
                  color: product.isliked ? AppColors.red : AppColors.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: product.isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.orange.withAlpha(40),
                      ),
                      Image.asset(product.image)
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleTextStyle(
                  text: product.name,
                  style: AppStyle.cardtitle,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleTextStyle(
                      text: "Total Provider",
                      style: AppStyle.cardsubtitle,
                    ),
                    TitleTextStyle(
                      text: product.totalcompany.toString(),
                      style: AppStyle.cardssubtitle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleTextStyle(
                      text: "Quotation",
                      style: AppStyle.cardsubtitle,
                    ),
                    TitleTextStyle(
                      text: ' \$ ${product.lowerquotes.toString()} ',
                      style: AppStyle.cardpricesubtitle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(product);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
