import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/models/home_screen_model/popular_product_model.dart';

class HomeScreenController extends GetxController {
  TextEditingController searchTextController = TextEditingController();

  final bannerList = [
    ImgUrl.banner1, ImgUrl.banner2, ImgUrl.banner3,
  ];
  final bannerListText = ['Fashion Trends', 'Fashion Trends2', 'Fashion Trends3'];

  RxInt activeIndex = 0.obs;

  final categoryListImage = [
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category4, ImgUrl.category5, ImgUrl.category6,
    ImgUrl.category7, ImgUrl.category8, ImgUrl.category9,
  ];

  List<PopularProductModel> popularProductLists = [
    PopularProductModel(
      productImg: ImgUrl.product1,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product2,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product3,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
  ];

  List<PopularProductModel> mostSaleList = [
    PopularProductModel(
      productImg: ImgUrl.product5,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product6,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product2,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
  ];
}