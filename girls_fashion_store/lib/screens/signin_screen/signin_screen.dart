import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';

import 'signin_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  final signInScreenController = Get.put(SignInScreenController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            BackGroundImageWidget(),
            Obx(
              () => signInScreenController.isLoading.value
                  ? CustomCircularProgressIndicator()
                  : Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Logo(),
                          SpacerHeight(50),
                          SignInDetailsModule(),
                          SpacerHeight(30),
                          SignUpText(),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
