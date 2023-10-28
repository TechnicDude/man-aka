import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    final double sliderWidth = 30.w;
    //MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSlider(
              percentage: 12 / 100,
              width: sliderWidth,
            ),
            CustomSlider(
              percentage: 90 / 100,
              width: sliderWidth,
            ),
            CustomSlider(
              percentage: 50 / 100,
              width: sliderWidth,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  final double percentage;
  final double width;
  CustomSlider({
    required this.percentage,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 20.w,
            //  width: double.infinity,
            height: 1.h,
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
            width: 20.w,
            //percentage == 1 ? 0 : width * percentage,
            height: 2.h,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                percentage == 1 ? "0" : (percentage * 100).toString(),
                selectionColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// class Seekbar extends StatefulWidget {
//   double? valueHolder;
//   Seekbar({
//     Key? key,
//     this.valueHolder,
//   }) : super(key: key);

//   @override
//   State<Seekbar> createState() => _SeekbarState();
// }

// class _SeekbarState extends State<Seekbar> {
//   double _value = 20;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 70.w,
//       child: Slider(
//           min: 0.0,
//           max: 100.0,
//           activeColor: AppColors.appPrimarycolor,
//           inactiveColor: AppColors.colorGrey.withOpacity(0.2),
//           thumbColor: AppColors.appPrimarycolor,
//           value: _value,
//           onChanged: (value) {
//             setState(() {
//               _value = value;
//             });
//           }),
//     );
//   }
// }
