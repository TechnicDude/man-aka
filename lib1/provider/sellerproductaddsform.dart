import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/model/getbrandsmodel.dart';
import 'package:manaqa_app/model/getproductscategoriesModel.dart';
import 'package:manaqa_app/model/productSubcategoriesModel.dart';

class SellerProductAddFormProvider extends ChangeNotifier {
  GetproductscategoriesModel getproductListModel = GetproductscategoriesModel();

  GetproductSubcategoriesModel getproductSubcategoriesModel =
      GetproductSubcategoriesModel();
  Getbrandsmodel getbrandsmodel = Getbrandsmodel();

  List<GetproductscategoriesModelDatas> _getproductcategories = [];
  List<GetproductscategoriesModelDatas> get getproductcategories =>
      _getproductcategories;
  List<GetproductSubcategoriesModelDatas> _getproductsubcategories = [];
  List<GetproductSubcategoriesModelDatas> get getproductsubcategories =>
      _getproductsubcategories;

  List<GetbrandsmodelDataDatas> _getbrandlist = [];
  List<GetbrandsmodelDataDatas> get getbrandlist => _getbrandlist;

  bool getproductcategorieslistfetch = false;
  bool getproductsubcategorieslistfetch = false;
  bool getbrandlistfetch = false;

  Future getproductcategorieslist(BuildContext context) async {
    getproductcategorieslistfetch = false;
    _getproductcategories = [];
    try {
      ServiceWithoutbody _service =
          ServiceWithoutbody(ApiUrl.productscategories);
      final response = await _service.data();
      getproductListModel = GetproductscategoriesModel.fromJson(response);
      _getproductcategories.add(GetproductscategoriesModelDatas(
          id: 0, name: Languages.of(context)!.pleaseselcectcategory));
      if (getproductListModel.status.toString().toLowerCase() == "success") {
        if (getproductListModel.data != null) {
          if (getproductListModel.data!.data!.isNotEmpty) {
            _getproductcategories.addAll(getproductListModel.data!.data!);
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

  Future getproductsubcategorieslist(
      String productsubcategoriesid, BuildContext context) async {
    getproductsubcategorieslistfetch = false;

    _getproductsubcategories = [];

    // try {
    ServiceWithoutbody _service = ServiceWithoutbody(
        ApiUrl.productssubcategories +
            "?product_category_id=$productsubcategoriesid");

    final response = await _service.data();
    getproductSubcategoriesModel =
        GetproductSubcategoriesModel.fromJson(response);
    if (productsubcategoriesid != "0") {
      _getproductsubcategories.add(GetproductSubcategoriesModelDatas(
          id: 0, name: Languages.of(context)!.pleaseselcectsubcategory));
    }

    if (getproductSubcategoriesModel.status.toString().toLowerCase() ==
        "success") {
      if (getproductSubcategoriesModel.data != null) {
        if (getproductSubcategoriesModel.data!.data!.isNotEmpty) {
          _getproductsubcategories
              .addAll(getproductSubcategoriesModel.data!.data!);
        }
      }
    }
    getproductsubcategorieslistfetch = true;
    notifyListeners();

    return;
  }

  Future getbarndlist(
      String productsubcategoriesid, BuildContext context) async {
    getbrandlistfetch = false;

    _getbrandlist = [];

    // try {
    ServiceWithoutbody _service = ServiceWithoutbody(ApiUrl.brands);

    final response = await _service.data();
    getbrandsmodel = Getbrandsmodel.fromJson(response);
    if (productsubcategoriesid != "0") {
      _getbrandlist.add(GetbrandsmodelDataDatas(
          id: 0, name: Languages.of(context)!.pleaseselcectbrand));
    }

    if (getbrandsmodel.status.toString().toLowerCase() == "success") {
      if (getbrandsmodel.data != null) {
        if (getbrandsmodel.data!.data!.isNotEmpty) {
          _getbrandlist.addAll(getbrandsmodel.data!.data!);
        }
      }
    }
    getbrandlistfetch = true;
    notifyListeners();

    return;
  }
}
