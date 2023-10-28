import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/api/loginapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getaddressModel.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddnewaddressScreen extends StatefulWidget {
  final GetaddressDataData? getaddressdata;

  const AddnewaddressScreen({Key? key, this.getaddressdata}) : super(key: key);

  @override
  State<AddnewaddressScreen> createState() => _AddnewaddressScreenState();
}

class _AddnewaddressScreenState extends State<AddnewaddressScreen> {
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

  Future addnewaddress() async {
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
    final response = await registerresponse.addnewaddress();
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
            text: "Add New Address",
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
                        validator: AppValidator.mobileValidator,
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
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Town/City",
                        //Languages.of(context)!.firstname,
                        icon: Icons.location_city,
                        textEditingController: towncityController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "State",
                        //Languages.of(context)!.firstname,
                        icon: Icons.scatter_plot_outlined,
                        textEditingController: stateController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Zip/Code",
                        //Languages.of(context)!.lastname,
                        icon: Icons.pix_rounded,
                        textEditingController: zipcodeController,
                        validator: AppValidator.lastnameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: "Country",
                        //Languages.of(context)!.firstname,
                        icon: Icons.language,
                        textEditingController: countryController,
                        validator: AppValidator.nameValidator,
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
                      text: "Save Address",
                      //Languages.of(context)!.update,
                      onTap: () {
                        if (isLoading) {
                          return;
                        }

                        addnewaddress();
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
                      onTap: () {
                        if (isLoading) {
                          return;
                        }
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
              //           // submitupdate();
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

enum SingingCharacter { lafayette, jefferson }
