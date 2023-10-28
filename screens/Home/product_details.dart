import 'dart:convert';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/likeapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/data.dart';
import 'package:manaqa_app/model/getproductModel.dart';
import 'package:manaqa_app/model/getproductsdetailsid.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/productdetailsProvider.dart';
import 'package:manaqa_app/screens/Home/components/productwidgetui.dart';
import 'package:manaqa_app/screens/Home/relatedProducts/relatedproduct.dart';
import 'package:manaqa_app/screens/addtocard/components/addtocardbutton.dart';
import 'package:manaqa_app/themes/light_color.dart';
import 'package:manaqa_app/themes/theme.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetailsPage extends StatefulWidget {
  final String productname;
  final String productid;
  final String productcategoryid;
  ProductDetailsPage(
      {Key? key,
      required this.productid,
      required this.productname,
      required this.productcategoryid})
      : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin {
  ProductDatilsProvider _productDetails = ProductDatilsProvider();
  ProductDatilsProvider _productcatDetails = ProductDatilsProvider();

  late AnimationController controller;
  late Animation<double> animation;
  bool isLiked = false;

  List<DropdownMenuItem<String>> get dropdownItemsone {
    List<DropdownMenuItem<String>> menuItemsone = [
      DropdownMenuItem(
          child: Text(
            "Country 1",
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: ""),
      DropdownMenuItem(
          child: Text(
            "Country one",
            // Languages.of(context)!.customers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "3"),
      DropdownMenuItem(
          child: Text(
            "Country two",
            //Languages.of(context)!.sellers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "2"),
    ];
    return menuItemsone;
  }

  List<DropdownMenuItem<String>> get dropdownItemstwo {
    List<DropdownMenuItem<String>> menuItemstwo = [
      DropdownMenuItem(
          child: Text(
            "201301",
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: ""),
      DropdownMenuItem(
          child: Text(
            "201302",
            // Languages.of(context)!.customers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "3"),
      DropdownMenuItem(
          child: Text(
            "201303",
            //Languages.of(context)!.sellers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "2"),
    ];
    return menuItemstwo;
  }

// sellerselectedValueone
  List<DropdownMenuItem<String>> get dropdownItemsseller {
    List<DropdownMenuItem<String>> menuItemseller = [
      DropdownMenuItem(
          child: Text(
            "seller 1 - 121",
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: ""),
      DropdownMenuItem(
          child: Text(
            "seller 12- 120",
            // Languages.of(context)!.customers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "3"),
      DropdownMenuItem(
          child: Text(
            "seller 3- 122",
            //Languages.of(context)!.sellers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "2"),
    ];
    return menuItemseller;
  }

  bool isShowLoading = false;
  bool valuedata = false;
  String? selectedValueone = "";
  String? selectedValuetwo = "";
  String? sellerselectedValueone = "";
  final _dropdownFormKey = GlobalKey<FormState>();

  // int quntity = 0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   quntity = int.parse(widget.quantity);
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    _productDetails =
        Provider.of<ProductDatilsProvider>(context, listen: false);
    _productcatDetails =
        Provider.of<ProductDatilsProvider>(context, listen: false);

    fetchdata();

    controller.forward();
  }

  fetchdata() async {
    await _productDetails.getproductsubcategorieslist(widget.productid);
    if (_productDetails.getproductdetailsfetch) {
      if (_productDetails.getproduct.isNotEmpty) {
        setState(() {
          isLiked =
              _productDetails.getproduct[0].wishlistStatus.toString() == "true"
                  ? true
                  : false;
        });
      }
    }
    await _productcatDetails.relatedproductlist(widget.productcategoryid);
  }

  Future wishlist(String wishlistid) async {
    var body = {"product_id": wishlistid};
    LikeApi _likeapi = new LikeApi(body);
    final response = await _likeapi.disfav();

    DialogHelper.showFlutterToast(strMsg: response['message']);
  }

  Future addtocard(String quantity) async {
    var body = {"product_id": widget.productid, 'quantity': quantity};
    LikeApi _likeapi = new LikeApi(body);
    final response = await _likeapi.addtocard();
    log(response.toString());
    if (response['error'] == null) {
      DialogHelper.showFlutterToast(strMsg: response['message']);
    } else {
      DialogHelper.showFlutterToast(strMsg: response['error']);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              color: isLiked ? AppColors.red : AppColors.primarycolor,
              size: 15,
              padding: 12,
              isOutLine: false, onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
            log(isLiked.toString());
            wishlist(widget.productid);
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
          // enlargeCenterPage: true,
        ),
        items: gallery!
            .map((item) => Image.network(
                  ApiUrl.root + '/' + item,
                  fit: BoxFit.fill,
                ))
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
    return Container(
      padding: AppTheme.padding.copyWith(bottom: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Colors.white),
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
                      style: AppStyle.cardtitle.copyWith(color: AppColors.grey),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    TitleTextStyle(
                      text: productdetails.name!,
                      style: AppStyle.cardtitle.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: .5.h,
                    ),
                    TitleTextStyle(
                      text:
                          "${Languages.of(context)!.soldBy} ${productdetails.seller!.name!}",
                      style: AppStyle.cardtitle.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TitleTextStyle(
            text: Languages.of(context)!.price,
            style: AppStyle.cardtitle,
          ),
          Row(
            children: [
              TitleTextStyle(
                text: "\$${productdetails.salePrice!.toString()}",
                style: AppStyle.cardtitle
                    .copyWith(fontSize: 20.sp, color: AppColors.primarycolor),
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
          SizedBox(
            height: 1.h,
          ),
          TitleTextStyle(
            text: Languages.of(context)!.quantity,
            style: AppStyle.cardtitle,
          ),
          Row(
            children: [
              AddtoCardquantitytiyScreenActivity(
                quantity: productdetails.unitValue.toString(),
                callback: (value) {
                  setState(() {
                    productdetails.unitValue = value;
                    addtocard(productdetails.unitValue.toString());
                  });
                },
              ),
              SizedBox(
                width: 2.w,
              ),
              TitleTextStyle(
                text: "Min Qty: 1",
                //Languages.of(context)!.Mi,
                style: AppStyle.cardtitle,
              ),
            ],
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
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleTextStyle(
                text: "Select Color & Size",
                //Languages.of(context)!.Mi,
                style: AppStyle.cardtitle,
              ),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40.w,
                child: ViewButtonWidget(
                  height: 5.h,
                  onTap: () {
                    addtocard(productdetails.unitValue.toString());
                  },
                  textcolor: AppColors.primarycolor,
                  boxcolor: AppColors.colorWhite,
                  bordercolor: AppColors.primarycolor,
                  text: Languages.of(context)!.addtocart,
                ),
              ),
              SizedBox(
                width: 40.w,
                child: ViewButtonWidget(
                  height: 5.h,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.productBuynow,
                        arguments: {
                          AppStringFile.productid: productdetails.id.toString(),
                          AppStringFile.price:
                              productdetails.salePrice.toString(),
                          AppStringFile.productname: productdetails.name!,
                          AppStringFile.unity: productdetails.unitType,
                          AppStringFile.quantity:
                              productdetails.unitType.toString(),
                        });
                  },
                  boxcolor: AppColors.primarycolor,
                  text: Languages.of(context)!.buy,
                ),
              )
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Container(
            height: 18.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.all(Radius.circular(1.w)),
              border: Border.all(
                  color: AppColors.colorGrey.withOpacity(0.5), width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextStyle(
                    text: "Check Delivery Option",
                    //Languages.of(context)!.productdetails,
                    style: AppStyle.cardtitle,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextStyle(
                            text: "Select Country",
                            //Languages.of(context)!.Mi,
                            style: AppStyle.cardtitle,
                          ),
                          Container(
                            width: 40.w,
                            height: 7.2.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.w),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1,
                                  ),
                                ]),
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.w),
                                      )),
                                  // fillColor: ,
                                ),
                                validator: (value) => value == null
                                    ? Languages.of(context)!.productcategory
                                    : null,
                                // dropdownColor: Colors.blueAccent,
                                value: selectedValueone,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValueone = newValue!;
                                    print(selectedValueone);
                                  });
                                },
                                items: dropdownItemsone),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextStyle(
                            text: "Enter Zipcode",
                            //Languages.of(context)!.Mi,
                            style: AppStyle.cardtitle,
                          ),
                          Container(
                            width: 40.w,
                            height: 7.2.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.w),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 1,
                                  ),
                                ]),
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.w),
                                      )),
                                  // fillColor: ,
                                ),
                                validator: (value) => value == null
                                    ? Languages.of(context)!.productsubcategory
                                    : null,
                                // dropdownColor: Colors.blueAccent,
                                value: selectedValuetwo,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValuetwo = newValue!;
                                    print(selectedValuetwo);
                                  });
                                },
                                items: dropdownItemstwo),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            height: 15.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.all(Radius.circular(1.w)),
              border: Border.all(
                  color: AppColors.colorGrey.withOpacity(0.5), width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextStyle(
                    text: "Buy from other sellers",
                    //Languages.of(context)!.productdetails,
                    style: AppStyle.cardtitle,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: 100.w,
                    height: 7.2.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.w),
                      ),
                    ),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.w),
                              )),
                          // fillColor: ,
                        ),
                        validator: (value) => value == null
                            ? Languages.of(context)!.productcategory
                            : null,
                        // dropdownColor: Colors.blueAccent,
                        value: sellerselectedValueone,
                        onChanged: (String? newValue) {
                          setState(() {
                            sellerselectedValueone = newValue!;
                            print(sellerselectedValueone);
                          });
                        },
                        items: dropdownItemsseller),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 2.h,
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
                      style: AppStyle.cardtitle.copyWith(color: AppColors.grey),
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
          SizedBox(
            height: 2.h,
          ),
          _reviewdata(),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  Widget _reviewdata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleTextStyle(
              text: "${Languages.of(context)!.allreview} (201)",
              style: AppStyle.cardtitle,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 5.w,
            )
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleTextStyle(
              text: "4.5",
              style: AppStyle.texttitle
                  .copyWith(color: Colors.black, fontSize: 20.sp),
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: AppColors.rating,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(AppImages.outro1))),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextStyle(
                              text: "Aman",
                              style: AppStyle.cardtitle,
                            ),
                            TitleTextStyle(
                              text: "Sept 6,2023",
                              style: AppStyle.cardtitle
                                  .copyWith(color: Colors.grey),
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    TitleTextStyle(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur gssfdsdfsdfsfff. Nunc quis risus mi. Ut placerat dfg quam lectus. Curabitur dictum velit non lacus gsrornare tempor. Nullam quis augue in leo aliquet smalesuada sit amet eget eros. Sed laoreet posuere velit sit amet varius. Nulla eget purus non erat fringilla sodales vel a nulla. Cras sit amet tempus risus. Fusce dignissim blandit justo.hjgfh",
                      style: AppStyle.cardtitle.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              );
            })
      ],
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

  Widget _myrelatedproducts(List<GetproductModelDatas> productcategoryid) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextStyle(
          text: Languages.of(context)!.relatedproducts,
          style: AppStyle.cardtitle,
        ),
        SizedBox(
          height: 35.h,
          // width: 100.w,
          child: ListView.builder(
              physics: ScrollPhysics(),
              itemCount: productcategoryid.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 40.w,
                  child: ProductlistcarduiScreenActivity(
                    getproduct: productcategoryid[index],
                    callback: (value) {
                      if (value == "wishlist") {
                        wishlist(productcategoryid[index].id.toString());
                      }
                    },
                  ),
                );
                // return Padding(
                //   padding: EdgeInsets.only(
                //       top: 1.h, bottom: 0.5.h, left: 1.h, right: 1.h),
                //   child: InkWell(
                //     child: Container(
                //       decoration: BoxDecoration(
                //         color: AppColors.background,
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         boxShadow: <BoxShadow>[
                //           BoxShadow(
                //               color: AppColors.backgroundshadow,
                //               blurRadius: 10,
                //               spreadRadius: 2),
                //         ],
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: <Widget>[
                //           Container(
                //             width: 40.w,
                //             height: 35.w,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.only(
                //                   topLeft: Radius.circular(10),
                //                   topRight: Radius.circular(10)),
                //               image: productcategoryid[index].image != null
                //                   ? DecorationImage(
                //                       fit: BoxFit.fill,
                //                       image: NetworkImage(
                //                         ApiUrl.root +
                //                             '/' +
                //                             productcategoryid[index].image!,
                //                       ),
                //                     )
                //                   : DecorationImage(
                //                       fit: BoxFit.fill,
                //                       image: AssetImage(
                //                         AppImages.logo,
                //                       ),
                //                     ),
                //             ),
                //           ),
                //           // Container(
                //           //   height: 10.h,
                //           //   width: 34.w,
                //           //   decoration: BoxDecoration(
                //           //     shape: BoxShape.rectangle,
                //           //     borderRadius: BorderRadius.circular(1.h),
                //           //     color: AppColors.colorGrey.withOpacity(0.3),
                //           //   ),
                //           //   child: CircleAvatar(
                //           //       backgroundColor: Colors.black,
                //           //       radius: 3.h,
                //           //       backgroundImage: AssetImage(
                //           //         AppImages.loginimg,
                //           //       )),
                //           // ),
                //           SizedBox(
                //             height: 1.h,
                //           ),
                //           TitleTextStyle(
                //             text: productcategoryid[index].name ?? '',
                //             style: AppStyle.cardtitle,
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               TitleTextStyle(
                //                 text:
                //                     "${AppHelper.language == "en" ? "\$" : "RD\$"}",
                //                 style: AppStyle.cardssubtitle,
                //               ),
                //               TitleTextStyle(
                //                 text: "\$600",
                //                 // "${AppHelper.language == "en" ? "\$" : "RD\$"}${getproduct[index].maxregularprice.toString()}",
                //                 // fontSize: product.isSelected ? 14 : 12,

                //                 style: AppStyle.cardssubtitle,
                //               ),
                //             ],
                //           ),
                //           SizedBox(
                //             height: 1.h,
                //           ),
                //           SizedBox(
                //             width: 30.w,
                //             child: ViewButtonWidget(
                //               height: 3.h,
                //               text: Languages.of(context)!.selectoption,
                //               textcolor: AppColors.primarycolor,
                //               boxcolor: Colors.transparent,
                //               bordercolor: AppColors.primarycolor,
                //               onTap: () {},
                //             ),
                //           ),
                //           SizedBox(
                //             height: 1.h,
                //           ),
                //         ],
                //       ).ripple(() {
                //         // Navigator.of(context).pushNamed('/detail');
                //         // onSelected(product);
                //         Navigator.pushNamed(
                //           context, Routes.productDetails,
                //           // arguments: {
                //           //   AppStringFile.productid:
                //           //       getproduct[index].id.toString(),
                //           //   AppStringFile.productname:
                //           //       getproduct[index].name.toString(),
                //           // }
                //         );
                //       }, borderRadius: BorderRadius.all(Radius.circular(10))),
                //     ),
                //   ),
                // );
              }),
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
        backgroundColor: AppColors.appbakgroundcolor,
        // floatingActionButton: _flotingButton(),
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
            child: Column(
              children: <Widget>[
                _appBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (productProvider.getproductdetailsfetch)
                          // if (productProvider.getproduct.isNotEmpty)
                          if (productProvider.getproduct[0].gallery != null)
                            _productImage(
                                productProvider.getproduct[0].gallery),
                        SizedBox(
                          height: 2.h,
                        ),
                        _categoryWidget(),
                        if (productProvider.getproductdetailsfetch)
                          if (productProvider.getproduct.isNotEmpty)
                            _detailWidget(productProvider.getproduct[0]),
                        if (productProvider.getproductrelatedfetch)
                          if (productProvider.getproductrelated.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _myrelatedproducts(
                                  productProvider.getproductrelated),
                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
