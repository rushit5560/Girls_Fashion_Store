import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController completeAddressController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameOfCardController = TextEditingController();
}