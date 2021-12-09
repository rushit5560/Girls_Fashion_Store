import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/field_validation.dart';
import 'package:girls_fashion_store/controllers/sign_in_screen_controller/sign_in_screen_controller.dart';
import 'package:girls_fashion_store/screens/signup_screen/signup_screen.dart';

class SignInDetailsModule extends StatelessWidget {
  SignInDetailsModule({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

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
            key: signInScreenController.formKey,
            child: Column(
              children: [
                SpacerHeight(20),
                SignInAndSignUpTextModule(name: 'SignIn'),
                SpacerHeight(20),
                EmailIdField(),
                SpacerHeight(15),
                PasswordField(),
                SpacerHeight(18),
                ForgotPasswordText(),
                SpacerHeight(18),
                LoginButton(),
                SpacerHeight(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailIdField extends StatelessWidget {
  EmailIdField({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.emailIdFieldController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: formInputDecoration('Email Id'),
    );
  }
}

class PasswordField extends StatelessWidget {
  PasswordField({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: signInScreenController.passwordFieldController,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      validator: (value) => FieldValidator().validatePassword(value!),
      decoration: formInputDecoration('Password'),
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Clicked On Forgot Password.');
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  LoginButton({Key? key}) : super(key: key);
  final signInScreenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(signInScreenController.formKey.currentState!.validate()){
          signInScreenController.getSignInData(
            "${signInScreenController.emailIdFieldController.text.trim().toLowerCase()}",
            "${signInScreenController.passwordFieldController.text.trim()}",
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
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have account yet? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.off(SignUpScreen());
            },
            child: Text(
              'Sign Up',
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
