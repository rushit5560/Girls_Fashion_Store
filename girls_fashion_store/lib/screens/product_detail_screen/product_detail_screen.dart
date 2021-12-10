import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/product_detail_screen_controller/product_detail_screen_controller.dart';
import 'product_detail_screen_widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  final productDetailScreenController = Get.put(ProductDetailScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Product Detail',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Obx(
        () => productDetailScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SpacerHeight(10),
                    ProductImagesModule(),
                    SpacerHeight(10),
                    ProductDetailsModule(),
                  ],
                ),
              ),
      ),
    );
  }



}
