import 'package:flutter/material.dart';
import 'package:manaqa_app/model/profileuserModel.dart';
import 'package:manaqa_app/utils/appstringfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  static String? userid;
  static String? AUTH_TOKEN_VALUE;
  static String? email_VALUE;
  static String? language;
  static String? role;
  static String? _url;
  static String? image;
  static ProfileUserData? person;
  static String? name;
  static String? lastname;

  static logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.setString(AppStringFile.onboardingScreen, "0");
    userid = null;
  }

  Future<void> dialogBuilder(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> dialogBuilderforget(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  String htmlremove(String data) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String removehtml = data.replaceAll(exp, '');
    return removehtml;
  }

  // launchUrls(String _url) async {
  //   Uri myUri = Uri.parse(_url);
  //   if (!await launchUrl(myUri)) {
  //     throw Exception('Could not launch $myUri');
  //   }
  // }

  String pricecount(int qut, String price) {
    double pricedata = double.parse(price);
    double totalprice = pricedata * qut;
    return totalprice.toStringAsFixed(2);
  }
}
