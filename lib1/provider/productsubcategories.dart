import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/getproductscategoriesModel.dart';
import 'package:manaqa_app/model/productSubcategoriesModel.dart';

class ProductSubcategoriesProvider extends ChangeNotifier {
  int pageNumrecipe = 1;
  GetproductSubcategoriesModel getproductListModel =
      GetproductSubcategoriesModel();
  List<GetproductSubcategoriesModelDatas> _getproductsubcategories = [];
  List<GetproductSubcategoriesModelDatas> get getproductsubcategories =>
      _getproductsubcategories;

  bool getproductsubcategorieslistfetch = false;
  bool isFirstdatafound = true;
  bool isLoadMoreRunning = false;
  bool hasfirst = true;

  Future getproductsubcategorieslist(
      String productsubcategoriesid, int page) async {
    if (page == 1) {
      getproductsubcategorieslistfetch = false;
      isFirstdatafound = true;
      _getproductsubcategories = [];
    }

    // try {
    ServiceWithoutbody _service = ServiceWithoutbody(
        ApiUrl.productssubcategories +
            "?product_category_id=$productsubcategoriesid" +
            "&page=${page.toString()}");
    final response = await _service.data();
    getproductListModel = GetproductSubcategoriesModel.fromJson(response);
    if (getproductListModel.status.toString().toLowerCase() == "success") {
      if (getproductListModel.data != null) {
        if (getproductListModel.data!.data!.isNotEmpty) {
          for (int i = 0; i < getproductListModel.data!.data!.length; i++) {
            _getproductsubcategories.add(getproductListModel.data!.data![i]);
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
    isFirstdatafound = false;
    notifyListeners();

    return;
  }

  Future loadMore(String subcategoryid) async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await getproductsubcategorieslist(subcategoryid, pageNumrecipe);

      isLoadMoreRunning = false;
    }
  }
}
