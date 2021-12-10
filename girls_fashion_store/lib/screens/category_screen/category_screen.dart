import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  final  categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Category',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: (){
                print('Clicked On Cart Button');
              },
              icon: Icon(Icons.shopping_cart_rounded,
              ),
          ),
        ],
      ),
      body: Obx(
        () => categoryScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryListModule(),
              ),
      ),
    );
  }
}
