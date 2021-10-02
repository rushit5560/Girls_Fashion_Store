import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_color.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/pages/signin_page/signin_page.dart';

class SignUpPage extends StatelessWidget {
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
                  signUpDetails(),
                  spacer(30),
                  signInText(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget signUpDetails() {
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
                signUpText(),
                spacer(20),
                nameField(),
                spacer(15),
                emailIdField(),
                spacer(15),
                passwordField(),
                spacer(18),
                signUpButton(),
                spacer(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return TextFormField(
      maxLines: 1,
      cursorColor: Colors.black,
      controller: nameController,
      validator: (value) {
        if(value!.isEmpty){
          return 'Name is Required!';
        }
      },
      decoration: InputDecoration(
        hintText: 'Name',
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

  Widget signUpButton() {
    return GestureDetector(
      onTap: (){
        if(formKey.currentState!.validate()){
          print('Clicked Inside FormKey');
          print('${nameController.text.trim()} \n${emailIdController.text.trim()} \n${passwordController.text.trim()}');
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

  Widget logo() {
    return Container(
      width: Get.width * 0.45,
      child: Image(
        image: AssetImage(ImgUrl.logo2),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget signUpText() {
    return Text(
      'SignUp',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      ),
    );
  }

  Widget signInText() {
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
              Get.off(SignInPage());
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

  Widget spacer(double value) {
    return SizedBox(height: value);
  }
}
