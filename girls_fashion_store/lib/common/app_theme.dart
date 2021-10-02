import 'package:flutter/material.dart';

import 'custom_color.dart';

ThemeData appTheme() {
  return ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      // color: Colors.black,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(color: Colors.black),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(color: CustomColor.kPinkColor),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      selectedLabelStyle: TextStyle(color: Colors.black),
      showSelectedLabels: true,
      selectedItemColor: CustomColor.kPinkColor,
      showUnselectedLabels: true,
    ),
  );
}