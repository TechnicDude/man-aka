import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/homeprovider.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/product_card_ui.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyCategorylistScreenActivity extends StatefulWidget {
  const MyCategorylistScreenActivity({super.key});

  @override
  State<MyCategorylistScreenActivity> createState() =>
      _MyCategorylistScreenActivityState();
}

class _MyCategorylistScreenActivityState
    extends State<MyCategorylistScreenActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();
  @override
  void initState() {
    // TODO: implement initState
    log(AppHelper.language.toString());
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);

    fetchdata();
    super.initState();
  }

  fetchdata() async {
    await _dashBoradProvider.getproductcategorieslist();
  }

  Widget _appBar(BuildContext context) {
    return Container(
      //  backgroundColor: Colors.white.withOpacity(0.95),
      color: Colors.white.withOpacity(0.95),
      padding: AppTheme.padding,
      child: Row(
        children: <Widget>[
          // _icon(
          //   Icons.arrow_back_ios,
          //   context,
          //   color: Colors.black,
          //   size: 15,
          //   padding: 12,
          //   isOutLine: true,
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //   },
          // ),
          SizedBox(
            width: 100.w - 100,
            child: Center(
              child: TitleTextStyle(
                text: Languages.of(context)!.categoriesonly,
                style: AppStyle.texttitlemain.copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
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
      decoration: BoxDecoration(
        border: Border.all(
            color: AppColors.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
      ),
      child: Icon(icon, color: color, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _categoryWidget(DashBoradProvider dashBoradProvider) {
    return Container(
        width: AppTheme.fullWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 100,
              child: Center(
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: .9 / 1,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1),
                    itemCount:
                        dashBoradProvider.getproductcategories.length < 16
                            ? dashBoradProvider.getproductcategories.length
                            : 16,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductCardUi(
                          model: dashBoradProvider.getproductcategories[index],
                          onSelected: (model) {
                            Navigator.pushNamed(
                                context, Routes.productsubcategories,
                                arguments: {
                                  AppStringFile.subcategoriesid:
                                      dashBoradProvider
                                          .getproductcategories[index].id
                                          .toString(),
                                  AppStringFile.subcategoriesname:
                                      dashBoradProvider
                                          .getproductcategories[index].name
                                          .toString()
                                });
                          },
                        ),
                      );
                    }),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white.withOpacity(0.95),
            title: AppBarScreens(
              text: Languages.of(context)!.category,
            )),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //   _appBar(context),
                // _search(),

                if (dashBoradProvider.getproductcategorieslistfetch)
                  if (dashBoradProvider.getproductcategories.isNotEmpty)
                    _categoryWidget(dashBoradProvider),
              ],
            ),
          ),
        ),
      );
    });
  }
}
