import 'package:manaqa_app/api/api.dart';
import 'package:manaqa_app/api/network.dart';
import 'package:manaqa_app/main.dart';
import 'package:manaqa_app/screens/loginsignup/otpverify.dart';
import 'package:manaqa_app/utils/apphelper.dart';

class LoginApi {
  final Map<String, dynamic> body;
  LoginApi(this.body);
  Future register() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.register, body);
    var data = await service.data();
    return data;
  }

  Future otpVerify() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.verify, body);
    var data = await service.dataput();
    return data;
  }

  Future login() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.login, body);
    var data = await service.data();
    return data;
  }

  Future forgetpassword() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(ApiUrl.forgetpassword, body);
    var data = await service.datarow();
    return data;
  }

  Future userprofile() async {
    Service service = new Service(ApiUrl.userprofile, body);
    var data = await service.formdata();
    return data;
  }

  Future updateprofile() async {
    var url = ApiUrl.userprofileupdate;
    ServicePUT service = new ServicePUT(url, body);
    var data = await service.formdata();
    return data;
  }

  Future editeupdateaddress(String addressid) async {
    var url = ApiUrl.addresses + '/$addressid';
    ServicePUT service = new ServicePUT(url, body);
    var data = await service.formdata();
    return data;
  }

  Future addnewaddress() async {
    var url = ApiUrl.addresses;
    ServicePOST service = new ServicePOST(url, body);
    var data = await service.formdata();
    return data;
  }
}
