import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/likeapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/banner_model.dart';
import 'package:manaqa_app/model/data.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/bestproductselling.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/homeorderagain.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/sellerproductlist.dart';
import 'package:manaqa_app/themes/light_color.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/screens/Home/components/productwidgetui.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/utils/widgets/product_card.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/product_card_ui.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/product_icon.dart';
import 'package:manaqa_app/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../provider/homeprovider.dart';

class MyHomePage extends StatefulWidget {
  final Function callback;
  MyHomePage({
    Key? key,
    this.title,
    required this.callback,
  }) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  DashBoradProvider _dashBoradProvider = DashBoradProvider();

  @override
  void initState() {
    // TODO: implement initState
    log(AppHelper.language.toString());
    log(AppHelper.role.toString());
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);

    fetchdata();
    super.initState();
  }

  fetchdata() async {
    await _dashBoradProvider.profileuserlist();
    await _dashBoradProvider.bannerlist();

    await _dashBoradProvider.bestsellingproductlist();
    await _dashBoradProvider.getproductcategorieslist();
    if (AppHelper.role == "2") {
      await _dashBoradProvider.getsellerproductlist();
    }
  }

  Widget _appBar(DashBoradProvider _dashBoradProvider) {
    return Container(
      color: AppColors.colorWhite,
      padding: AppTheme.padding,
      child: Row(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 4,
            child: _icon(Icons.sort, color: Colors.white).ripple(() {
              widget.callback("okopen");
            }),
          ),
          TitleTextStyle(
            text: AppHelper.person!.person!.name ?? '',
            style: AppStyle.textsubtitle.copyWith(color: Colors.black),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.globalSearch);
            },
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.biddingForm);
            },
            icon: const Icon(Icons.add_box_rounded),
            color: AppColors.colorBlack,
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(0.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1.h)),
        color: AppColors.primarycolor,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _categoryWidget(DashBoradProvider dashBoradProvider) {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: 10),
        width: AppTheme.fullWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleTextStyle(
                    text: Languages.of(context)!.categories,
                    style: AppStyle.texttitlemain,
                  ),
                ],
              ),
            ),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: .65 / .9,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1),
                itemCount: dashBoradProvider.getproductcategories.length < 16
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
                              AppStringFile.subcategoriesid: dashBoradProvider
                                  .getproductcategories[index].id
                                  .toString(),
                              AppStringFile.subcategoriesname: dashBoradProvider
                                  .getproductcategories[index].name
                                  .toString()
                            });
                      },
                    ),
                  );
                }),
          ],
        ));
  }

  Future wishlist(String wishlistid) async {
    var body = {"product_id": wishlistid};
    LikeApi _likeapi = LikeApi(body);
    final response = await _likeapi.disfav();
    fetchdata();
    DialogHelper.showFlutterToast(strMsg: response['message']);
  }

  int _index = 0;

  Widget _productWidget() {
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
              text: Languages.of(context)!.currentruningbids,
              style: AppStyle.texttitlemain,
            ),
          ),
          SizedBox(
            height: 35.h,
            child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AppData.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductIcon(
                      model: AppData.categoryList[index],
                      onSelected: (model) {
                        Navigator.pushNamed(context, Routes.mybidding);
                        setState(() {
                          AppData.categoryList.forEach((item) {
                            item.isSelected = false;
                          });
                          model.isSelected = true;
                        });
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  Widget _orderagain() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextStyle(
            text: Languages.of(context)!.orderagain,
            style: AppStyle.texttitlemain,
          ),
          SizedBox(
            height: 25.h,
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: HomeOrderAgainScreen(
                      model: AppData.categoryList[index],
                      onSelected: (model) {
                        Navigator.pushNamed(context, Routes.mybidding);
                        setState(() {
                          AppData.categoryList.forEach((item) {
                            item.isSelected = false;
                          });
                          model.isSelected = true;
                        });
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _bestsellingproductagain(
      List<BestSellingProducts> bestSellingProductsdata) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextStyle(
            text: Languages.of(context)!.bestsellingproducts,
            style: AppStyle.texttitlemain,
          ),
          SizedBox(
            height: 33.h,
            child: ListView.builder(
                itemCount: bestSellingProductsdata.length < 10
                    ? bestSellingProductsdata.length
                    : 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                      width: 40.w,
                      child: HomeBestProductSellingScreen(
                        model: bestSellingProductsdata[index],
                        callback: (value) {
                          if (value == "wishlist") {
                            wishlist(
                                bestSellingProductsdata[index].id.toString());
                          }
                        },
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _banner(List<String> bannerdata) {
    return CarouselSlider.builder(
      itemCount: bannerdata.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return InkWell(
          onTap: () {},
          child: CachedNetworkImage(
            imageUrl: ApiUrl.root + '/' + bannerdata[itemIndex],
            width: 100.w,
            fit: BoxFit.cover,
            placeholder: (context, url) => LoaderScreen(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: false,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // _appBar(),

            Container(
              color: AppColors.colorWhite,
              padding: AppTheme.padding,
              child: Row(
                children: <Widget>[
                  RotatedBox(
                    quarterTurns: 4,
                    child: _icon(Icons.sort, color: Colors.white).ripple(() {
                      widget.callback("okopen");
                    }),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Row(
                    children: [
                      Text(
                        "Hi,",
                        style: AppStyle.texttitlemain
                            .copyWith(color: AppColors.primarycolor),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      if (_dashBoradProvider.profilefetch)
                        if (AppHelper.person != null)
                          TitleTextStyle(
                            text: '${AppHelper.person!.person!.name}',
                            style: AppStyle.texttitlemain
                                .copyWith(color: Colors.black),
                          ),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.globalSearch);
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  IconButton(
                    onPressed: () {
                      if (AppHelper.role != AppStringFile.roleseller) {
                        Navigator.pushNamed(context, Routes.biddingForm);
                      } else {
                        Navigator.pushNamed(
                            context, Routes.sellerproductaddform);
                      }
                    },
                    icon: const Icon(Icons.add_box_rounded),
                    color: AppColors.colorBlack,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.notificationScreen);
                    },
                    child: Icon(
                      Icons.notification_add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    //  _banner(),
                    if (dashBoradProvider.bannerfetch)
                      if (dashBoradProvider.bannerList.isNotEmpty)
                        _banner(dashBoradProvider.bannerList),
                    _orderagain(),

                    if (dashBoradProvider.getproductcategorieslistfetch)
                      if (dashBoradProvider.getproductcategories.isNotEmpty)
                        _categoryWidget(dashBoradProvider),

                    if (dashBoradProvider.bestsellingproductfetch)
                      if (dashBoradProvider.bestSellingProductsList.isNotEmpty)
                        _bestsellingproductagain(
                          dashBoradProvider.bestSellingProductsList,
                        ),

                    _productWidget(),
                    if (dashBoradProvider.getsellerproductlistfetch)
                      if (dashBoradProvider.getsellerproduct.isNotEmpty)
                        SellerProductListScreenActivity(
                            getsellerproductlist:
                                dashBoradProvider.getsellerproduct),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
