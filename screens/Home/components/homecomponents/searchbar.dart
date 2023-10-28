import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:manaqa_app/localization/Language/languages.dart';
import 'package:manaqa_app/utils/textform/textform.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarScreenActivity extends StatefulWidget {
  final Function callback;
  const SearchBarScreenActivity({
    super.key,
    required this.callback,
  });

  @override
  State<SearchBarScreenActivity> createState() =>
      _SearchBarScreenActivityState();
}

class _SearchBarScreenActivityState extends State<SearchBarScreenActivity> {
  TextEditingController _searchcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: TextFormScreen(
        textEditingController: _searchcontroller,
        hinttext: Languages.of(context)!.search,
        suffixIcon: true,
        obscure: false,
        suffixIconWidget: Icon(Icons.search),
      ),
    );
  }
}
