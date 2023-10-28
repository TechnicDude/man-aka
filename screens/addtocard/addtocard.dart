import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getaddtocartlistmodel.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/addtocardProvider.dart';
import 'package:manaqa_app/screens/addtocard/components/addtocardui.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/checkoutcart.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/nodatafoundscreen.dart';
import 'package:manaqa_app/utils/nointernetconnection.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddToCardScreenActivity extends StatefulWidget {
  const AddToCardScreenActivity({super.key});

  @override
  State<AddToCardScreenActivity> createState() =>
      _AddToCardScreenActivityState();
}

class _AddToCardScreenActivityState extends State<AddToCardScreenActivity> {
  AddtoCardProductListProvider _productDetails = AddtoCardProductListProvider();
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    _productDetails =
        Provider.of<AddtoCardProductListProvider>(context, listen: false);
    fetchdata();
    _scrollController = ScrollController()..addListener(_loadMore);

    super.initState();
  }

  void _loadMore() async {
    if (_productDetails.hasfirst &&
        _productDetails.isFirstdatafound == false &&
        _productDetails.isLoadMoreRunning == false) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await _productDetails.loadMore();
      setState(() {
        _isLoading = false;
      });
    }
  }

  fetchdata() async {
    await _productDetails.getalladdtocardlists(1);
  }

  Widget _appBar() {
    return Container(
      color: AppColors.colorWhite,
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleTextStyle(
            text: Languages.of(context)!.addtocart,
            style: AppStyle.texttitlemain.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<InternetConnectionStatus>(context) ==
            InternetConnectionStatus.disconnected
        ? InternetNotAvailable()
        : Consumer<AddtoCardProductListProvider>(
            builder: (context, categoryprovider, child) {
            return Scaffold(
              bottomNavigationBar: categoryprovider.getaddtocardproductlistfetch
                  ? categoryprovider.getaddtocardproductlist.isNotEmpty
                      ? CheckoutCart(
                          text1:
                              "\$ ${categoryprovider.getsubcategoryproductmodel.totalAmount ?? ''}",
                          text2: Languages.of(context)!.checkout,
                          onTap: () {},
                        )
                      : SizedBox()
                  : SizedBox(),
              appBar: AppBar(
                  title: AppBarScreens(
                text: Languages.of(context)!.addtocart,
              )),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          if (!categoryprovider.getaddtocardproductlistfetch)
                            SizedBox(
                                width: 100.w,
                                height: 90.h,
                                child: Center(child: LoaderScreen())),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          if (categoryprovider.getaddtocardproductlistfetch)
                            if (categoryprovider
                                .getaddtocardproductlist.isNotEmpty)
                              _addtocardui(
                                  categoryprovider.getaddtocardproductlist),
                          if (categoryprovider.getaddtocardproductlistfetch)
                            if (categoryprovider
                                .getaddtocardproductlist.isEmpty)
                              NoDataFoundErrorScreens()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
  }

  Widget _addtocardui(List<GetaddtocartlistmodelDataData> listdata) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: listdata.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AddtoCardShowUiScreen(
              model: listdata[index],
              callback: (value) {
                log(value);
                if (value == "api") {
                  fetchdata();
                }
              },
              onSelected: (model) {
                // Navigator.pushNamed(context, Routes.subcategories, arguments: {
                //   AppStringFile.subCategoryId: model.subCategory,
                //   AppStringFile.subcategoriesname: model.name,
                // });
              });
        });
  }
}
