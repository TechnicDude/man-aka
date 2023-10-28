import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;
  String get labelWelcome;
  String get labelInfo;
  String get labelChangeLanguage;
  String get labelSelectLanguage;

  //onborard screen
  String get onboardtitle;
  String get onboardsubtitle;
  String get onboardstarts;

  String get name;
  String get email;
  String get password;
  String get confirmpassword;
  String get mobile;

  String get pleaseenteremail;
  String get pleaseentervalidemail;
  String get pleaseenterpassword;
  String get pleaseentervalidpassword;

// authentication part
  String get login;

  String get logout;
  String get loginsussces;
  String get signup;
  String get forgotpassword;
  String get sendrequest;
  String get passwordrequest;
  String get passwordrequestmsg;
  String get otpverify;
  String get verify;
  String get submit;
  String get changenewpassword;
  String get changepassword;
  String get rememberyourpassword;
  String get plzenterotpverify;

  //dashboard part
  String get home;
  String get categories;
  String get bidding;
  String get profile;
  String get categoriesonly;
  String get category;
  String get pleaseselcectcategory;
  String get pleaseselcectsubcategory;
  String get pleaseselcectbrand;
  String get brand;
  String get slug;
  String get gender;
  String get male;
  String get female;
  String get other;
  String get all;

  String get subcategories;
  String get viewallcategories;
  String get currentruningbids;
  String get myproductlist;

// social login
  String get loginwithgoogle;
  String get loginwithfb;
  String get loginwithapple;
  String get orloginwith;
  String get donthaveaccount;

  String get otpnotrecive;
  String get resend;
  String get skip;
  String get done;
  String get alreadyregister;
  String get iacceptthe;
  String get termsandcondition;
  String get firstname;
  String get lastname;

  String get next;
  String get sellers;
  String get customers;
  String get role;
  String get rolemessage;
  String get alter;
  String get pleaseaccettermesandcondtions;
  String get confirmpasswordandpasswordnotmatch;
  String get price;
  String get bid;
  String get selectoption;

  String get soldBy;
  String get unit;
  String get mrp;
  String get productdetails;
  String get description;
  String get buy;
  String get productname;
  String get address;
  String get pincode;

  String get orderagain;
  String get bestsellingproducts;
  String get quantity;
  String get allreview;
  String get relatedproducts;
  String get sort;
  String get filter;

  //settings
  String get myaccount;
  String get contactus;
  String get feedback;
  String get privacypolicy;
  String get cookiespolicy;
  String get accountsettings;
  String get helpnsupport;
  String get aboutmanaqa;
  String get rateapp;
  String get shareapp;
  String get changelanguage;
  String get shippingpolicy;
  String get cancelationpolicy;
  String get nointernetconnection;
  String get update;
  String get editprofile;
  String get deleteaccount;
  String get logoutmanaqamsg;
  String get deleteaccountmsg;
  // app translation
  String get cart;
  String get myorder;
  String get wishlist;
  String get settings;
  String get nodatafound;
  String get search;
  String get biddingform;
  String get searchyourorder;

// bidding form
  String get cancel;
  String get startbidding;
  String get enterdescription;
  String get biddingprice;
  String get productquantity;
  String get productsname;
  String get productsubcategory;
  String get productcategory;
  String get addtocart;
  String get checkout;
  String get notifications;
  //others
  String get remove;
  String get productadd;

  //productform

  String get timePeriod;
  String get orderMinimumQuantity;
  String get unitvalue;
  String get unittype;
  String get productsku;
  String get stockquantity;
  String get weigth;
  String get regularprice;
  String get saleprice;
  String get discount;
  String get productCoverImage;
  String get productgalleryImages;
  String get title;
  String get report;
}
