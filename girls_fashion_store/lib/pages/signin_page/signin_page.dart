import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_color.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/pages/signup_page/signup_page.dart';

class SignInPage extends StatelessWidget {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            Container(
              height: Get.height,
              width: Get.width,
              child: Image(
                image: AssetImage(ImgUrl.loginbg),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  logo(),
                  spacer(50),
                  signInDetails(),
                  spacer(30),
                  signUpText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget logo() {
    return Container(
      width: Get.width * 0.45,
      child: Image(
        image: AssetImage(ImgUrl.logo2),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget signInDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: CustomColor.kPinkColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                spacer(20),
                signInText(),
                spacer(20),
                emailIdField(),
                spacer(15),
                passwordField(),
                spacer(18),
                forgotPassword(),
                spacer(18),
                loginButton(),
                spacer(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailIdField() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      controller: emailIdController,
      validator: (value) {
        if(value!.isEmpty){
          return 'Email Required!';
        }
        else if(!value.contains('@')){
          return 'Email Id should be Valid!';
        }
      },
      decoration: InputDecoration(
        hintText: 'Email Id',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(
          color: Colors.white,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 15,vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        if(value!.isEmpty){
          return 'Password Required!';
        }
      },
      decoration: InputDecoration(
        hintText: 'Password',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(
          color: Colors.white,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 15,vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }

  Widget forgotPassword() {
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

  Widget loginButton() {
    return GestureDetector(
      onTap: (){
        if(formKey.currentState!.validate()){
          print('Clicked Inside FormKey');
          print('${emailIdController.text.trim()} \n${passwordController.text.trim()}');
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

  Widget signInText() {
    return Text(
      'SignIn',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      ),
    );
  }

  Widget signUpText() {
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
              Get.off(SignUpPage());
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

  Widget spacer(double value) {
    return SizedBox(height: value);
  }
}
