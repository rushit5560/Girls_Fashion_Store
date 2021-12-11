import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/field_validation.dart';
import 'package:girls_fashion_store/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:girls_fashion_store/models/edit_profile_screen_model/city_model.dart';
import 'package:girls_fashion_store/models/edit_profile_screen_model/country_model.dart';
import 'package:girls_fashion_store/models/edit_profile_screen_model/state_model.dart';

final editProfileScreenController = Get.find<EditProfileScreenController>();

class FullNameFieldModule extends StatelessWidget {
  const FullNameFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editProfileScreenController.fullNameController,
      validator: (value) => FieldValidator().validateFullName(value!),
      decoration: formInputDecoration('Full name', Colors.black),
    );
  }
}

class CountryDropDownModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: editProfileScreenController.countryDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.countryDropDownValue!.name =
                newValue!.name;
            editProfileScreenController.countryDropDownValue!.id = newValue.id;
            print(
                "countryDropDownValue : ${editProfileScreenController.countryDropDownValue!.name}");
            print("countryDropDownValue ID : ${newValue.id}");
            editProfileScreenController.getStateData(newValue.id);
          },
          items: editProfileScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class StateDropDownModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumState>(
          value: editProfileScreenController.stateDropDownValue,
          icon:
              const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.stateDropDownValue!.name =
                newValue!.name;
            editProfileScreenController.stateDropDownValue!.id = newValue.id;
            print(
                "stateDropDownValue : ${editProfileScreenController.stateDropDownValue}");
            print('newValue.name : ${newValue.name}');
            editProfileScreenController.getCityData(newValue.id);
            editProfileScreenController.loading();
          },
          items: editProfileScreenController.stateLists
              .map<DropdownMenuItem<DatumState>>((DatumState value) {
            return DropdownMenuItem<DatumState>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CityDropDownModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumCity>(
          value: editProfileScreenController.cityDropDownValue,
          icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.cityDropDownValue!.name =
                newValue!.name;
            editProfileScreenController.cityDropDownValue!.id = newValue.id;
            print(
                "cityDropDownValue : ${editProfileScreenController.cityDropDownValue}");
            print('newValue.name : ${newValue.name}');
            editProfileScreenController.loading();
          },
          items: editProfileScreenController.cityLists
              .map<DropdownMenuItem<DatumCity>>((DatumCity value) {
            return DropdownMenuItem<DatumCity>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  UpdateButton({Key? key}) : super(key: key);
  final editProfileScreenController = Get.find<EditProfileScreenController>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (editProfileScreenController.formKey.currentState!.validate()) {
          editProfileScreenController.updateProfileData(
            "${editProfileScreenController.fullNameController.text.trim()}",
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
              'Update',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
