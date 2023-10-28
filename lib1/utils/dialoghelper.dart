import 'package:fluttertoast/fluttertoast.dart';

class DialogHelper {
  static void hideLoading() {}

  static Future<void> showFlutterToast({required String strMsg}) async {
    await Fluttertoast.showToast(msg: strMsg);
  }
}
