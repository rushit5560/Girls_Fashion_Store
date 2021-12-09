import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  String? name, email, subject, comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              spacer(10),
              mapView(),
              spacer(10),
              nameField(),
              spacer(10),
              emailIdField(),
              spacer(10),
              subjectField(),
              spacer(10),
              commentField(),
              spacer(10),
              sendButton(),
              spacer(10),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: nameController,
        validator: (value){
          if(value!.isEmpty){
            return 'Name Can\'t be Empty';
          }
        },
        decoration: InputDecoration(
          hintText: 'Name',
          isDense: true,
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }

  Widget emailIdField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: emailIdController,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
          if(value!.isEmpty){
            return 'Email Can\'t be Empty';
          }
          else if(!value.contains('@')){
            return 'Email should be Valid';
          }
        },
        decoration: InputDecoration(
          hintText: 'Email Id',
          isDense: true,
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }

  Widget subjectField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: subjectController,
        validator: (value){
          if(value!.isEmpty){
            return 'Subject Can\'t be Empty';
          }
        },
        decoration: InputDecoration(
          hintText: 'Subject',
          isDense: true,
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),
    );
  }

  Widget commentField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Container(
        // height: 40,
        child: TextFormField(
          cursorColor: Colors.black,
          controller: commentController,
          maxLines: 4,
          validator: (value){
            if(value!.isEmpty){
              return 'Comment Can\'t be Empty';
            }
          },
          decoration: InputDecoration(
            hintText: 'Comment',
            isDense: true,
            contentPadding: EdgeInsets.all(10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ),
    );
  }

  Widget sendButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            print('Inside formkey');
            name = nameController.text.trim();
            email = emailIdController.text.trim();
            subject = subjectController.text.trim();
            comment = commentController.text.trim();
            print('$name \n$email \n$subject \n$comment');
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

  Widget mapView() {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.1860, 72.7944),
      zoom: 7,
    );
    Completer<GoogleMapController> _controller = Completer();

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

  Widget spacer(double value) {
    return SizedBox(height: value);
  }
}
