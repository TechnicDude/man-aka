// ignore_for_file: prefer_interpolation_to_compose_strings, unnecessary_string_interpolations

import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';

class LikeApi {
  final Map<String, dynamic> body;
  LikeApi(this.body);

  Future disfav() async {
    var url = ApiUrl.wishlists;
    ServicePOST service = ServicePOST(url, body);
    var data = await service.formdata();
    return data;
  }

  Future addtocard() async {
    var url = ApiUrl.carts;
    ServicePOST service = ServicePOST(url, body);
    var data = await service.formdata();
    return data;
  }

  Future updatetocard(String productid) async {
    var url = ApiUrl.carts + '/$productid';
    ServicePUT service = ServicePUT(url, body);
    var data = await service.formdata();
    return data;
  }

  Future deleteaddress(String id) async {
    var url = ApiUrl.addresses + '/$id';
    ServiceWithDelete service = ServiceWithDelete(url);
    var data = await service.data();
    return data;
  }

  Future deletecartlist(String id) async {
    var url = ApiUrl.productsaddtocardlist + '/$id';
    ServiceWithDelete service = ServiceWithDelete(url);
    var data = await service.data();
    return data;
  }
}
