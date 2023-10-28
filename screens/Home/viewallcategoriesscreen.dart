import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getproductscategoriesModel.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/product_card_ui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewAllCategorieScreenActivity extends StatelessWidget {
  List<GetproductscategoriesModelDatas> getproductscategoriesModelDatas;
  ViewAllCategorieScreenActivity({
    super.key,
    required this.getproductscategoriesModelDatas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            _appBar(context),
            _categoryWidget(getproductscategoriesModelDatas, context),
          ],
        ),
      )),
    );
  }

  Widget _icon(
    IconData icon,
    BuildContext context, {
    Color color = AppColors.iconColor,
    double size = 20,
    double padding = 10,
    bool isOutLine = false,
    Function? onPressed,
  }) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _appBar(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            context,
            color: Colors.black54,
            size: 15,
            padding: 12,
            isOutLine: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            width: 100.w - 100,
            child: Center(
              child: TitleTextStyle(
                text: Languages.of(context)!.categories,
                style: AppStyle.texttitlemain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryWidget(
      List<GetproductscategoriesModelDatas> getproductscategoriesModelDatas,
      BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemCount: getproductscategoriesModelDatas.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductCardUi(
              model: getproductscategoriesModelDatas[index],
              onSelected: (model) {
                Navigator.pushNamed(context, Routes.productsubcategories,
                    arguments: {
                      AppStringFile.subcategoriesid:
                          getproductscategoriesModelDatas[index].id.toString(),
                      AppStringFile.subcategoriesname:
                          getproductscategoriesModelDatas[index].name.toString()
                    });
              },
            ),
          );
        });
  }
}
