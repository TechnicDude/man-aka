// import 'package:flutter/material.dart';

// import 'package:manaqa_app/page_routes/routes.dart';
// import 'package:manaqa_app/screens/Home/drawer/menubar.dart';
// import 'package:manaqa_app/utils/appcolors.dart';
// import 'package:manaqa_app/utils/appimages.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColors.colorWhite,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               // icon: const Icon(Icons.menu_rounded),
//               icon: Image.asset(
//                 AppImages.navbar,
//               ),

//               color: AppColors.colorBlack,
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             );
//           },
//         ),
//         automaticallyImplyLeading: false,
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, Routes.globalSearch);
//                 },
//                 icon: const Icon(Icons.search),
//                 color: AppColors.colorBlack,
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, Routes.biddingForm);
//                 },
//                 icon: const Icon(Icons.add_box_rounded),
//                 color: AppColors.colorBlack,
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, Routes.notificationScreen);
//                 },
//                 icon: const Icon(Icons.notifications_outlined),
//                 color: AppColors.colorBlack,
//               ),
//             ],
//           ),
//         ],
//       ),
//       drawer: MenuBarScreens(),
//       body: SafeArea(
//         bottom: false,
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("Home Screen"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
