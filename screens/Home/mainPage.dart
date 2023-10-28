import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/provider/addtocardProvider.dart';
import 'package:manaqa_app/provider/homeprovider.dart';
import 'package:manaqa_app/provider/profileuserProvider.dart';
import 'package:manaqa_app/screens/CreateBidding/bidding_form.dart';
import 'package:manaqa_app/screens/Home/category/categorylist.dart';
import 'package:manaqa_app/screens/Home/drawer/menubar.dart';
import 'package:manaqa_app/screens/Home/home_page.dart';
import 'package:manaqa_app/screens/addtocard/addtocard.dart';
import 'package:manaqa_app/screens/mycartpage/shopping_cart_page.dart';
import 'package:manaqa_app/screens/profile/profilescreen.dart';
import 'package:manaqa_app/utils/appbar/appcolors.dart';
import 'package:manaqa_app/utils/appstyle.dart';
import 'package:manaqa_app/utils/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:manaqa_app/utils/widgets/extentions.dart';
import 'package:manaqa_app/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  List page = [];

  int _selectindex = 0;
  onBottomIconPressed(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetdata();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetdata() {
    page = [
      ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: MyHomePage(
            callback: (value) {
              if (value == "okopen") {
                _key.currentState!.openDrawer();
              }
            },
          )),
      ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: MyCategorylistScreenActivity(
              // callback: (value) {
              //   if (value == "okopen") {
              //     _key.currentState!.openDrawer();
              //   }
              // },
              )),
      // BiddingForm(
      //   quantity: '1',
      // ),

      ChangeNotifierProvider<AddtoCardProductListProvider>(
          create: (BuildContext context) => AddtoCardProductListProvider(),
          child: AddToCardScreenActivity()),
      ChangeNotifierProvider<ProfileUserProvider>(
          create: (BuildContext context) => ProfileUserProvider(),
          child: ProfileScreen()),
    ];
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.appbakgroundcolor,
      drawer: MenuBarScreens(),
      body: SafeArea(child: page[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: AppColors.primarycolor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: Languages.of(context)!.home,
                  textStyle: AppStyle.textcatsubtitle
                      .copyWith(color: AppColors.primarycolor),
                ),
                GButton(
                  icon: Icons.widgets_rounded,
                  text: Languages.of(context)!.categoriesonly,
                  textStyle: AppStyle.textcatsubtitle
                      .copyWith(color: AppColors.primarycolor),
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: Languages.of(context)!.cart,
                  textStyle: AppStyle.textcatsubtitle
                      .copyWith(color: AppColors.primarycolor),
                ),
                GButton(
                  icon: Icons.person,
                  text: Languages.of(context)!.profile,
                  textStyle: AppStyle.textcatsubtitle
                      .copyWith(color: AppColors.primarycolor),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
