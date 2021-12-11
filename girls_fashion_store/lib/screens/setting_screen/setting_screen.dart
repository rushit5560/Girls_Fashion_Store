import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/setting_screen_controller/setting_screen_controller.dart';
import 'setting_screen_widgets.dart';

class SettingScreen extends StatelessWidget {
  final settingScreenController = Get.put(SettingScreenController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Column(
        children: [
          const SpacerHeight(10),
          AvailabilityModule(),
          const SpacerHeight(10),
          NotificationModule(),
          const SpacerHeight(10),
          SendSMSModule(),
          const SpacerHeight(10),
          NightModeModule(),
          const SpacerHeight(10),
          ChangePasswordModule(),
          const SpacerHeight(10),
        ],
      ),
    );
  }

}
