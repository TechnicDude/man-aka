import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/title_text_style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ColorsFilterScreenActivity extends StatefulWidget {
  const ColorsFilterScreenActivity({super.key});

  @override
  State<ColorsFilterScreenActivity> createState() =>
      _ColorsFilterScreenActivityState();
}

class _ColorsFilterScreenActivityState
    extends State<ColorsFilterScreenActivity> {
  List<String> sizefilter = [
    "Pink",
    "Red",
    "Green",
    "Amber",
    "Yellow",
    "Blue",
    "Indigo",
    "Pink",
    "Red",
    "Green",
    "Amber",
    "Yellow",
    "Blue",
    "Indigo",
  ];
  List<Color> colordatacode = [
    Colors.pink,
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.yellow,
    Colors.blue,
    Colors.indigo,
    Colors.pink,
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.yellow,
    Colors.blue,
    Colors.indigo,
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
                    Container(
                      width: 5.w,
                      height: 5.w,
                      color: colordatacode[index],
                    ),
                    SizedBox(
                      width: 2.w,
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
