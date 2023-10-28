import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/model/getproductscategoriesModel.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductCardUi extends StatelessWidget {
  final ValueChanged<GetproductscategoriesModelDatas> onSelected;
  final GetproductscategoriesModelDatas model;
  const ProductCardUi({Key? key, required this.model, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Column(
            children: [
              Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: model.image != null
                      ? DecorationImage(
                          image: CachedNetworkImageProvider(
                            ApiUrl.root + '/' + model.image!,
                          ),
                          fit: BoxFit.fill)
                      : DecorationImage(
                          image: AssetImage(
                            AppImages.outro1,
                          ),
                          fit: BoxFit.fill),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xfff8f8f8),
                        blurRadius: 3,
                        spreadRadius: 3),
                  ],
                ),
              ),
              SizedBox(
                width: 30.w,
                child: TitleTextStyle(
                  text: model.name ?? '',
                  style: AppStyle.cardtitle,
                  maxline: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ).ripple(() {
            onSelected(model);
          }, borderRadius: BorderRadius.all(Radius.circular(20)));
  }
}
