import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/profile_screen_controller/profile_screen_controller.dart';

import 'profile_screen_widgets.dart';

class ProfileScreen extends StatelessWidget {
  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImageAndName(),
            const SpacerHeight(20),
            ProfileDetailsModule(),
          ],
        ),
      ),
    );
  }

}
