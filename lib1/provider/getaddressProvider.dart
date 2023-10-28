import 'package:flutter/cupertino.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/getaddressModel.dart';

class GetaddressProvider extends ChangeNotifier {
  GetaddressModel getaddressModel = GetaddressModel();

  List<GetaddressDataData> _getaddress = [];
  List<GetaddressDataData> get getaddressList => _getaddress;

  bool datanotfound = false;

  Future getaddress() async {
    datanotfound = false;
    var url = ApiUrl.addresses;
    ServiceWithHeader _service = new ServiceWithHeader(url);
    final response = await _service.data();
    getaddressModel = GetaddressModel.fromJson(response);
    _getaddress = [];
    // try {
    if (getaddressModel.data != null) {
      if (getaddressModel.data!.data != null) {
        if (getaddressModel.data!.data!.isNotEmpty) {
          for (int i = 0; i < getaddressModel.data!.data!.length; i++) {
            _getaddress.add(getaddressModel.data!.data![i]);
          }
        }
      }
      print(_getaddress);
    }
    // } catch (e) {
    //   print(e);
    // }

    datanotfound = true;
    notifyListeners();
    return;
  }
}
