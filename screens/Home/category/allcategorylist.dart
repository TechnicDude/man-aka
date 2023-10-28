import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:manaqa_app/screens/Home/category/categorylist.dart';
import 'package:manaqa_app/utils/appbar/appbar.dart';

class AllCategoryList extends StatefulWidget {
  const AllCategoryList({super.key});

  @override
  State<AllCategoryList> createState() => _AllCategoryListState();
}

class _AllCategoryListState extends State<AllCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        // appBar: AppBar(
        //     backgroundColor: Colors.white.withOpacity(0.95),
        //     title: AppBarScreens(
        //       text: "Categories",
        //     )),
        body: MyCategorylistScreenActivity());
  }
}
