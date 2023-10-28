import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/loginapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getaddressModel.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
// import 'package:manaqa_app/utils/button/buttonwidget.dart';
// import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class EditUpdateAddressScreen extends StatefulWidget {
  final GetaddressDataData? getaddressdata;

  const EditUpdateAddressScreen({Key? key, this.getaddressdata})
      : super(key: key);

  @override
  State<EditUpdateAddressScreen> createState() =>
      _EditUpdateAddressScreenState();
}

class _EditUpdateAddressScreenState extends State<EditUpdateAddressScreen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController towncityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (widget.getaddressdata != null) {
      firstnameController.text = widget.getaddressdata!.name ?? '';
      mobileController.text = widget.getaddressdata!.contact.toString();
      addressController.text = widget.getaddressdata!.localAddress.toString();
      towncityController.text = widget.getaddressdata!.city.toString();
      stateController.text = widget.getaddressdata!.state.toString();
      zipcodeController.text = widget.getaddressdata!.zipcode.toString();
      countryController.text = widget.getaddressdata!.country.toString();
    }
    super.initState();
  }

  Future submitupdate() async {
    var data = {
      'name': firstnameController.text,
      'contact': mobileController.text,
      'local_address': addressController.text,
      'city': towncityController.text,
      'state': stateController.text,
      'zipcode': zipcodeController.text,
      'country': countryController.text,
      "address_type": radioButtonItem,
    };
    print(data.toString());
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse
        .editeupdateaddress(widget.getaddressdata!.id.toString());
    print(response);
    if (response['status'] == "success") {
      DialogHelper.showFlutterToast(strMsg: response['message']);
      Navigator.pop(context);
    }
  }

  String radioButtonItem = 'home';

  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.95),
          title: AppBarScreens(
            text: "Update Address",
          )),
      body: Padding(
        padding: EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'home';
                        id = 1;
                      });
                    },
                  ),
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'office';
                        id = 2;
                      });
                    },
                  ),
                  Text(
                    'Office',
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.name,
                        icon: Icons.account_circle,
                        textEditingController: firstnameController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.mobile,
                        icon: Icons.phone_android_rounded,
                        textEditingController: mobileController,
                        validator: AppValidator.mobileValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Address",
                        //Languages.of(context)!.firstname,
                        icon: Icons.location_on,
                        textEditingController: addressController,
                        validator: AppValidator.emptyValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Town/City",
                        //Languages.of(context)!.firstname,
                        icon: Icons.location_city,
                        textEditingController: towncityController,
                        validator: AppValidator.emptyValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "State",
                        //Languages.of(context)!.firstname,
                        icon: Icons.scatter_plot_outlined,
                        textEditingController: stateController,
                        validator: AppValidator.emptyValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Zip/Code",
                        //Languages.of(context)!.lastname,
                        icon: Icons.pix_rounded,
                        textEditingController: zipcodeController,
                        validator: AppValidator.emptyValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Country",
                        //Languages.of(context)!.firstname,
                        icon: Icons.language,
                        textEditingController: countryController,
                        validator: AppValidator.emptyValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  )),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    // fillColor: MaterialStateProperty.resolveWith(
                    //     Colors.),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text(
                    "Use this address as default",
                    style: AppStyle.textsubsubtitle,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 30.w,
                    child: ButtonWidget(
                      text: "Update Address",
                      //Languages.of(context)!.update,
                      onTap: () {
                        if (isLoading) {
                          return;
                        }

                        submitupdate();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SizedBox(
                    width: 25.w,
                    child: ButtonWidget(
                      text: "Cancel",
                      //Languages.of(context)!.update,
                      onTap: () {
                        // if (isLoading) {
                        //   return;
                        // }

                        // submitupdate();
                      },
                    ),
                  ),
                ],
              ),
              // !isLoading
              //     ? ButtonWidget(
              //         text: Languages.of(context)!.update,
              //         onTap: () {
              //           if (isLoading) {
              //             return;
              //           }
              //           submitupdate();
              //         },
              //       )
              //     : ButtonWidgetLoader(),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
