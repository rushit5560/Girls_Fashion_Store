import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/field_validation.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/controllers/profile_screen_controller/profile_screen_controller.dart';
import 'package:girls_fashion_store/screens/contact_us_screen/contact_us_screen.dart';
import 'package:girls_fashion_store/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:girls_fashion_store/screens/setting_screen/setting_screen.dart';

final profileScreenController = Get.find<ProfileScreenController>();

class ProfileImageAndName extends StatelessWidget {
  const ProfileImageAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Get.to(() => EditProfileScreen());
          },
          child: Container(
            width: Get.width,
            height: 110,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(ImgUrl.profile),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenny Doe',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.kPinkColor,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SpacerHeight(10),
                      Text(
                        'jenny@demo.com',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileDetailsModule extends StatelessWidget {
  const ProfileDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10, borderRadius: BorderRadius.circular(10),
        child: Container(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SpacerHeight(10),
                PaymentCardsModule(),
                CustomDivider(),
                AddressModule(),
                CustomDivider(),
                ContactUsModule(),
                CustomDivider(),
                SettingModule(),
                const SpacerHeight(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PaymentCardsModule extends StatelessWidget {
  PaymentCardsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Payment Cards',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          GestureDetector(
            onTap: () {
              editPaymentCards(context);
              print('Clicked On Payment Cards');
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),

        ],
      ),
    );
  }

  editPaymentCards(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (context, setState2){
                return AlertDialog(
                  content: Form(
                    key: profileScreenController.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Credit / Debit Card',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SpacerHeight(10),
                          CustomDivider(),
                          const SpacerHeight(10),
                          _cardDetails(),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
    );
  }

  Widget _cardDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card Number', style: TextStyle(fontSize: 16)),
        const SpacerHeight(5),
        CardNumberFieldModule(),
        const SpacerHeight(10),

        Text('Valid Through(MM/YY)', style: TextStyle(fontSize: 16)),
        const SpacerHeight(5),
        CardExpiryDateFieldModule(),
        const SpacerHeight(10),

        Text('CVV', style: TextStyle(fontSize: 16)),
        const SpacerHeight(5),
        CardCvvFieldModule(),
        const SpacerHeight(10),

        Text('Name Of Card', style: TextStyle(fontSize: 16)),
        const SpacerHeight(5),
        NameOfCardField(),
        const SpacerHeight(10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if(profileScreenController.formKey.currentState!.validate()) {
                  print(
                      '${profileScreenController.cardNumberController.text.trim()} \n'
                          '${profileScreenController.expDateController.text.trim()}\n'
                          '${profileScreenController.cvvController.text.trim()}\n'
                          '${profileScreenController.nameOfCardController.text.trim()}'
                  );
                }
              },
              child: Container(
                width: Get.width * 0.30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.kPinkColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Center(
                    child: Text(
                      'Save',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Get.back();
                profileScreenController.cardNumberController.clear();
                profileScreenController.expDateController.clear();
                profileScreenController.cvvController.clear();
                profileScreenController.nameOfCardController.clear();
              },
              child: Container(
                width: Get.width * 0.30,
                // height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}

class CardNumberFieldModule extends StatelessWidget {
  const CardNumberFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: profileScreenController.cardNumberController,
      cursorColor: AppColor.kPinkColor,
      maxLength: 16,
      keyboardType: TextInputType.number,
      validator: (value)=> FieldValidator().validateCardNumber(value!),
      decoration: formInputDecoration('', Colors.black),
    );
  }
}
class CardExpiryDateFieldModule extends StatelessWidget {
  const CardExpiryDateFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: profileScreenController.expDateController,
      cursorColor: AppColor.kPinkColor,
      maxLength: 5,
      keyboardType: TextInputType.datetime,
      validator: (value)=> FieldValidator().validateCardExpiryDate(value!),
      decoration: formInputDecoration('', Colors.black),
    );
  }
}
class CardCvvFieldModule extends StatelessWidget {
  const CardCvvFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: profileScreenController.cvvController,
      cursorColor: AppColor.kPinkColor,
      maxLength: 3,
      keyboardType: TextInputType.number,
      validator: (value)=> FieldValidator().validateCardCvv(value!),
      decoration: formInputDecoration('', Colors.black),
    );
  }
}
class NameOfCardField extends StatelessWidget {
  const NameOfCardField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: profileScreenController.nameOfCardController,
      cursorColor: AppColor.kPinkColor,
      validator: (value)=> FieldValidator().validateFullName(value!),
      decoration: formInputDecoration('', Colors.black),
    );
  }
}

class AddressModule extends StatelessWidget {
  const AddressModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Address',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          GestureDetector(
            onTap: () {
              editAddressDetails(context);
              print('Clicked On Address');
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),

        ],
      ),
    );
  }

  editAddressDetails(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return StatefulBuilder(
            builder: (context, setState2){
              return AlertDialog(
                content: Form(
                  key: profileScreenController.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SpacerHeight(10),
                        CustomDivider(),
                        const SpacerHeight(10),
                        Text(
                          'Delivery Address',
                          style: TextStyle(fontSize: 16),
                        ),
                        const SpacerHeight(5),
                        editDeliveryAddress(),
                        const SpacerHeight(10),
                        Text(
                          'Complete Address',
                          style: TextStyle(fontSize: 16),
                        ),
                        editCompleteAddress(),
                        const SpacerHeight(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if(profileScreenController.formKey.currentState!.validate()) {
                                  print(
                                      '${profileScreenController.deliveryAddressController.text.trim()}\n'
                                          '${profileScreenController.completeAddressController.text.trim()}'
                                  );
                                }
                              },
                              child: Container(
                                width: Get.width * 0.30,
                                // height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.kPinkColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                profileScreenController.deliveryAddressController.clear();
                                profileScreenController.completeAddressController.clear();
                              },
                              child: Container(
                                width: Get.width * 0.30,
                                // height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
    );
  }

  Widget editDeliveryAddress() {
    return TextFormField(
      maxLines: 3,
      controller: profileScreenController.deliveryAddressController,
      validator: (value){
        if(value!.isEmpty){
          return 'Delivery Address Can\'t be Empty';
        }
      },
      decoration: formInputDecoration('', Colors.black, 20),
    );
  }

  Widget editCompleteAddress() {
    return TextFormField(
      maxLines: 3,
      controller: profileScreenController.completeAddressController,
      validator: (value){
        if(value!.isEmpty){
          return 'Complete Address Can\'t be Empty';
        }
      },
      decoration: formInputDecoration('', Colors.black, 20),
    );
  }

}

class ContactUsModule extends StatelessWidget {
  const ContactUsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          GestureDetector(
            onTap: () {
              Get.to(()=> ContactUsScreen());
              print('Clicked On Contact Us');
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),

        ],
      ),
    );
  }
}

class SettingModule extends StatelessWidget {
  const SettingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          GestureDetector(
            onTap: () {
              print('Clicked On Settings');
              Get.to(()=> SettingScreen());
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
