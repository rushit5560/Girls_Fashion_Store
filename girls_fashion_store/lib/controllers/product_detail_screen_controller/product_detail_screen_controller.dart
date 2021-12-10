import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:girls_fashion_store/common/api_url.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/models/product_detail_screen_model/product_detail_model.dart';
import 'package:girls_fashion_store/models/product_detail_screen_model/rating_model.dart';
import 'package:girls_fashion_store/screens/product_detail_screen/addtocart_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProductDetailScreenController extends GetxController {
  int productId = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxInt productCount = 1.obs;
  RxInt activeIndex = 0.obs;
  RxInt activeColor = 0.obs;
  RxInt activeSize = 0.obs;
  RxDouble ratingValue = 0.0.obs;
  TextEditingController commentController = TextEditingController();
  RxList<Datum> productDetailLists = RxList();
  // RxList<Datum1> productReviewList = RxList();
  var userId;

  getProductDetailData() async {
    isLoading(true);
    String url = ApiUrl.ProductDetailApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$productId"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);

      ProductDetailsData productDetailsData = ProductDetailsData.fromJson(json.decode(response.body));
      isStatus = productDetailsData.success.obs;

      if(isStatus.value){
        productDetailLists = productDetailsData.data.obs;
      } else {
        print('Product Details False False');
      }

    } catch(e) {
      print('Product Details Error : $e');
    } finally {
      isLoading(false);
      // getProductReview();
    }


  }

  productAddToCart() async {
    isLoading(true);
    String url = ApiUrl.AddToCartApi;
    print('Url : $url');
    print('productId : $productId');

    try{
      Map data = {
        "product_id": "$productId",
        "user_id": "$userId",
        "quantity": "$productCount"
      };
      print('data123 : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      AddToCartData addToCartData =AddToCartData.fromJson(json.decode(response.body));
      isStatus = addToCartData.success.obs;

      if(isStatus.value) {
        print('True True');
        Get.snackbar('', 'Product Add in Cart Successfully');
        productCount.value = 1;
      } else {
        print('False False');
      }
    } catch(e){
      print('Product Add To Cart Error : $e');
    } finally {
      isLoading(false);
    }
  }

  /*addProductReview(ratings, comment) async {
    isLoading(true);
    String url = ApiUrl.AddProductReviewApi;
    print('Url : $url');
    print('productId : $productId');

    try{
      Map data = {
        "userid": "$userId",
        "productid": "$productId",
        "ratings": "$ratings",
        "comment": "$comment"
      };

      http.Response response = await http.post(Uri.parse(url), body: data);
      AddProductReviewData addProductReviewData = AddProductReviewData.fromJson(json.decode(response.body));
      isStatus = addProductReviewData.success.obs;

      if(isStatus.value){
        Fluttertoast.showToast(msg: "${addProductReviewData.message.toString()}");
      } else {
        print('Else False');
      }
    } catch(e) {
      print('Add Product Review False');
    } finally {
      isLoading(false);
    }
    // getProductReview();
  }*/

  // getProductReview() async {
  //   isLoading(true);
  //   String url = ApiUrl.ProductReviewApi;
  //   print('Url : $url');
  //
  //   try{
  //     Map data = {
  //       "productid": "$productId"
  //     };
  //     print('data : $data');
  //     http.Response response = await http.post(Uri.parse(url), body: data);
  //     ProductReviewData productReviewData = ProductReviewData.fromJson(json.decode(response.body));
  //
  //     isStatus = productReviewData.success.obs;
  //
  //     if(isStatus.value){
  //       productReviewList.clear();
  //       productReviewList = productReviewData.data.obs;
  //       print('productReviewList : $productReviewList');
  //     } else {
  //       print('Product Review False False');
  //     }
  //   } catch(e){
  //     print('Product Review Error : $e');
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    getProductDetailData();
    getUserDetailFromPrefs();
    super.onInit();
  }

  getUserDetailFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id').toString();
    print('UserId : $userId');
  }

  List<Color> colorList = [
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
  ];

  List<String> sizeList = ['L', 'S', 'M', 'XL', 'XXL'];

  List<RatingInfo> ratingLists = [
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Professor',
      date: '22 jan 2021',
      productRating: '4',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Berlin',
      date: '22 jan 2021',
      productRating: '4.5',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Tokyo',
      date: '22 jan 2021',
      productRating: '4',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Neirobi',
      date: '22 jan 2021',
      productRating: '4.5',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
  ];

}