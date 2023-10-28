// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:manaqa_app/page_routes/routes.dart';
// import 'package:manaqa_app/themes/light_color.dart';
// import 'package:manaqa_app/themes/theme.dart';
// import 'package:manaqa_app/utils/appcolors.dart';
// import 'package:manaqa_app/utils/appstyle.dart';
// import 'package:manaqa_app/utils/title_text_style.dart';
// import 'package:manaqa_app/utils/widgets/extentions.dart';
// import 'package:manaqa_app/utils/widgets/title_text.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class SubCategoriesScreenActivity extends StatefulWidget {
//   final Function? callback;
//   const SubCategoriesScreenActivity({
//     super.key,
//     this.callback,
//   });

//   @override
//   State<SubCategoriesScreenActivity> createState() =>
//       _SubCategoriesScreenActivityState();
// }

// class _SubCategoriesScreenActivityState
//     extends State<SubCategoriesScreenActivity> {
//   Widget _icon(
//     IconData icon, {
//     Color color = AppColors.iconColor,
//     double size = 20,
//     double padding = 10,
//     bool isOutLine = false,
//     Function? onPressed,
//   }) {
//     return Container(
//       height: 40,
//       width: 40,
//       padding: EdgeInsets.all(padding),
//       // margin: EdgeInsets.all(padding),
//       decoration: BoxDecoration(
//         border: Border.all(
//             color: AppColors.iconColor,
//             style: isOutLine ? BorderStyle.solid : BorderStyle.none),
//         borderRadius: BorderRadius.all(Radius.circular(13)),
//         color:
//             isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//               color: Color(0xfff8f8f8),
//               blurRadius: 5,
//               spreadRadius: 10,
//               offset: Offset(5, 5)),
//         ],
//       ),
//       child: Icon(icon, color: color, size: size),
//     ).ripple(() {
//       if (onPressed != null) {
//         onPressed();
//       }
//     }, borderRadius: BorderRadius.all(Radius.circular(13)));
//   }

//   Widget _appBar() {
//     return Container(
//       padding: AppTheme.padding,
//       child: Row(
//         children: <Widget>[
//           _icon(
//             Icons.arrow_back_ios,
//             color: Colors.black54,
//             size: 15,
//             padding: 12,
//             isOutLine: true,
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TitleTextStyle(
//             text: '  Categories Name',
//             style: AppStyle.texttitlemain,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _productionlist() {
//     return GridView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 1 / 1.2,
//             mainAxisSpacing: 1,
//             crossAxisSpacing: 1),
//         itemCount: 20,
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: LightColor.background,
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                       color: Color(0xfff8f8f8), blurRadius: 3, spreadRadius: 3),
//                 ],
//               ),
//               // margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: <Widget>[
//                     // Positioned(
//                     //   left: 0,
//                     //   top: 0,
//                     //   child: IconButton(
//                     //     icon: Icon(
//                     //       product.isliked ? Icons.favorite : Icons.favorite_border,
//                     //       color:
//                     //           product.isliked ? LightColor.red : LightColor.iconColor,
//                     //     ),
//                     //     onPressed: () {},
//                     //   ),
//                     // ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         // SizedBox(height: product.isSelected ? 15 : 0),
//                         Expanded(
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: <Widget>[
//                               CircleAvatar(
//                                 radius: 40,
//                                 backgroundColor:
//                                     LightColor.orange.withAlpha(40),
//                                 backgroundImage: AssetImage(
//                                   "assets/images/pic1.jpg",
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         // SizedBox(height: 5),
//                         TitleTextStyle(
//                           text: "Product name",
//                           style: AppStyle.cardtitle,
//                           // fontSize: product.isSelected ? 16 : 14,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TitleTextStyle(
//                               text: "Number of bids",
//                               style: AppStyle.cardssubtitle
//                                   .copyWith(fontSize: 12.sp),
//                               // fontSize: product.isSelected ? 16 : 14,
//                             ),
//                             TitleText(
//                               text: "0",
//                               // fontSize: product.isSelected ? 14 : 12,
//                               color: LightColor.orange,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TitleTextStyle(
//                               text: "Quantity",
//                               style: AppStyle.cardssubtitle
//                                   .copyWith(fontSize: 12.sp),
//                               // fontSize: product.isSelected ? 16 : 14,
//                             ),
//                             TitleTextStyle(
//                               text: "100 UNITS",
//                               // fontSize: product.isSelected ? 14 : 12,
//                               style: AppStyle.cardssubtitle,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TitleTextStyle(
//                               text: "Time to end",
//                               style: AppStyle.cardssubtitle
//                                   .copyWith(fontSize: 12.sp),
//                               // fontSize: product.isSelected ? 16 : 14,
//                             ),
//                             TitleTextStyle(
//                               text: "23:40:00",
//                               // fontSize: product.isSelected ? 14 : 12,
//                               style: AppStyle.cardssubtitle
//                                   .copyWith(color: AppColors.orange),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ).ripple(() {
//                 // Navigator.of(context).pushNamed('/detail');
//                 // onSelected(product);
//                 Navigator.pushNamed(context, Routes.mybidding);
//               }, borderRadius: BorderRadius.all(Radius.circular(20))),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _appBar(),
//               _productionlist(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
