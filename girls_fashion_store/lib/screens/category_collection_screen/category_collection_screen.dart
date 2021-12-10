import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'category_collection_screen_widgets.dart';

class CategoryCollectionScreen extends StatelessWidget {
  CategoryCollectionScreen({Key? key}) : super(key: key);
  final categoryCollectionScreenController = Get.put(CategoryCollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Category Name',
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
            () => categoryCollectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: CategoryCollectionListModule(),
        ),
      ),
    );
  }
}
