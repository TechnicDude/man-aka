import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/getaddtocartlistmodel.dart';
import 'package:manaqa_app/utils/apphelper.dart';

class AddtoCardProductListProvider extends ChangeNotifier {
  Getaddtocartlistmodel getsubcategoryproductmodel = Getaddtocartlistmodel();

  List<GetaddtocartlistmodelDataData> _getaddtocardproductlist = [];
  List<GetaddtocartlistmodelDataData> get getaddtocardproductlist =>
      _getaddtocardproductlist;

  bool getaddtocardproductlistfetch = false;
  bool datanotfound = false;
  bool isFirstdatafound = true;
  bool isLoadMoreRunning = false;
  bool hasfirst = true;
  int pageNumrecipe = 1;

  Future getalladdtocardlists(int page) async {
    if (page == 1) {
      getaddtocardproductlistfetch = false;
      isFirstdatafound = true;
      _getaddtocardproductlist = [];
    }

    ServiceWithHeader service = ServiceWithHeader(
        ApiUrl.productsaddtocardlist + "?page=$page&id=${AppHelper.userid}");

    final response = await service.data();

    getsubcategoryproductmodel = Getaddtocartlistmodel.fromJson(response);

    if (getsubcategoryproductmodel.data != null) {
      if (getsubcategoryproductmodel.data!.data != null) {
        if (getsubcategoryproductmodel.data!.data!.isNotEmpty) {
          for (int i = 0;
              i < getsubcategoryproductmodel.data!.data!.length;
              i++) {
            _getaddtocardproductlist
                .add(getsubcategoryproductmodel.data!.data![i]);
          }
        }
      }
    }

    getaddtocardproductlistfetch = true;

    notifyListeners();
    return;
  }

  Future loadMore() async {
    if (hasfirst && isFirstdatafound == false && isLoadMoreRunning == false) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom

      pageNumrecipe += 1; // Increase _page by 1
      await getalladdtocardlists(pageNumrecipe);

      isLoadMoreRunning = false;
    }
  }
}
