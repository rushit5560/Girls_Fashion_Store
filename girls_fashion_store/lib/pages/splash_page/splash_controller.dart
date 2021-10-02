import 'dart:async';
import 'package:get/get.dart';
import 'package:girls_fashion_store/pages/index_page/index_page.dart';
import 'package:girls_fashion_store/pages/onboarding_page/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashController extends GetxController {
  bool? onBoardingValue = false;

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), getOnBoardingValue);
  }

  getOnBoardingValue() async {
    print('-----getOnBoardingValue Function Run-----');


    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool("onboarding");
    print('Value : $onBoardingValue');
    if (onBoardingValue == true) {
      print('----Go to IndexPage----');
      Get.off(IndexPage());
    } else {
      print('----Go to OnBoardingPage----');
      Get.off(OnBoardingPage());
    }

  }

}