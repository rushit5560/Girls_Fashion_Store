import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/screens/contact_us_screen/contact_us_screen.dart';
import 'package:girls_fashion_store/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:girls_fashion_store/screens/setting_screen/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController completeAddressController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameOfCardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profileImgAndName(),
            spacer(20),
            profileDetails(context),
          ],
        ),
      ),
    );
  }

  Widget profileImgAndName() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10, borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Get.to(()=> EditProfileScreen());
          },
          child: Container(
            width: Get.width, height: 110,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 90, height: 90,
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
                        spacer(10),
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

  Widget profileDetails(BuildContext context) {
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
                  spacer(10),
                  paymentCards(context),
                  divider(),
                  address(context),
                  divider(),
                  contactUs(),
                  divider(),
                  settings(),
                  spacer(10),
                ],
              ),
            ),
          ),
      ),
    );
  }

  Widget paymentCards(BuildContext context) {
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
                    key: formKey,
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
                          spacer(10),
                          divider(),
                          spacer(10),
                          cardDetails(),
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

  Widget cardDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Number',
          style: TextStyle(fontSize: 16),
        ),
        spacer(5),
        cardNumberField(),
        spacer(10),

        Text(
          'Valid Through(MM/YY)',
          style: TextStyle(fontSize: 16),
        ),
        spacer(5),
        cardExpDateField(),
        spacer(10),

        Text(
          'CVV',
          style: TextStyle(fontSize: 16),
        ),
        spacer(5),
        cardCvvField(),
        spacer(10),

        Text(
          'Name Of Card',
          style: TextStyle(fontSize: 16),
        ),
        spacer(5),
        nameOfCardField(),
        spacer(10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if(formKey.currentState!.validate()) {
                  print(
                      '${cardNumberController.text.trim()} \n'
                          '${expDateController.text.trim()}\n'
                          '${cvvController.text.trim()}\n'
                          '${nameOfCardController.text.trim()}'
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
                cardNumberController.clear();
                expDateController.clear();
                cvvController.clear();
                nameOfCardController.clear();
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

  Widget cardNumberField() {
    return TextFormField(
      maxLines: 1,
      controller: cardNumberController,
      cursorColor: AppColor.kPinkColor,
      maxLength: 16,
      keyboardType: TextInputType.number,
      validator: (value){
        if(value!.isEmpty){
          return 'Card Number Empty';
        }
        else if(value.length != 16){
          return 'Enter Valid Card Number';
        }
      },
      decoration: InputDecoration(
        counterText: '',
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget cardExpDateField() {
    return TextFormField(
      maxLines: 1,
      controller: expDateController,
      cursorColor: AppColor.kPinkColor,
      maxLength: 5,
      keyboardType: TextInputType.datetime,
      validator: (value){
        if(value!.isEmpty){
          return 'Enter Expiry Date';
        }
        else if(!value.contains('/')){
          return 'Enter Valid Date';
        }
      },
      decoration: InputDecoration(
        counterText: '',
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget cardCvvField() {
    return TextFormField(
      maxLines: 1,
      controller: cvvController,
      cursorColor: AppColor.kPinkColor,
      maxLength: 3,
      keyboardType: TextInputType.number,
      validator: (value){
        if(value!.isEmpty){
          return 'Enter CVV Code';
        }
        else if(value.length != 3){
          return 'Enter Valid CVV';
        }
      },
      decoration: InputDecoration(
        counterText: '',
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget nameOfCardField() {
    return TextFormField(
      maxLines: 1,
      controller: nameOfCardController,
      cursorColor: AppColor.kPinkColor,
      validator: (value){
        if(value!.isEmpty){
          return 'Enter Card Holder Name';
        }
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget address(BuildContext context) {
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
                key: formKey,
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
                      spacer(10),
                      divider(),
                      spacer(10),
                      Text(
                        'Delivery Address',
                        style: TextStyle(fontSize: 16),
                      ),
                      spacer(5),
                      editDeliveryAddress(),
                      spacer(10),
                      Text(
                        'Complete Address',
                        style: TextStyle(fontSize: 16),
                      ),
                      editCompleteAddress(),
                      spacer(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if(formKey.currentState!.validate()) {
                                print(
                                  '${deliveryAddressController.text.trim()} \n${completeAddressController.text.trim()}'
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
                              deliveryAddressController.clear();
                              completeAddressController.clear();
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
      controller: deliveryAddressController,
      validator: (value){
        if(value!.isEmpty){
          return 'Delivery Address Can\'t be Empty';
        }
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget editCompleteAddress() {
    return TextFormField(
      maxLines: 3,
      controller: completeAddressController,
      validator: (value){
        if(value!.isEmpty){
          return 'Complete Address Can\'t be Empty';
        }
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget contactUs() {
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
              Get.to(ContactUsScreen());
              print('Clicked On Contact Us');
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),

        ],
      ),
    );
  }

  Widget settings() {
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
              Get.to(SettingScreen());
            },
            child: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }

  Widget spacer(double value) {
    return SizedBox(height: value);
  }

  Widget divider() {
    return Divider(thickness: 1);
  }
}
