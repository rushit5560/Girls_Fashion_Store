import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/api_url.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/models/home_screen_model/banner_model.dart';
import 'package:girls_fashion_store/models/home_screen_model/featured_product_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  TextEditingController searchTextController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxInt activeIndex = 0.obs;
  RxList<Datum> bannerLists = RxList();
    RxList<Datum1> featuredProductLists = RxList();

  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;
  RxDouble scaleFactor = 1.0.obs;
  RxBool isDrawerOpen = false.obs;


  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');
    try {
      http.Response response = await http.get(Uri.parse(url));
      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;
      if (isStatus.value) {
        bannerLists = bannerList.data.obs;
      } else {
        print('Banner False False');
      }
    } catch (e) {
      print('Banner Error : $e');
    } finally {
      // isLoading(false);
      getFeaturedProductData();
    }
  }

  getFeaturedProductData() async {
    isLoading(true);
    String url = ApiUrl.FeaturedProductApi;
    print('Url : $url');
    try {
      http.Response response = await http.get(Uri.parse(url));
      FeaturedProductData featuredProductData =
          FeaturedProductData.fromJson(json.decode(response.body));
      isStatus = featuredProductData.success.obs;
      if (isStatus.value) {
        featuredProductLists = featuredProductData.data.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch (e) {
      print('FeaturedProduct Error : $e');
    } finally {
      isLoading(false);
    }
  }

  final categoryListImage = [
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category4, ImgUrl.category5, ImgUrl.category6,
    ImgUrl.category7, ImgUrl.category8, ImgUrl.category9,
  ];


  void openDrawer() {
    xOffset.value = Get.width * 0.60;
    yOffset.value = Get.height * 0.20;
    scaleFactor.value = 0.9;
    isDrawerOpen.value = true;
  }

  void closeDrawer() {
    xOffset.value = 0;
    yOffset.value = 0;
    scaleFactor.value = 1;
    isDrawerOpen.value = false;
  }

  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }
}