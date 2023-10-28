import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:manaqa_app/api/likeapi.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getaddressModel.dart';
import 'package:manaqa_app/model/wishlistModel.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/getaddressProvider.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/apphelper.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/dialoghelper.dart';
import 'package:manaqa_app/utils/loaderscreen.dart';
import 'package:manaqa_app/utils/nodatafoundscreen.dart';
import 'package:manaqa_app/utils/nointernetconnection.dart';
import 'package:manaqa_app/utils/button/viewbutton.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomerAddressScreen extends StatefulWidget {
  const CustomerAddressScreen({super.key});

  @override
  State<CustomerAddressScreen> createState() => _CustomerAddressScreenState();
}

class _CustomerAddressScreenState extends State<CustomerAddressScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  GetaddressProvider _getaddressProvider = GetaddressProvider();

  @override
  void initState() {
    // TODO: implement initState
    _getaddressProvider =
        Provider.of<GetaddressProvider>(context, listen: false);
    fetchdatas();

    super.initState();
  }

  bool isPressed = false;
  TextEditingController sercheditcontroler = TextEditingController();
  String searchString = '';
  bool searchshow = false;

  List<GetaddressDataData> getaddressdata = [];
  bool datashow = false;

  Future fetchdatas() async {
    await _getaddressProvider.getaddress();
  }

  Future deleteaddresses(String addressid) async {
    // var body = {"id": addressid};
    //"id": addressid;
    var id = {
      "id": addressid,
    };

    LikeApi _likeapi = new LikeApi(id);
    final response = await _likeapi.deleteaddress(addressid);
    print(response);

    if (response['status'] == "success") {
      DialogHelper.showFlutterToast(strMsg: response['message']);
      fetchdatas();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.appbakgroundcolor,
        appBar: AppBar(
            //backgroundColor: AppColors.appbakgroundcolor,
            title: AppBarScreens(text: Languages.of(context)!.checkout)),
        body:
            Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected
                ? InternetNotAvailable()
                : Consumer<GetaddressProvider>(
                    builder: (context, getaddressProvider, child) {
                    return SafeArea(
                      child: Column(
                        children: [
                          Expanded(
                            child: Theme(
                              data: ThemeData(
                                  accentColor: AppColors.colorGrey,
                                  primarySwatch: Colors.blue,
                                  colorScheme: ColorScheme.light(
                                      primary: AppColors.primarycolor)),
                              child: Stepper(
                                type: StepperType.horizontal,
                                physics: ScrollPhysics(),
                                currentStep: _currentStep,
                                onStepTapped: (step) => tapped(step),
                                onStepContinue: continued,
                                onStepCancel: cancel,
                                elevation: 0,
                                steps: <Step>[
                                  Step(
                                    title: Text(
                                      '',
                                    ),
                                    content: Column(
                                      children: [
                                        if (!getaddressProvider.datanotfound)
                                          SizedBox(
                                              height: 80.h,
                                              child: Center(
                                                  child: LoaderScreen())),
                                        if (getaddressProvider.datanotfound)
                                          if (getaddressProvider
                                              .getaddressList.isEmpty)
                                            NoDataFoundErrorScreens(),
                                        if (getaddressProvider.datanotfound)
                                          if (getaddressProvider
                                              .getaddressList.isNotEmpty)
                                            ListView.builder(
                                                itemCount: getaddressProvider
                                                    .getaddressList.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 0.5.h,
                                                        bottom: 1.h),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClayContainer(
                                                          borderRadius: 1.h,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.h),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              48.w,
                                                                          child: Text(
                                                                              getaddressProvider.getaddressList[index].city!,
                                                                              style: AppStyle.textcatsubtitle.copyWith(fontSize: 15.sp)),
                                                                        ),

                                                                        SizedBox(
                                                                          width:
                                                                              5.w,
                                                                        ),

                                                                        // ClayContainer(
                                                                        //   height:
                                                                        //       3.h,
                                                                        //   width:
                                                                        //       15.w,
                                                                        //   curveType:
                                                                        //       CurveType.convex,
                                                                        //   emboss:
                                                                        //       true,
                                                                        //   child:
                                                                        //       Center(
                                                                        //     child:
                                                                        //         Text('Default', style: AppStyle.textsubsubtitle.copyWith(color: AppColors.primarycolor)),
                                                                        //   ),
                                                                        // ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          0.5.h,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          68.w,
                                                                      child: Text(
                                                                          getaddressProvider
                                                                              .getaddressList[
                                                                                  index]
                                                                              .localAddress!,
                                                                          style:
                                                                              AppStyle.textsubsubtitle),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          0.5.h,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          68.w,
                                                                      child: Text(
                                                                          getaddressProvider
                                                                              .getaddressList[
                                                                                  index]
                                                                              .zipcode!,
                                                                          style:
                                                                              AppStyle.textsubsubtitle),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          68.w,
                                                                      child: Text(
                                                                          getaddressProvider
                                                                              .getaddressList[
                                                                                  index]
                                                                              .contact!,
                                                                          style:
                                                                              AppStyle.textsubsubtitle),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          0.5.h,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        ViewButtonWidget(
                                                                          padding:
                                                                              EdgeInsets.all(6.0),
                                                                          height:
                                                                              3.5.h,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(1.w)),
                                                                          finalbuttextstyle: AppStyle.cardssubtitle.copyWith(
                                                                              color: AppColors.colorBlack,
                                                                              fontSize: 14.sp,
                                                                              fontWeight: FontWeight.bold),
                                                                          onTap:
                                                                              () {
                                                                            deleteaddresses(
                                                                              getaddressProvider.getaddressList[index].id.toString(),
                                                                            );
                                                                          },
                                                                          textcolor:
                                                                              AppColors.colorBlack,
                                                                          boxcolor:
                                                                              AppColors.colorWhite,
                                                                          bordercolor:
                                                                              AppColors.colorGrey,
                                                                          text:
                                                                              "Delete",
                                                                          //Languages.of(context)!.buy,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5.w,
                                                                        ),
                                                                        ViewButtonWidget(
                                                                            padding: EdgeInsets.all(
                                                                                6.0),
                                                                            height: 3.5
                                                                                .h,
                                                                            borderRadius: BorderRadius.all(Radius.circular(1
                                                                                .w)),
                                                                            finalbuttextstyle: AppStyle.cardssubtitle.copyWith(
                                                                                color: AppColors.primarycolor,
                                                                                fontSize: 14.sp,
                                                                                fontWeight: FontWeight.bold),
                                                                            onTap: () {},
                                                                            textcolor: AppColors.primarycolor,
                                                                            boxcolor: AppColors.colorWhite,
                                                                            bordercolor: AppColors.primarycolor,
                                                                            text: "Deliver to this Address"
                                                                            //Languages.of(context)!.buy,
                                                                            ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            Routes
                                                                                .editUpdateAddressScreen,
                                                                            arguments: {
                                                                              AppStringFile.getaddressdata: getaddressProvider.getaddressList[index],
                                                                            }).then(
                                                                            (value) {
                                                                          _getaddressProvider
                                                                              .getaddress();
                                                                        });
                                                                      },
                                                                      child: Icon(
                                                                          Icons
                                                                              .edit),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    Routes.addnewaddressScreen,
                                                    arguments: {
                                                      AppStringFile
                                                              .getaddressdata:
                                                          getaddressProvider
                                                              .getaddressList,
                                                    }).then((value) {
                                                  _getaddressProvider
                                                      .getaddress();
                                                });
                                              },
                                              child: ClayContainer(
                                                height: 4.h,
                                                width: 40.w,
                                                // borderRadius: BorderSide
                                                //     .strokeAlignCenter,
                                                curveType: CurveType.convex,
                                                emboss: true,
                                                child: Center(
                                                  child: Text(
                                                      '+ Add New Address',
                                                      style: AppStyle
                                                          .textsubsubtitle
                                                          .copyWith(
                                                              fontSize: 16.sp,
                                                              color: AppColors
                                                                  .primarycolor)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    ),
                                    isActive: _currentStep >= 0,
                                    state: _currentStep >= 0
                                        ? StepState.complete
                                        : StepState.disabled,
                                  ),
                                  Step(
                                    title: new Text(''),
                                    content: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Home Address'),
                                        ),
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Postcode'),
                                        ),
                                      ],
                                    ),
                                    isActive: _currentStep >= 0,
                                    state: _currentStep >= 1
                                        ? StepState.complete
                                        : StepState.disabled,
                                  ),
                                  Step(
                                    title: new Text(''),
                                    content: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          decoration: InputDecoration(
                                              labelText: 'Mobile Number'),
                                        ),
                                      ],
                                    ),
                                    isActive: _currentStep >= 0,
                                    state: _currentStep >= 2
                                        ? StepState.complete
                                        : StepState.disabled,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }));
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
    SizedBox(
      height: 2.h,
    );
  }
}
