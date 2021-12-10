import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/signup_screen_controller/signup_screen_controller.dart';
import 'signup_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  final signUpScreenController = Get.put(SignUpScreenController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            BackGroundImageWidget(),
            SingleChildScrollView(
              child: Obx(
                () => signUpScreenController.isLoading.value
                    ? CustomCircularProgressIndicator()
                    : Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Logo(),
                            SpacerHeight(50),
                            SignUpDetailsModule(),
                            SpacerHeight(30),
                            SignInText(),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
