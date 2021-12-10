import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/collection_screen_controller/collection_screen_controller.dart';

import 'collection_screen_widgets.dart';

class CollectionScreen extends StatelessWidget {
  final collectionScreenController = Get.put(CollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Collection',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Obx(
        () => collectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CollectionListModule(),
              ),
      ),
    );
  }

}
