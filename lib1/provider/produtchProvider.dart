import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/getproductModel.dart';

import 'package:manaqa_app/model/productSubcategoriesModel.dart';

class ProductProvider extends ChangeNotifier {
  int pageNumrecipe = 1;
  GetproductModel getproductListModel = GetproductModel();
  List<GetproductModelDatas> _getproduct = [];
  List<GetproductModelDatas> get getproduct => _getproduct;

  bool getproductsubcategorieslistfetch = false;

  bool isFirstdatafound = true;
  bool isLoadMoreRunning = false;
  bool hasfirst = true;
  bool datanotfound = false;

  Future getproductsubcategorieslist(
      String productsubcategoriesid, int page, String productname) async {
    // if (page == 1) {
    //   datanotfound = false;
    //   isFirstdatafound = true;
    // }

    if (page == 1) {
      getproductsubcategorieslistfetch = false;
      isFirstdatafound = true;
      datanotfound = false;

      _getproduct = [];
    }

    // try {
    ServiceWithHeader _service = ServiceWithHeader(ApiUrl.products +
        "?product_sub_category_id=$productsubcategoriesid" +
        "&page=${page.toString()}&name=${productname.toString()}");
    final response = await _service.data();
    getproductListModel = GetproductModel.fromJson(response);
    if (getproductListModel.status.toString().toLowerCase() == "success") {
      if (getproductListModel.data != null) {
        if (getproductListModel.data!.data!.isNotEmpty) {
          for (int i = 0; i < getproductListModel.data!.data!.length; i++) {
            _getproduct.add(getproductListModel.data!.data![i]);
          }
        } else {
          if (page == 1) {
            getproductsubcategorieslistfetch = true;
          }
          hasfirst = false;
        }
      } else {
        if (page == 1) {
          getproductsubcategorieslistfetch = true;
        }
        hasfirst = false;
      }
    } else {
      if (page == 1) {
        getproductsubcategorieslistfetch = true;
      }
      hasfirst = false;
    }
    // } catch (e) {
    //   print(e);
    // }
    if (page == 1) {
      getproductsubcategorieslistfetch = true;
    }
    isFirstdatafound = false;
    notifyListeners();

    return;
  }

  Future loadMore(String subcategoryid, String productname) async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await getproductsubcategorieslist(
          subcategoryid, pageNumrecipe, productname);

      isLoadMoreRunning = false;
    }
  }
}
