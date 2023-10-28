import 'package:flutter/material.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BiddingForm extends StatefulWidget {
  // final Function callback;
  final String quantity;
  const BiddingForm({
    super.key,
    // required this.callback,
    required this.quantity,
  });
// class BiddingForm extends StatefulWidget {
//   const BiddingForm({super.key});

  @override
  State<BiddingForm> createState() => _BiddingFormState();
}

class _BiddingFormState extends State<BiddingForm> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItemsone {
    List<DropdownMenuItem<String>> menuItemsone = [
      DropdownMenuItem(
          child: Text(
            "Product Category",
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: ""),
      DropdownMenuItem(
          child: Text(
            "category one",
            // Languages.of(context)!.customers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "3"),
      DropdownMenuItem(
          child: Text(
            "category two",
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
            "Subcategory",
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: ""),
      DropdownMenuItem(
          child: Text(
            "subcategory one",
            // Languages.of(context)!.customers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "3"),
      DropdownMenuItem(
          child: Text(
            "subcategory two",
            //Languages.of(context)!.sellers,
            style: AppStyle.textsubsubtitle.copyWith(color: Colors.black),
          ),
          value: "2"),
    ];
    return menuItemstwo;
  }

  bool isShowLoading = false;
  bool valuedata = false;
  String? selectedValueone = "";
  String? selectedValuetwo = "";
  final _dropdownFormKey = GlobalKey<FormState>();

  int quntity = 0;
  @override
  void initState() {
    // TODO: implement initState
    quntity = int.parse(widget.quantity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: AppBarScreens(
            text: Languages.of(context)!.biddingform,
          )),
      body: Padding(
        padding: EdgeInsets.only(
          left: 1.5.h,
          right: 1.5.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.firstname,
                        icon: Icons.account_circle,
                        textEditingController: firstnameController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.lastname,
                        icon: Icons.account_circle,
                        textEditingController: lastnameController,
                        validator: AppValidator.lastnameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.email,
                        icon: Icons.mail,
                        textEditingController: emailController,
                        validator: AppValidator.emailValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.mobile,
                        keyboardType: TextInputType.number,
                        icon: Icons.phone_android_rounded,
                        textEditingController: mobileController,
                        validator: AppValidator.mobileValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.productdetails,
                            style: AppStyle.textsubtitle
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        //width: 42.w,
                        height: 7.2.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.w),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
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
                                    Radius.circular(10.w),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        // width: 42.w,
                        height: 7.2.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.w),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
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
                                    Radius.circular(10.w),
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
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.productname,
                        icon: Icons.shop_two,
                        textEditingController: productController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Languages.of(context)!.productquantity,
                            style: AppStyle.textsubtitle
                                .copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 6.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.w),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            if ((quntity) > 1) {
                                              quntity--;
                                            }
                                          });
                                          //widget.callback(quntity);
                                        },
                                        child: Icon(Icons.remove)),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    // Text(quntity.toString()),
                                    SizedBox(
                                      height: 6.h,
                                      width: 22.w,
                                      child: TextFormField(
                                        //onChanged: onChanged,
                                        controller: quantityController,
                                        keyboardType: TextInputType.number,
                                        cursorColor: AppColors.primarycolor,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          hintText: quntity.toString(),
                                          hintStyle: TextStyle(
                                            fontSize: 16.sp,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10.0, 10.0, 20.0, 10.0),
                                        ),
                                      ),
                                    ),

                                    //TextFormField(),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          print("object");
                                          setState(() {
                                            quntity++;
                                          });
                                          // widget.callback(quntity);
                                        },
                                        child: Icon(Icons.add)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.biddingprice,
                        keyboardType: TextInputType.number,
                        icon: Icons.price_change,
                        textEditingController: priceController,
                        validator: AppValidator.mobileValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.enterdescription,
                            style: AppStyle.textsubtitle
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 5,
                        maxLines: 8,
                        maxLength: 1000,
                      ),
                    ],
                  )),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 30.w,
                    child: ButtonWidget(
                      text: Languages.of(context)!.startbidding,
                      onTap: () {
                        if (isLoading) {
                          return;
                        }

                        // addnewaddress();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SizedBox(
                    width: 25.w,
                    child: ButtonWidget(
                      text: Languages.of(context)!.cancel,
                      onTap: () {
                        if (isLoading) {
                          return;
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
