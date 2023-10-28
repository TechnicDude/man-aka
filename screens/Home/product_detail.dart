import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/data.dart';
import 'package:manaqa_app/model/getproductsdetailsid.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/productdetailsProvider.dart';
import 'package:manaqa_app/themes/light_color.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailPage extends StatefulWidget {
  final String productname;
  final String productid;
  ProductDetailPage({
    Key? key,
    required this.productid,
    required this.productname,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  ProductDatilsProvider _productDetails = ProductDatilsProvider();
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    _productDetails =
        Provider.of<ProductDatilsProvider>(context, listen: false);
    fetchdata();

    controller.forward();
  }

  fetchdata() async {
    await _productDetails.getproductsubcategorieslist(widget.productid);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLiked = true;
  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            width: 100.w - 200,
            child: Center(
              child: TitleTextStyle(
                textAlign: TextAlign.center,
                maxline: 2,
                text: widget.productname,
                style: AppStyle.texttitlemain,
              ),
            ),
          ),
          _icon(isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? AppColors.red : AppColors.lightGrey,
              size: 15,
              padding: 12,
              isOutLine: false, onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          }),
        ],
      ),
    );
  }

  Widget _icon(
    IconData icon, {
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

  Widget _productImage(List<String>? gallery) {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: CarouselSlider(
        options: CarouselOptions(
            autoPlay: true,
            // aspectRatio: 2.0,
            enlargeCenterPage: true,
            viewportFraction: 1),
        items: gallery!
            .map((item) => Image.network(ApiUrl.root + '/' + item))
            .toList(),
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              AppData.showThumbnailList.map((x) => _thumbnail(x)).toList()),
    );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
      animation: animation,
      //  builder: null,
      builder: (context, child) => AnimatedOpacity(
        opacity: animation.value,
        duration: Duration(milliseconds: 500),
        child: child,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(13)),
            // color: Theme.of(context).backgroundColor,
          ),
          child: Image.asset(image),
        ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13))),
      ),
    );
  }

  Widget _detailWidget(GetproductsDetailsByIDModelData productdetails) {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: AppColors.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextStyle(
                            text: productdetails.brand!.name!,
                            style: AppStyle.cardtitle
                                .copyWith(color: AppColors.grey),
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          TitleTextStyle(
                            text: productdetails.name!,
                            style: AppStyle.cardtitle,
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          TitleTextStyle(
                            text:
                                "${Languages.of(context)!.soldBy} ${productdetails.seller!.name!}",
                            style: AppStyle.cardtitle
                                .copyWith(color: AppColors.grey),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // Row(
                          //   children: <Widget>[
                          //     Icon(Icons.star,
                          //         color: AppColors.yellowColor, size: 17),
                          //     Icon(Icons.star,
                          //         color: AppColors.yellowColor, size: 17),
                          //     Icon(Icons.star,
                          //         color: AppColors.yellowColor, size: 17),
                          //     Icon(Icons.star,
                          //         color: AppColors.yellowColor, size: 17),
                          //     Icon(Icons.star_border, size: 17),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // _availableSize(),
                // SizedBox(
                //   height: 20,
                // ),
                TitleTextStyle(
                  text: Languages.of(context)!.price,
                  style: AppStyle.cardtitle,
                ),

                Row(
                  children: [
                    TitleTextStyle(
                      text: "\$${productdetails.salePrice!.toString()}",
                      style: AppStyle.cardtitle.copyWith(
                          fontSize: 20.sp, color: AppColors.primarycolor),
                    ),
                    TitleTextStyle(
                      text: " (2% OFF)",
                      style: AppStyle.cardtitle,
                    ),
                  ],
                ),
                if (productdetails.regularPrice != null)
                  if (productdetails.regularPrice! > 0)
                    TitleTextStyle(
                      text:
                          "${Languages.of(context)!.mrp} : \$${productdetails.regularPrice!.toString()}",
                      style: AppStyle.cardtitle.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.grey),
                    ),
                SizedBox(
                  height: 1.h,
                ),
                TitleTextStyle(
                  text: Languages.of(context)!.unit,
                  style: AppStyle.cardtitle,
                ),
                SizedBox(
                  height: 1.h,
                ),
                TitleTextStyle(
                  text:
                      "${productdetails.unitValue.toString()} ${productdetails.unitType.toString()}",
                  style: AppStyle.cardtitle,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: ViewButtonWidget(
                        height: 4.h,
                        onTap: () {},
                        boxcolor: AppColors.primarycolor,
                        text: Languages.of(context)!.bid,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: ViewButtonWidget(
                        height: 4.h,
                        onTap: () {
                          Navigator.pushNamed(context, Routes.productBuynow,
                              arguments: {
                                AppStringFile.productid:
                                    productdetails.id.toString(),
                                AppStringFile.price:
                                    productdetails.salePrice.toString(),
                                AppStringFile.productname: productdetails.name!,
                                AppStringFile.unity: productdetails.unitType,
                                AppStringFile.quantity:
                                    productdetails.unitValue.toString(),
                              });
                        },
                        textcolor: AppColors.primarycolor,
                        boxcolor: AppColors.colorWhite,
                        bordercolor: AppColors.primarycolor,
                        text: Languages.of(context)!.buy,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                TitleTextStyle(
                  text: Languages.of(context)!.productdetails,
                  style: AppStyle.cardtitle,
                ),
                ListView.builder(
                    itemCount: 6,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Brand"),
                          TitleTextStyle(
                            text: productdetails.brand!.name!,
                            style: AppStyle.cardtitle
                                .copyWith(color: AppColors.grey),
                          ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 2.h,
                ),
                TitleTextStyle(
                  text: Languages.of(context)!.description,
                  style: AppStyle.cardtitle,
                ),
                SizedBox(
                  height: 1.h,
                ),
                _description(productdetails.description!),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _description(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppHelper().htmlremove(description),
          style: AppStyle.textdescription,
        ),
      ],
    );
  }

  FloatingActionButton _flotingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.mybiddingform);
      },
      backgroundColor: AppColors.orange,
      child: Icon(Icons.add,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDatilsProvider>(
        builder: (context, productProvider, child) {
      return Scaffold(
        floatingActionButton: _flotingButton(),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _appBar(),
                    if (productProvider.getproductdetailsfetch)
                      if (productProvider.getproduct.isNotEmpty)
                        if (productProvider.getproduct[0].gallery != null)
                          _productImage(productProvider.getproduct[0].gallery),
                    // _categoryWidget(),
                  ],
                ),
                if (productProvider.getproductdetailsfetch)
                  if (productProvider.getproduct.isNotEmpty)
                    _detailWidget(productProvider.getproduct[0]),
              ],
            ),
          ),
        ),
      );
    });
  }
}
