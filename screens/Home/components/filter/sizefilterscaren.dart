import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SizeFilterScreenActivity extends StatefulWidget {
  const SizeFilterScreenActivity({super.key});

  @override
  State<SizeFilterScreenActivity> createState() =>
      _SizeFilterScreenActivityState();
}

class _SizeFilterScreenActivityState extends State<SizeFilterScreenActivity> {
  List<String> sizefilter = [
    "3XS",
    "XXL",
    "XL",
    "S",
    "M",
    "M/L",
    "L",
    "3XS",
    "XXL",
    "XL",
    "S",
    "M",
    "M/L",
    "L"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: sizefilter.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TitleTextStyle(
                      text: sizefilter[index],
                      style: AppStyle.cardtitle,
                    ),
                    Spacer(),
                    TitleTextStyle(
                      text: "1",
                      style: AppStyle.cardtitle,
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          );
        
        
        });
  }
}
