import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'cart_screen_widgets.dart';


class CartScreen extends StatelessWidget {
  final cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    cartScreenController.getUserDetailsFromPrefs();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => cartScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    CartItemListModule(),
                    SpacerHeight(15),
                    CouponCodeModule(),
                    SpacerHeight(15),
                    CheckOutButtonModule(),
                  ],
                ),
              ),
      ),
    );
  }


}