import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_theme.dart';
import 'package:girls_fashion_store/screens/index_screen/index_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Girls Fashion Store',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: IndexScreen(),
    );
  }
}