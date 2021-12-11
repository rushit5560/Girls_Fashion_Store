import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/field_validation.dart';
import 'package:girls_fashion_store/controllers/change_password_screen_controller/change_password_screen_controller.dart';

class ChangePasswordFields extends StatelessWidget {
  ChangePasswordFields({Key? key}) : super(key: key);
  final changePasswordScreenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: changePasswordScreenController.formKey,
      child: Column(
        children: [
          _oldPasswordField(),
          const SpacerHeight(10),
          _newPasswordField(),
          const SpacerHeight(10),
          _cNewPasswordField(),
          const SpacerHeight(15),
          _submitButton(),
        ],
      ),
    );
  }

  Widget _oldPasswordField() {
    return TextFormField(
      controller: changePasswordScreenController.oldPasswordFieldController,
      validator: (value)=> FieldValidator().validatePassword(value!),
      decoration: formInputDecoration('Old Password', Colors.black),
    );
  }
  Widget _newPasswordField() {
    return TextFormField(
      controller: changePasswordScreenController.newPasswordFieldController,
      validator: (value)=> FieldValidator().validatePassword(value!),
      decoration: formInputDecoration('New Password', Colors.black),
    );
  }
  Widget _cNewPasswordField() {
    return TextFormField(
      controller: changePasswordScreenController.cNewPasswordFieldController,
      validator: (value)=> FieldValidator().validatePassword(value!),
      decoration: formInputDecoration('Confirm New Password', Colors.black),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        if(changePasswordScreenController.formKey.currentState!.validate()){
          changePasswordScreenController.getForgotPasswordData(
            "${changePasswordScreenController.oldPasswordFieldController.text.trim()}",
            "${changePasswordScreenController.newPasswordFieldController.text.trim()}",
            "${changePasswordScreenController.cNewPasswordFieldController.text.trim()}",
          );
          cleartextFields();
        }

      },
      child: Container(
        width: Get.width,
        alignment: Alignment.center,
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Submit',
            textScaleFactor: 1.2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: AppColor.kPinkColor,
        ),
      ),
    );
  }

  void cleartextFields() {
    changePasswordScreenController.oldPasswordFieldController.clear();
    changePasswordScreenController.newPasswordFieldController.clear();
    changePasswordScreenController.cNewPasswordFieldController.clear();
  }
}
