import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';

import 'edit_profile_screen_widgets.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final editProfileScreenController = Get.put(EditProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => editProfileScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: editProfileScreenController.formKey,
                  child: Column(
                    children: [
                      FullNameFieldModule(),
                      const SpacerHeight(10),
                      CountryDropDownModule(),
                      const SpacerHeight(10),
                      StateDropDownModule(),
                      const SpacerHeight(10),
                      CityDropDownModule(),
                      const SpacerHeight(10),
                      UpdateButton(),
                      const SpacerHeight(10),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
