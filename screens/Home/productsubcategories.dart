import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/productSubcategoriesModel.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/productsubcategories.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/nodatafoundscreen.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/product_card_subcategories.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/product_card_ui.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductSubCategoriesScreenActivity extends StatefulWidget {
  final String subcategoriesid;
  final String subcategoriesname;
  const ProductSubCategoriesScreenActivity({
    super.key,
    required this.subcategoriesid,
    required this.subcategoriesname,
  });

  @override
  State<ProductSubCategoriesScreenActivity> createState() =>
      _ProductSubCategoriesScreenActivityState();
}

class _ProductSubCategoriesScreenActivityState
    extends State<ProductSubCategoriesScreenActivity> {
  ProductSubcategoriesProvider _productSubcategoriesProvider =
      ProductSubcategoriesProvider();
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    _productSubcategoriesProvider =
        Provider.of<ProductSubcategoriesProvider>(context, listen: false);
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
      await _productSubcategoriesProvider.loadMore(widget.subcategoriesid);
      setState(() {
        _isLoading = false;
      });
    }
  }

  fetchdata() async {
    await _productSubcategoriesProvider.getproductsubcategorieslist(
        widget.subcategoriesid, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductSubcategoriesProvider>(
          builder: (context, dashBoradProvider, child) {
        return SafeArea(
            child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _appBar(context),
              SizedBox(
                height: 2.h,
              ),
              !dashBoradProvider.isFirstdatafound
                  ? dashBoradProvider.getproductsubcategorieslistfetch
                      ? NoDataFoundErrorScreens(
                          height: 50.h,
                        )
                      : _categoryWidget(
                          dashBoradProvider.getproductsubcategories, context)
                  : SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Center(child: LoaderScreen())),
              if (_isLoading) Center(child: LoaderScreen()),
            ],
          ),
        ));
      }),
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
      //  backgroundColor: Colors.white.withOpacity(0.95),
      color: Colors.white.withOpacity(0.95),
      padding: AppTheme.padding,
      child: Row(
        children: <Widget>[
          _icon(
            Icons.arrow_back_ios,
            context,
            color: Colors.black,
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
                text: widget.subcategoriesname,
                style: AppStyle.texttitlemain.copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryWidget(
      List<GetproductSubcategoriesModelDatas> getproductscategoriesModelDatas,
      BuildContext context) {
    return GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .9 / 1,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1),
        itemCount: getproductscategoriesModelDatas.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductCardUiSubCategories(
              model: getproductscategoriesModelDatas[index],
              onSelected: (model) {
                Navigator.pushNamed(context, Routes.product, arguments: {
                  AppStringFile.productid:
                      getproductscategoriesModelDatas[index].id.toString(),
                  AppStringFile.productname:
                      getproductscategoriesModelDatas[index].name.toString(),
                });
              },
            ),
          );
        });
  }
}
