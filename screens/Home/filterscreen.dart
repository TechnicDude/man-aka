import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/screens/Home/components/filter/colorsfilterscreen.dart';
import 'package:manaqa_app/screens/Home/components/filter/sizefilterscaren.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterScreenActivity extends StatefulWidget {
  const FilterScreenActivity({super.key});

  @override
  State<FilterScreenActivity> createState() => _FilterScreenActivityState();
}

class _FilterScreenActivityState extends State<FilterScreenActivity> {
  List<String> filtertype = [
    "Size",
    "Color",
    "Brand",
    "Categories",
    "Bundles",
    "More Filters",
    "Price Range",
    "Discount",
    "Delivery Time",
    "Size",
    "Color",
    "Brand",
    "Categories",
    "Bundles",
    "More Filters",
    "Price Range",
    "Discount",
    "Delivery Time"
  ];
  List<bool> fiterselectvalue = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<Widget> filterbody = [
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
    SizeFilterScreenActivity(),
    ColorsFilterScreenActivity(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbakgroundcolor,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 12, left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextStyle(
                  text: Languages.of(context)!.filter,
                  style: AppStyle.cardssubtitle,
                ),
                TitleTextStyle(
                  text: "CLEAR ALL",
                  style: AppStyle.cardssubtitle.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 30.w,
                  height: 80.h,
                  color: Colors.grey.withOpacity(.4),
                  child: ListView.builder(
                      itemCount: filtertype.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            for (int i = 0; i < fiterselectvalue.length; i++) {
                              setState(() {
                                fiterselectvalue[i] = false;
                              });
                            }
                            setState(() {
                              fiterselectvalue[index] = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fiterselectvalue[index]
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 15.0,
                                      left: 4,
                                      right: 4),
                                  child:
                                      TitleTextStyle(text: filtertype[index]),
                                ),
                                Container(
                                  width: 100.w,
                                  height: .01.h,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                for (int i = 0; i < fiterselectvalue.length; i++)
                  if (fiterselectvalue[i])
                    SizedBox(
                        width: 100.w - 30.w, height: 80.h, child: filterbody[i])
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
