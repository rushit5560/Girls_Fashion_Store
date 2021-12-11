import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/field_validation.dart';
import 'package:girls_fashion_store/controllers/contactus_screen_controller/contactus_screen_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final contactUsScreenController = Get.find<ContactUsScreenController>();

class MapViewModule extends StatelessWidget {
  MapViewModule({Key? key}) : super(key: key);
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.1860, 72.7944),
    zoom: 7,
  );
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: Get.height * 0.25,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              myLocationEnabled: true,
            ),
          ),
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.fullNameController,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: couponInputDecoration('Full Name', 30),
    );
  }
}

class EmailIdTextField extends StatelessWidget {
  const EmailIdTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.emailIdController,
      validator: (value) => FieldValidator().validateEmail(value!),
      decoration: couponInputDecoration('Email Id', 30),
    );
  }
}

class PhoneNoTextField extends StatelessWidget {
  const PhoneNoTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.phoneNoController,
      maxLength: 10,
      validator: (value) => FieldValidator().validateMobile(value!),
      decoration: couponInputDecoration('Phone No', 30),
    );
  }
}

class SubjectTextField extends StatelessWidget {
  const SubjectTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.subjectController,
      validator: (value) => FieldValidator().validateSubject(value!),
      decoration: couponInputDecoration('Subject', 30),
    );
  }
}

class CommentTextField extends StatelessWidget {
  const CommentTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contactUsScreenController.commentController,
      maxLines: 3,
      validator: (value) => FieldValidator().validateComment(value!),
      decoration: couponInputDecoration('Comment', 10),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          if (contactUsScreenController.formKey.currentState!.validate()) {
            contactUsScreenController.getContactUsData(
              "${contactUsScreenController.fullNameController.text.trim()}",
              "${contactUsScreenController.emailIdController.text.trim().toLowerCase()}",
              "${contactUsScreenController.phoneNoController.text.trim()}",
              "${contactUsScreenController.subjectController.text.trim()}",
              "${contactUsScreenController.commentController.text.trim()}",
            );
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColor.kPinkColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Text(
                  'Send',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )),
        ),
      ),
    );
  }
}
