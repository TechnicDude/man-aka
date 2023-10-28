import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manaqa_app/screens/searchpages.dart/searchui.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GlobalSearch extends StatefulWidget {
  const GlobalSearch({super.key});

  @override
  State<GlobalSearch> createState() => _GlobalSearchState();
}

class _GlobalSearchState extends State<GlobalSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(0.95),
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(50),
      //     child: AppBarScreens(
      //         // text: "Search",
      //         )),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              left: 2.h,
              right: 2.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Platform.isAndroid
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios,
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 6.h,
                      width: 80.w,
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.w)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3.w),
                            ),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              color: AppColors.colorGrey,
                              onPressed: () {},
                            ),
                            hintText: "search product...",
                            //Languages.of(context)!.searchcourse,
                            hintStyle: AppStyle.textsubsubtitle
                                .copyWith(fontSize: 15.sp)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //  Navigator.pushNamed(context, Routes.addtoCartScreen);
                      },
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 3.5.h,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SearchUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
