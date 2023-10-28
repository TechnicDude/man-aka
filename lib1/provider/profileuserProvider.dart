import 'package:flutter/material.dart';
import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/model/profileuserModel.dart';

class ProfileUserProvider extends ChangeNotifier {
  ProfileUserModel profileuserModel = ProfileUserModel();

  List<ProfileUserData> _profileuserlist = [];
  List<ProfileUserData> get profileuserList => _profileuserlist;

  bool datanotfound = false;

  Future profileuserlist(String email) async {
    // print("object data");
    var url = ApiUrl.userprofile;
    ServiceWithHeader _service = new ServiceWithHeader(url);
    final response = await _service.data();
    // print(response);
    _profileuserlist = [];
    profileuserModel = ProfileUserModel.fromJson(response);
    if (profileuserModel.data != null) {
      var profileuser = profileuserModel.data;
      _profileuserlist.add(profileuser!);
      notifyListeners();
    }
  }
}
