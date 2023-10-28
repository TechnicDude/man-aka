import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/likeapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getproductModel.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/produtchProvider.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/searchbar.dart';
import 'package:manaqa_app/screens/Home/components/productwidgetui.dart';
import 'package:manaqa_app/themes/light_color.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/nodatafoundscreen.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductListScreenActivity extends StatefulWidget {
  final Function? callback;
  final String productid;
  final String productname;
  const ProductListScreenActivity({
    super.key,
    this.callback,
    required this.productid,
    required this.productname,
  });

  @override
  State<ProductListScreenActivity> createState() =>
      _ProductListScreenActivityState();
}

class _ProductListScreenActivityState extends State<ProductListScreenActivity> {
  ProductProvider _productSubcategoriesProvider = ProductProvider();
  ScrollController _scrollController = ScrollController();

  TextEditingController sercheditcontroler = new TextEditingController();
  String searchString = '';
  bool searchshow = false;
  bool _isLoading = false;
  bool isLiked = false;
  bool filter = false;
  String totalproduct = '0';

  @override
  void initState() {
    // TODO: implement initState
    _productSubcategoriesProvider =
        Provider.of<ProductProvider>(context, listen: false);
    fetchdata();
    _scrollController = ScrollController()..addListener(_loadMore);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMore();
    }
  }

  void _loadMore() async {
    if (_productSubcategoriesProvider.hasfirst &&
        _productSubcategoriesProvider.isFirstdatafound == false &&
        _productSubcategoriesProvider.isLoadMoreRunning == false) {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await _productSubcategoriesProvider.loadMore(widget.productid, '');
      setState(() {
        _isLoading = false;
      });
    }
  }

  fetchdata() async {
    await _productSubcategoriesProvider.getproductsubcategorieslist(
        widget.productid, 1, '');

    try {
      if (_productSubcategoriesProvider.getproductsubcategorieslistfetch) {
        if (_productSubcategoriesProvider.getproductListModel.data != null) {
          if (_productSubcategoriesProvider.getproductListModel.data!.total !=
              null) {
            setState(() {
              totalproduct = _productSubcategoriesProvider
                  .getproductListModel.data!.total
                  .toString();
            });
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  fetchserchdata(String name) async {
    setState(() {
      _productSubcategoriesProvider.pageNumrecipe = 1;
      _productSubcategoriesProvider.isFirstdatafound = true;
      _productSubcategoriesProvider.isLoadMoreRunning = false;
      _productSubcategoriesProvider.hasfirst = true;
    });

    await _productSubcategoriesProvider.getproductsubcategorieslist(
        widget.productid, 1, name);

    try {
      if (_productSubcategoriesProvider.getproductsubcategorieslistfetch) {
        if (_productSubcategoriesProvider.getproductListModel.data != null) {
          if (_productSubcategoriesProvider.getproductListModel.data!.total !=
              null) {
            setState(() {
              totalproduct = _productSubcategoriesProvider
                  .getproductListModel.data!.total
                  .toString();
            });
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future wishlist(String wishlistid) async {
    var body = {"product_id": wishlistid};
    LikeApi _likeapi = LikeApi(body);
    final response = await _likeapi.disfav();
    fetchdata();
    DialogHelper.showFlutterToast(strMsg: response['message']);
  }

  Widget _icon(
    IconData icon, {
    Color color = Colors.white,
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
      ),
      child: Icon(icon, color: Colors.white, size: size),
    ).ripple(() {
      if (onPressed != null) {
        onPressed();
      }
    }, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _appBar() {
    return Container(
      color: AppColors.primarycolor,
      padding: AppTheme.padding,
      child: Row(
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
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
                text: widget.productname,
                style: AppStyle.texttitlemain.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productionlist(List<GetproductModelDatas> getproduct) {
    return GridView.builder(
        controller: _scrollController,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemCount: getproduct.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ProductlistcarduiScreenActivity(
            getproduct: getproduct[index],
            callback: (value) {
              if (value == "wishlist") {
                wishlist(getproduct[index].id.toString());
              }
            },
          );
        });
  }

  Widget _filtersort() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          TitleTextStyle(
            text: "$totalproduct Product(s) found",
            // fontSize: product.isSelected ? 14 : 12,

            style: AppStyle.cardssubtitle.copyWith(fontSize: 14.sp),
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                Icons.sort,
                color: AppColors.primarycolor,
              ),
              TitleTextStyle(
                text: Languages.of(context)!.sort,
                style: AppStyle.cardssubtitle.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(
            width: 2.w,
          ),
          Container(
            width: .5.w,
            height: 2.h,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.w,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.filter,
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.filter_alt,
                  color: AppColors.primarycolor,
                ),
                TitleTextStyle(
                  text: Languages.of(context)!.filter,
                  style: AppStyle.cardssubtitle.copyWith(fontSize: 14.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbakgroundcolor,
      body:
          Consumer<ProductProvider>(builder: (context, productProvider, child) {
        return SafeArea(
          child: Column(
            children: [
              _appBar(),
              Expanded(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  controller: _scrollController,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Center(
                          child: TextField(
                            controller: sercheditcontroler,
                            onChanged: ((value) {
                              setState(() {
                                searchString = sercheditcontroler.text;
                              });
                              if (sercheditcontroler.text.isNotEmpty) {
                                fetchserchdata(sercheditcontroler.text);
                              } else {
                                fetchserchdata('');
                              }
                            }),
                            decoration: InputDecoration(
                                isDense: true,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: AppColors.colorGrey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      searchshow = false;
                                      sercheditcontroler.clear();
                                      searchString = '';
                                    });
                                  },
                                ),
                                hintText: Languages.of(context)!.search,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      _filtersort(),
                      !productProvider.isFirstdatafound
                          ? !productProvider.getproductsubcategorieslistfetch
                              ? NoDataFoundErrorScreens()
                              : productProvider.getproduct.isNotEmpty
                                  ? _productionlist(productProvider.getproduct)
                                  : NoDataFoundErrorScreens()
                          : SizedBox(
                              height: 100.h,
                              width: 100.w,
                              child: Center(child: LoaderScreen())),
                    ],
                  ),
                ),
              ),
              if (_isLoading) Center(child: LoaderScreen()),
            ],
          ),
        );
      }),
    );
  }
}
