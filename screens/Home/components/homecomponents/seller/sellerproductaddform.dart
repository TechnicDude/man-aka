import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/provider/sellerproductaddsform.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/appbar/bodyAppbar.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:manaqa_app/utils/textform/textformadd.dart';
import 'package:manaqa_app/utils/textshow.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SellerProductaddFormScreenActivity extends StatefulWidget {
  const SellerProductaddFormScreenActivity({super.key});

  @override
  State<SellerProductaddFormScreenActivity> createState() =>
      _SellerProductaddFormScreenActivityState();
}

enum Gender { All, Male, Female, Other }

class _SellerProductaddFormScreenActivityState
    extends State<SellerProductaddFormScreenActivity> {
  SellerProductAddFormProvider _sellerProductAddFormProvider =
      SellerProductAddFormProvider();
  TextEditingController nameeditcontroller = TextEditingController();
  TextEditingController slugeditcontroller = TextEditingController();
  TextEditingController timeperiodcontroller = TextEditingController();
  // QuillController _controller = QuillController.basic();

  String gender = "All";
  String categoriesdatadelect = "0";
  String subcategoriesdatadelect = "0";
  String branddatadelect = "0";
  @override
  void initState() {
    // TODO: implement initState
    _sellerProductAddFormProvider =
        Provider.of<SellerProductAddFormProvider>(context, listen: false);
    fetchdata();
    super.initState();
  }

  fetchdata() async {
    await _sellerProductAddFormProvider.getproductcategorieslist(context);
    await _sellerProductAddFormProvider.getbarndlist('', context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SellerProductAddFormProvider>(
        builder: (context, sellerproductaddform, child) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BodyAppBarScreenActivity(
                title: Languages.of(context)!.productadd,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        texttitle(Languages.of(context)!.categoriesonly),
                        if (sellerproductaddform.getproductcategorieslistfetch)
                          if (sellerproductaddform
                              .getproductcategories.isNotEmpty)
                            dropdownui(
                                sellerproductaddform.getproductcategories,
                                "category"),
                        if (sellerproductaddform
                            .getproductsubcategorieslistfetch)
                          if (sellerproductaddform
                              .getproductsubcategories.isNotEmpty)
                            texttitle(Languages.of(context)!.subcategories),
                        if (sellerproductaddform
                            .getproductsubcategorieslistfetch)
                          if (sellerproductaddform
                              .getproductsubcategories.isNotEmpty)
                            dropdownui(
                                sellerproductaddform.getproductsubcategories,
                                "subcategory"),
                        if (sellerproductaddform.getbrandlistfetch)
                          if (sellerproductaddform.getbrandlist.isNotEmpty)
                            texttitle(Languages.of(context)!.brand),
                        if (sellerproductaddform.getbrandlistfetch)
                          if (sellerproductaddform.getbrandlist.isNotEmpty)
                            dropdownui(
                                sellerproductaddform.getbrandlist, "brand"),
                        texttitle(Languages.of(context)!.name),
                        TextFormAddScreen(
                          hinttext: Languages.of(context)!.name,
                          textEditingController: nameeditcontroller,
                          validator: AppValidator.emptyValidator,
                          onChanged: (value) {
                            setState(() {
                              slugeditcontroller.text =
                                  value.replaceAll(" ", "- ");
                            });
                          },
                        ),
                        texttitle(Languages.of(context)!.slug),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.slug,
                          textEditingController: slugeditcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.gender),
                        gendreui(),
                        texttitle(Languages.of(context)!.timePeriod),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.timePeriod,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.unittype),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.unittype,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.unitvalue),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.unitvalue,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.productsku),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.productsku,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.stockquantity),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.stockquantity,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.weigth),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.weigth,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.regularprice),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.regularprice,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.saleprice),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.saleprice,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                        texttitle(Languages.of(context)!.discount),
                        TextFormAddScreen(
                          readOnly: true,
                          hinttext: Languages.of(context)!.discount,
                          textEditingController: timeperiodcontroller,
                          validator: AppValidator.emptyValidator,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget texttitle(String title) {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Text(
          title,
          style: AppStyle.textsubtitlemain.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }

  Widget dropdownui(List product, String type) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.appPrimarycolor),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
      //wrapper for Country list
      child: DropdownButton(
        underline: SizedBox(),
        isExpanded: true,
        value:
            type == "category" ? categoriesdatadelect : subcategoriesdatadelect,
        // hint: Text("Select Country"),
        items: product.map((item) {
          return DropdownMenuItem(
            child: TextShowWidget(item.name), //label of item
            value: item.id.toString(), //value of item
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            if (type == "category") {
              categoriesdatadelect = value.toString();
              _sellerProductAddFormProvider.getproductsubcategorieslist(
                  categoriesdatadelect, context);
            }
          });
        },
      ),
    );
  }

  Widget gendreui() {
    return Row(
      children: [
        Row(
          children: [
            Radio(
              value: Gender.All,
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString().toUpperCase();
                });
              },
            ),
            Text(Languages.of(context)!.all),
          ],
        ),
        Row(
          children: [
            Radio(
              value: Gender.Male,
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString().toUpperCase();
                });
              },
            ),
            Text(Languages.of(context)!.male),
          ],
        ),
        Row(
          children: [
            Radio(
              value: Gender.Female,
              groupValue: gender,
              onChanged: (value) {
                print(gender);
                setState(() {
                  gender = value.toString().toUpperCase();
                });
              },
            ),
            Text(Languages.of(context)!.female),
          ],
        ),
        Row(
          children: [
            Radio(
              value: Gender.Other,
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value.toString().toUpperCase();
                });
              },
            ),
            Text(Languages.of(context)!.other),
          ],
        )
      ],
    );
  }
}
