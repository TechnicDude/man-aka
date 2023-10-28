import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/banner_model.dart';
import 'package:manaqa_app/model/getproductModel.dart';
import 'package:manaqa_app/model/getproductscategoriesModel.dart';
import 'package:manaqa_app/model/profileuserModel.dart';
import 'package:manaqa_app/utils/apphelper.dart';

class DashBoradProvider extends ChangeNotifier {
  ProfileUserModel profileuserModel = ProfileUserModel();
  HomeDashboardModel homeDashboardModel = HomeDashboardModel();
  GetproductscategoriesModel getproductListModel = GetproductscategoriesModel();
  GetproductModel getsellerproductListModel = GetproductModel();
  List<GetproductModelDatas> _getsellerproduct = [];
  List<GetproductModelDatas> get getsellerproduct => _getsellerproduct;

  List<ProfileUserData> _profileuserlist = [];
  List<ProfileUserData> get profileuserList => _profileuserlist;

  List<String> _bannerlist = [];
  List<String> get bannerList => _bannerlist;

  List<GetproductscategoriesModelDatas> _getproductcategories = [];
  List<GetproductscategoriesModelDatas> get getproductcategories =>
      _getproductcategories;

  List<BestSellingProducts> _bestSellingProductslist = [];
  List<BestSellingProducts> get bestSellingProductsList =>
      _bestSellingProductslist;

  bool datanotfound = false;
  bool profilefetch = false;
  bool bannerfetch = false;
  bool getproductcategorieslistfetch = false;
  bool getsellerproductlistfetch = false;
  bool bestsellingproductfetch = false;

  Future profileuserlist() async {
    profilefetch = false;
    ServiceWithHeader service =
        ServiceWithHeader(ApiUrl.userprofile + "?id=${AppHelper.userid}");

    final response = await service.data();

    profileuserModel = ProfileUserModel.fromJson(response);
    _profileuserlist = [];

    if (profileuserModel.data != null) {
      //  var profileuser = profileuserModel.data;
      AppHelper.person = profileuserModel.data;
      print("profile data");
      print(AppHelper.person);
    }
    profilefetch = true;
    notifyListeners();
    return;
  }

  Future bannerlist() async {
    bannerfetch = false;
    _bannerlist = [];
    try {
      ServiceWithHeader service = ServiceWithHeader(ApiUrl.homedashboard);
      final response = await service.data();
      homeDashboardModel = HomeDashboardModel.fromJson(response);

      if (homeDashboardModel.data != null) {
        if (homeDashboardModel.data!.banners!.isNotEmpty) {
          for (int i = 0; i < homeDashboardModel.data!.banners!.length; i++) {
            _bannerlist.add(homeDashboardModel.data!.banners![i]);
          }
        }
      }
    } catch (e) {
      print(e);
    }
    bannerfetch = true;
    notifyListeners();
    return;
  }

  Future bestsellingproductlist() async {
    bestsellingproductfetch = false;
    _bestSellingProductslist = [];

    try {
      ServiceWithHeader service = ServiceWithHeader(ApiUrl.homedashboard);
      final response = await service.data();
      homeDashboardModel = HomeDashboardModel.fromJson(response);
      _bestSellingProductslist = [];
      if (homeDashboardModel.status.toString().toLowerCase() == "success") {
        if (homeDashboardModel.data != null) {
          if (homeDashboardModel.data!.bestSellingProducts!.isNotEmpty) {
            for (int i = 0;
                i < homeDashboardModel.data!.bestSellingProducts!.length;
                i++) {
              _bestSellingProductslist
                  .add(homeDashboardModel.data!.bestSellingProducts![i]);
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
    bestsellingproductfetch = true;
    notifyListeners();
    return;
  }

  Future getproductcategorieslist() async {
    getproductcategorieslistfetch = false;
    _getproductcategories = [];
    try {
      ServiceWithoutbody _service =
          ServiceWithoutbody(ApiUrl.productscategories);
      final response = await _service.data();
      getproductListModel = GetproductscategoriesModel.fromJson(response);
      if (getproductListModel.status.toString().toLowerCase() == "success") {
        if (getproductListModel.data != null) {
          if (getproductListModel.data!.data!.isNotEmpty) {
            for (int i = 0; i < getproductListModel.data!.data!.length; i++) {
              _getproductcategories.add(getproductListModel.data!.data![i]);
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
    getproductcategorieslistfetch = true;
    notifyListeners();
    return;
  }

  Future getsellerproductlist() async {
    getsellerproductlistfetch = false;
    _getsellerproduct = [];

    try {
      ServiceWithoutbody _service = ServiceWithoutbody(ApiUrl.products);
      final response = await _service.data();
      getsellerproductListModel = GetproductModel.fromJson(response);
      if (getsellerproductListModel.status.toString().toLowerCase() ==
          "success") {
        if (getsellerproductListModel.data != null) {
          if (getsellerproductListModel.data!.data!.isNotEmpty) {
            for (int i = 0;
                i < getsellerproductListModel.data!.data!.length;
                i++) {
              _getsellerproduct.add(getsellerproductListModel.data!.data![i]);
            }
          }
        }
      }
    } catch (e) {
      print(e);
    }
    getsellerproductlistfetch = true;
    notifyListeners();
    return;
  }
}
