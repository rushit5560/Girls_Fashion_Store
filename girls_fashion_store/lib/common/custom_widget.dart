
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_color.dart';
import 'img_url.dart';

class SpacerHeight extends StatelessWidget {
  final double value;
  const SpacerHeight(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}

class SpacerWidth extends StatelessWidget {
  final double value;
  const SpacerWidth(this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}

class CustomDivider extends StatelessWidget {
  final thickness;
  final color;
  final indent;
  final endIndent;

  CustomDivider({this.thickness, this.color, this.indent, this.endIndent});

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1,
      color: color ?? Colors.black,
      indent: indent ?? 0.0,
      endIndent: endIndent ?? 0.0,
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.45,
      child: Image(
        image: AssetImage(ImgUrl.logo2),
        fit: BoxFit.cover,
      ),
    );
  }
}

class SignInAndSignUpTextModule extends StatelessWidget {
  final name;
  SignInAndSignUpTextModule({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 22,
      ),
    );
  }
}

InputDecoration formInputDecoration([String? hintText, Color? color, double? radius]) {
  return InputDecoration(
    hintText: '$hintText',
    filled: true,
    fillColor: Colors.white,
    isDense: true,
    counterText: '',
    contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 30),
      borderSide: BorderSide(color: color ?? Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 30),
      borderSide: BorderSide(color: color ?? Colors.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 30),
      borderSide: BorderSide(color: color ?? Colors.transparent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 30),
      borderSide: BorderSide(color: color ?? Colors.transparent),
    ),
  );
}

class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColor.kPinkColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class BackGroundImageWidget extends StatelessWidget {
  const BackGroundImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Image(
        image: AssetImage(ImgUrl.loginbg),
        fit: BoxFit.cover,
      ),
    );
  }
}


InputDecoration couponInputDecoration(String hintText, double radius) {
  return InputDecoration(
    isDense: true,
    hintText: '$hintText',
    counterText: '',
    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
  );
}