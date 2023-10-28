import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/wishlistModel.dart';

class WishlistProvider extends ChangeNotifier {
  WishlistModel wishlistModel = WishlistModel();

  List<WishlistDataData> _wishlist = [];
  List<WishlistDataData> get wishlistList => _wishlist;

  bool datanotfound = false;

  Future wishlist() async {
    datanotfound = false;
    var url = ApiUrl.wishlists;
    ServiceWithHeader _service = new ServiceWithHeader(url);
    final response = await _service.data();
    wishlistModel = WishlistModel.fromJson(response);
    _wishlist = [];
    // try {
    if (wishlistModel.data != null) {
      if (wishlistModel.data!.data != null) {
        if (wishlistModel.data!.data!.isNotEmpty) {
          for (int i = 0; i < wishlistModel.data!.data!.length; i++) {
            _wishlist.add(wishlistModel.data!.data![i]);
          }
        }
      }
      print(_wishlist);
    }
    // } catch (e) {
    //   print(e);
    // }

    datanotfound = true;
    notifyListeners();
    return;
  }
}
