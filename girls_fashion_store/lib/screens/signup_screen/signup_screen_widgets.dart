import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/field_validation.dart';
import 'package:girls_fashion_store/controllers/signup_screen_controller/signup_screen_controller.dart';
import 'package:girls_fashion_store/screens/signin_screen/signin_screen.dart';

class SignUpDetailsModule extends StatelessWidget {
  SignUpDetailsModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.kPinkColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: signUpScreenController.formKey,
            child: Column(
              children: [
                const SpacerHeight(20),
                SignInAndSignUpTextModule(name: 'SignUp'),
                const SpacerHeight(20),
                UserNameField(),
                const SpacerHeight(15),
                EmailIdField(),
                const SpacerHeight(15),
                PasswordField(),
                const SpacerHeight(18),
                SignUpButton(),
                const SpacerHeight(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserNameField extends StatelessWidget {
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpScreenController.userNameFieldController,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: formInputDecoration('User Name'),
    );
  }
}

class EmailIdField extends StatelessWidget {
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpScreenController.emailIdFieldController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: formInputDecoration('Email Id'),
    );
  }
}

class PasswordField extends StatelessWidget {
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signUpScreenController.passwordFieldController,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: formInputDecoration('Password'),
    );
  }
}

class SignUpButton extends StatelessWidget {
  SignUpButton({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (signUpScreenController.formKey.currentState!.validate()) {
          signUpScreenController.getRegisterData(
            "${signUpScreenController.userNameFieldController.text.trim()}",
            "${signUpScreenController.emailIdFieldController.text.trim().toLowerCase()}",
            "${signUpScreenController.passwordFieldController.text.trim()}",
          );
        }
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: Center(
            child: Text(
              'SignUp',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}

class SignInText extends StatelessWidget {
  const SignInText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.off(() => SignInScreen());
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            ' here',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
