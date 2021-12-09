import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/screens/index_screen/index_screen.dart';
import 'package:girls_fashion_store/models/onboarding_screen_model/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {

  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  forwardAction() {
    if(isLastPage){
      setOnBoardingValue();
      Get.off(IndexScreen());
    } else {
      pageController.nextPage(duration: 1.seconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      bgImg: ImgUrl.service1,
      title: 'Fast Delivery',
      description: 'Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery Fast Delivery',
    ),
    OnBoardingInfo(
      bgImg: ImgUrl.service2,
      title: 'Money Back Guarantee',
      description: 'money back Guarantee money back Guarantee money back Guarantee money back Guarantee',
    ),
    OnBoardingInfo(
      bgImg: ImgUrl.service3,
      title: 'Safe Payment',
      description: 'Safe Payment Safe Payment Safe Payment Safe Payment Safe Payment Safe Payment Safe Payment',
    ),
  ];

  setOnBoardingValue() async {
    print('Call Set Value Method');
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    print('Set Value : ${prefs.getBool("onboarding")}');
  }
}