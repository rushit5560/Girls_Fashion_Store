import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/change_password_screen_controller/change_password_screen_controller.dart';

import 'change_password_screen_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.put(ChangePasswordScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Obx(
        () => changePasswordScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ChangePasswordFields(),
                ),
              ),
      ),
    );
  }
}
