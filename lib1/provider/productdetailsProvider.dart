import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/getproductModel.dart';
import 'package:manaqa_app/model/getproductsdetailsid.dart';

import 'package:manaqa_app/model/productSubcategoriesModel.dart';

class ProductDatilsProvider extends ChangeNotifier {
  GetproductsDetailsByIDModel getproductListModel =
      GetproductsDetailsByIDModel();

  GetproductModel getrelatedproduct = GetproductModel();
  List<GetproductsDetailsByIDModelData> _getproduct = [];
  List<GetproductsDetailsByIDModelData> get getproduct => _getproduct;

  List<GetproductModelDatas> _getproductrelated = [];
  List<GetproductModelDatas> get getproductrelated => _getproductrelated;

  bool getproductdetailsfetch = false;

  bool getproductrelatedfetch = false;

  Future getproductsubcategorieslist(String productid) async {
    getproductdetailsfetch = false;
    // try {
    ServiceWithHeader _service =
        ServiceWithHeader(ApiUrl.products + "/$productid");
    final response = await _service.data();
    getproductListModel = GetproductsDetailsByIDModel.fromJson(response);
    if (getproductListModel.status.toString().toLowerCase() == "success") {
      if (getproductListModel.data != null) {
        _getproduct.add(getproductListModel.data!);
      }
    }
    // } catch (e) {
    //   print(e);
    // }
    getproductdetailsfetch = true;
    notifyListeners();

    return;
  }

  Future relatedproductlist(String productcategoryid) async {
    getproductrelatedfetch = false;
    _getproductrelated = [];
    ServiceWithHeader _service = ServiceWithHeader(
        ApiUrl.products + "/?product_category_id=$productcategoryid");
    final response = await _service.data();
    getrelatedproduct = GetproductModel.fromJson(response);
    if (getrelatedproduct.status.toString().toLowerCase() == "success") {
      if (getrelatedproduct.data != null) {
        // _getproductrelated.(getrelatedproduct.data!);
        if (getrelatedproduct.data!.data != null) {
          for (int i = 0; i < getrelatedproduct.data!.data!.length; i++) {
            _getproductrelated.add(getrelatedproduct.data!.data![i]);
          }
        }
      }
    }

    getproductrelatedfetch = true;
    notifyListeners();

    return;
  }
}
