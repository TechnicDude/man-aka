import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appimages.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
          // backgroundColor: Colors.white.withOpacity(0.95),
          title: AppBarScreens(text: Languages.of(context)!.notifications)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 1.h, left: 2.h, right: 2.h, bottom: 0.2.h),
                      child: InkWell(
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: "delete",
                              onTap: () {
                                // _dialogBuilder;
                              },
                              iconWidget: Center(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                          child: Column(
                            children: [
                              ClayContainer(
                                borderRadius: 1.h,
                                height: 9.h,
                                // decoration: BoxDecoration(
                                //   color: Colors.white,
                                //   borderRadius: BorderRadius.circular(1.h),
                                //   boxShadow: [
                                //     BoxShadow(
                                //       color: Colors.grey,
                                //       spreadRadius: 1.5,
                                //       blurRadius: 1,
                                //       offset: Offset(1, 2),
                                //     ),
                                //   ],
                                // ),
                                child: Padding(
                                  padding: EdgeInsets.all(0.5.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 3.h,
                                          backgroundImage: AssetImage(
                                            AppImages.outro3,
                                          )),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 68.w,
                                            child: Text(
                                                'Start Your Online Business',
                                                style: AppStyle.textcatsubtitle
                                                    .copyWith(fontSize: 15.sp)),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          SizedBox(
                                            width: 68.w,
                                            child: Text(
                                                'Online Shopping Site for Fashion & Lifestyle, API is to build notify',
                                                style:
                                                    AppStyle.textsubsubtitle),
                                          ),
                                        ],
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
