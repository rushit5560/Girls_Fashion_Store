import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/controllers/setting_screen_controller/setting_screen_controller.dart';
import 'package:girls_fashion_store/screens/change_password_screen/change_password_screen.dart';

final settingScreenController = Get.find<SettingScreenController>();

class AvailabilityModule extends StatelessWidget {
  AvailabilityModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Availability',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: settingScreenController.availability.value,
                  onChanged: (value) =>
                      settingScreenController.availability.value = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Notification',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: settingScreenController.notification.value,
                  onChanged: (value) =>
                      settingScreenController.notification.value = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SendSMSModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Send SMS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: settingScreenController.sendSMS.value,
                  onChanged: (value) =>
                      settingScreenController.sendSMS.value = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NightModeModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Night Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  activeColor: AppColor.kPinkColor,
                  trackColor: Colors.grey,
                  value: settingScreenController.nightMode.value,
                  onChanged: (value) =>
                      settingScreenController.nightMode.value = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordModule extends StatelessWidget {
  const ChangePasswordModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChangePasswordScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Container(
              width: Get.width,
              child: Text(
                'Change Password',
                textScaleFactor: 1.1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
