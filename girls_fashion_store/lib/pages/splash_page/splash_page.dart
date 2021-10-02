import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/img_url.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImgUrl.splash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
