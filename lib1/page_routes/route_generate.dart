import 'package:flutter/material.dart';
import 'package:manaqa_app/page_routes/routes.dart';
import 'package:manaqa_app/provider/addtocardProvider.dart';
import 'package:manaqa_app/provider/getaddressProvider.dart';
import 'package:manaqa_app/provider/homeprovider.dart';
import 'package:manaqa_app/provider/productdetailsProvider.dart';
import 'package:manaqa_app/provider/productsubcategories.dart';
import 'package:manaqa_app/provider/produtchProvider.dart';
import 'package:manaqa_app/provider/profileuserProvider.dart';
import 'package:manaqa_app/provider/sellerproductaddsform.dart';
import 'package:manaqa_app/provider/wishlistProvider.dart';
import 'package:manaqa_app/screens/CreateBidding/biddingScreen.dart';
import 'package:manaqa_app/screens/CreateBidding/bidding_form.dart';
import 'package:manaqa_app/screens/Home/category/allcategorylist.dart';
import 'package:manaqa_app/screens/Home/category/categorylist.dart';
import 'package:manaqa_app/screens/Home/components/categoryscreen.dart';
import 'package:manaqa_app/screens/Home/components/homecomponents/seller/sellerproductaddform.dart';
import 'package:manaqa_app/screens/Home/components/myaccount.dart';
import 'package:manaqa_app/screens/Home/filterscreen.dart';
import 'package:manaqa_app/screens/Home/homescreen.dart';
import 'package:manaqa_app/screens/Home/mainPage.dart';
import 'package:manaqa_app/screens/Home/mybiddingdetail.dart';
import 'package:manaqa_app/screens/Home/myorders/myordersscrreen.dart';
import 'package:manaqa_app/screens/Home/product_buy_form.dart';
import 'package:manaqa_app/screens/Home/product_details.dart';
import 'package:manaqa_app/screens/Home/productlist.dart';
import 'package:manaqa_app/screens/Home/productsubcategories.dart';
import 'package:manaqa_app/screens/OnBoardingScreen/onboarding_screen.dart';
import 'package:manaqa_app/screens/addtocard/addtocard.dart';
import 'package:manaqa_app/screens/myAccountSettings/components/contactus.dart';
import 'package:manaqa_app/screens/myAccountSettings/components/report.dart';

import 'package:manaqa_app/screens/myAccountSettings/components/shippingpolicy.dart';
import 'package:manaqa_app/screens/myAccountSettings/components/settingwebpage.dart';
import 'package:manaqa_app/screens/mycartpage/shopping_cart_page.dart';
import 'package:manaqa_app/screens/Home/subcategories.dart';
import 'package:manaqa_app/screens/Home/viewallcategoriesscreen.dart';
import 'package:manaqa_app/screens/change_language_screen.dart';
import 'package:manaqa_app/screens/introscreen/onboard.dart';
import 'package:manaqa_app/screens/introscreen/screenThreeonboard.dart';
import 'package:manaqa_app/screens/introscreen/screentwoonboard.dart';
import 'package:manaqa_app/screens/loginsignup/changenewpassword.dart';
import 'package:manaqa_app/screens/loginsignup/changepassword.dart';
import 'package:manaqa_app/screens/loginsignup/forgetpassword.dart';
import 'package:manaqa_app/screens/loginsignup/login.dart';
import 'package:manaqa_app/screens/loginsignup/otpverify.dart';
import 'package:manaqa_app/screens/loginsignup/signup.dart';
import 'package:manaqa_app/screens/mycartpage/shoppingcart.dart';
import 'package:manaqa_app/screens/notification/notification.dart';
import 'package:manaqa_app/screens/profile/addresspage/addressscreen.dart';
import 'package:manaqa_app/screens/profile/addresspage/editupdateaddress.dart';
import 'package:manaqa_app/screens/profile/editprofile.dart';
import 'package:manaqa_app/screens/profile/profilescreen.dart';
import 'package:manaqa_app/screens/searchpages.dart/globalsearch.dart';
import 'package:manaqa_app/screens/myAccountSettings/accountscreen.dart';
import 'package:manaqa_app/screens/splashscreen.dart';
import 'package:manaqa_app/screens/wishlistpage/wishlistScreen.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:provider/provider.dart';

import '../screens/profile/addresspage/createnewaddress.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    Widget widgetScreen;
    switch (settings.name) {
      case Routes.splashScreen:
        widgetScreen = SplashScreen();
        break;

      case Routes.changeLanguageScreen:
        widgetScreen = ChangeLanguageScreen();
        break;
      case Routes.onboardingScreen:
        widgetScreen = const OnboardingScreen();
        break;

      case Routes.onBoard:
        widgetScreen = const OnBoard();
        break;

      case Routes.OnBoardScreentwo:
        widgetScreen = const OnBoardScreentwo();
        break;

      case Routes.OnBoardScreenthree:
        widgetScreen = const OnBoardScreenthree();
        break;

      case Routes.loginScreen:
        widgetScreen = LoginScreenActivity();
        break;

      case Routes.signupScreen:
        widgetScreen = SignupScreenActivity();
        break;

      case Routes.forgetPassword:
        widgetScreen = ForgetPassword();
        break;

      case Routes.otpVerify:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = OtpVerify(
          email: args[AppStringFile.email],
        );
        break;

      case Routes.changenewPassword:
        widgetScreen = ChangenewPassword();
        break;

      case Routes.changePassword:
        widgetScreen = ChangePassword();
        break;

      case Routes.bottomNav:
        widgetScreen = MainPage();
        break;

      // case Routes.homeScreen:
      //   widgetScreen = HomeScreen();
      //   break;

      case Routes.viewallcategories:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ViewAllCategorieScreenActivity(
          getproductscategoriesModelDatas:
              args[AppStringFile.getproductscategoriesModelDatas],
        );
        break;

      case Routes.productsubcategories:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProductSubcategoriesProvider>(
            create: (BuildContext context) => ProductSubcategoriesProvider(),
            child: ProductSubCategoriesScreenActivity(
              subcategoriesid: args[AppStringFile.subcategoriesid],
              subcategoriesname: args[AppStringFile.subcategoriesname],
            ));
        break;
      case Routes.product:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProductProvider>(
            create: (BuildContext context) => ProductProvider(),
            child: ProductListScreenActivity(
              productid: args[AppStringFile.productid],
              productname: args[AppStringFile.productname],
            ));
        break;
      case Routes.categoryScreen:
        widgetScreen = CategoryScreen();
        break;

      case Routes.myAccount:
        widgetScreen = MyAccount();
        break;
      case Routes.filter:
        widgetScreen = FilterScreenActivity();
        break;
      case Routes.productDetails:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProductDatilsProvider>(
            create: (BuildContext context) => ProductDatilsProvider(),
            child: ProductDetailsPage(
              productid: args[AppStringFile.productid],
              productname: args[AppStringFile.productname],
              productcategoryid: args[AppStringFile.productcategoryid],
            ));
        break;
      case Routes.productBuynow:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ProductBuyForm(
          id: args[AppStringFile.productid],
          name: args[AppStringFile.productname],
          quantity: args[AppStringFile.quantity],
          price: args[AppStringFile.price],
          unity: args[AppStringFile.unity],
        );
        break;
      case Routes.mybidding:
        widgetScreen = BiddingDetailActivity();
        break;
      // case Routes.mybiddingform:
      //   widgetScreen = BiddingForm();
      //   break;

      // biddingForm
      case Routes.biddingScreen:
        widgetScreen = BiddingScreen();
        break;

      case Routes.biddingForm:
        widgetScreen = BiddingForm(
          quantity: '1',
        );
        break;

      case Routes.profileScreen:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: ProfileScreen());
        break;
      case Routes.editProfile:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: EditProfile(
              profileuserdata: args[AppStringFile.profileuserdata],
            ));
        break;

      // case Routes.subcategories:
      //   widgetScreen = SubCategoriesScreenActivity();
      //   break;
      case Routes.shoppingCartPage:
        widgetScreen = ShoppingCartPage();
        break;

      case Routes.myCategorylistScreenActivity:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: MyCategorylistScreenActivity());
        break;
      case Routes.allCategoryList:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: AllCategoryList());
        break;

      case Routes.shoppingCart:
        widgetScreen = ShoppingCart();
        break;
      case Routes.globalSearch:
        widgetScreen = GlobalSearch();
        break;

      case Routes.notificationScreen:
        widgetScreen = NotificationScreen();
        break;
      // case Routes.notificationScreen:
      //   widgetScreen = NotificationScreen();
      //   break;

      // case Routes.accountScreen:
      //   widgetScreen = AccountScreen();
      //   break;

      case Routes.accountScreen:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: AccountScreen());
        break;

      case Routes.contactus:
        widgetScreen = ContactUs();
        break;

      case Routes.termsAndCondition:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = TermsAndCondition(
          url: args[AppStringFile.url],
          title: args[AppStringFile.title],
        );
        break;
      case Routes.feedbacks:
        widgetScreen = Feedbacks();
        break;

      case Routes.shippingpolicy:
        widgetScreen = ShippingPolicy();
        break;

      case Routes.editUpdateAddressScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<GetaddressProvider>(
            create: (BuildContext context) => GetaddressProvider(),
            child: EditUpdateAddressScreen(
              getaddressdata: args[AppStringFile.getaddressdata],
            ));
        break;

      case Routes.customerAddressScreen:
        widgetScreen = ChangeNotifierProvider<GetaddressProvider>(
            create: (BuildContext context) => GetaddressProvider(),
            child: CustomerAddressScreen());
        break;
      case Routes.wishlistScreen:
        widgetScreen = ChangeNotifierProvider<WishlistProvider>(
            create: (BuildContext context) => WishlistProvider(),
            child: WishlistScreen());
        break;

      case Routes.addnewaddressScreen:
        widgetScreen = AddnewaddressScreen();
        break;

      // case Routes.addToCardScreenActivity:
      //   widgetScreen = AddToCardScreenActivity();
      //   break;

      case Routes.addToCardScreenActivity:
        widgetScreen = ChangeNotifierProvider<AddtoCardProductListProvider>(
            create: (BuildContext context) => AddtoCardProductListProvider(),
            child: AddToCardScreenActivity());
        break;

      case Routes.myordersScreen:
        widgetScreen = MyordersScreen();
        break;

      //seller
      case Routes.sellerproductaddform:
        widgetScreen = ChangeNotifierProvider<SellerProductAddFormProvider>(
            create: (BuildContext context) => SellerProductAddFormProvider(),
            child: SellerProductaddFormScreenActivity());
        break;

      default:
        widgetScreen = SplashScreen();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
