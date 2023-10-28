import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/loginapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/profileuserModel.dart';
import 'package:manaqa_app/utils/app_validator.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/button/backbutton.dart';
import 'package:manaqa_app/utils/button/backbutton.dart';
import 'package:manaqa_app/utils/button/buttonwidget.dart';
import 'package:manaqa_app/utils/button/buttonwidgetloader.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class EditProfile extends StatefulWidget {
  final List<ProfileUserData>? profileuserdata;
  const EditProfile({Key? key, this.profileuserdata}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (widget.profileuserdata!.isNotEmpty) {
      firstnameController.text = widget.profileuserdata![0].person!.name ?? '';
      lastnameController.text =
          widget.profileuserdata![0].person!.lastName ?? '';
      emailController.text = widget.profileuserdata![0].email ?? '';
      mobileController.text =
          widget.profileuserdata![0].person!.phone.toString();
    }
    super.initState();
  }

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  openImages() async {
    try {
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagefiles = image;
        setState(() {});
      } else {
        DialogHelper.showFlutterToast(strMsg: 'No image is selected');
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  Future submitupdate() async {
    if (imagefiles != null) {
      var url = Uri.parse(ApiUrl.media);
      print(url);

      final request = http.MultipartRequest('POST', url);
      Map<String, String> headers = {
        "Authorization": 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}',
      };
      print(imagefiles!.path);

      request.headers.addAll(headers);
      print(request.headers.toString());
      print(request.headers);
      final file =
          await http.MultipartFile.fromPath('image[]', imagefiles!.path);
      request.files.add(file);
      print("object data");
      print(request);

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        var out = jsonDecode(response.body);
        if (out['status'].toString().toLowerCase() == "success") {
          var imagepath = out['data'][0]['path'];
          log(imagepath.toString());

          var data = {
            'name': firstnameController.text,
            'last_name': lastnameController.text,
            'phone': mobileController.text,
            'image': imagepath,
          };
          print(data.toString());

          LoginApi registerresponse = LoginApi(data);
          final response = await registerresponse.updateprofile();
          print(response);
        }

        if (out['status'] == "success") {
          DialogHelper.showFlutterToast(strMsg: out['message']);
          Navigator.pop(context);
        } else {
          DialogHelper.showFlutterToast(strMsg: "Getting Error");
        }
      } catch (e) {
        print(e);
      }
    } else {
      var data = {
        'name': firstnameController.text,
        'last_name': lastnameController.text,
        'phone': mobileController.text,
        'image': widget.profileuserdata![0].person!.image ?? '',
      };
      print(data.toString());
      LoginApi registerresponse = LoginApi(data);
      final response = await registerresponse.updateprofile();
      print(response);
      if (response['status'] == "success") {
        DialogHelper.showFlutterToast(strMsg: response['message']);
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: EdgeInsets.only(top: 4.h, left: 2.h, right: 2.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackButtonscreen(
                text: Languages.of(context)!.editprofile,
              ),
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 6.h,
                  backgroundColor: AppColors.colorGrey.withOpacity(0.3),
                  child: CircleAvatar(
                    radius: 5.5.h,
                    backgroundColor: AppColors.colorGrey,
                    backgroundImage: imagefiles != null
                        ? FileImage(File(imagefiles!.path))
                        : widget.profileuserdata![0].person!.image != null
                            ? NetworkImage(ApiUrl.imageurl +
                                widget.profileuserdata![0].person!.image
                                    .toString())
                            : AssetImage(
                                AppImages.profile,
                              ) as ImageProvider,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          // _editProfileController.showPopupMenu();
                          openImages();
                        },
                        child: CircleAvatar(
                          radius: 2.h,
                          backgroundColor: AppColors.appPrimarycolor,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.firstname,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.lastname,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.email,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.mobile,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.mobile,
                        icon: Icons.phone_android_rounded,
                        textEditingController: mobileController,
                        validator: AppValidator.mobileValidator,
                      ),
                    ],
                  )),
              SizedBox(
                height: 5.h,
              ),
              !isLoading
                  ? ButtonWidget(
                      text: Languages.of(context)!.update,
                      onTap: () {
                        if (isLoading) {
                          return;
                        }

                        // update(
                        //   firstnameController.text,
                        //   lastnameController.text,
                        //   emailController.text,
                        //   mobileController.text,
                        // );

                        submitupdate();
                      },
                    )
                  : ButtonWidgetLoader(),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // update(firstname, lastname, email, mobile) async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   if (_formKey.currentState!.validate()) {
  //     // DialogHelper.showFlutterToast(strMsg: "Profile Update Successfully!");
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }
}
