import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/contactus_screen_controller/contactus_screen_controller.dart';
import 'contact_us_screen_widgets.dart';

class ContactUsScreen extends StatelessWidget {
  final contactUsScreenController = Get.put(ContactUsScreenController());

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
        () => contactUsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: contactUsScreenController.formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SpacerHeight(10),
                        MapViewModule(),
                        const SpacerHeight(10),
                        NameTextField(),
                        const SpacerHeight(10),
                        EmailIdTextField(),
                        const SpacerHeight(10),
                        PhoneNoTextField(),
                        const SpacerHeight(10),
                        SubjectTextField(),
                        const SpacerHeight(10),
                        CommentTextField(),
                        const SpacerHeight(10),
                        SendButton(),
                        const SpacerHeight(10),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }


}
