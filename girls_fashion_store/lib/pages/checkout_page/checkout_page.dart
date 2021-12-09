import 'package:flutter/material.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/img_url.dart';

enum PaymentMethod {visa, paypal, mastercard, cod}

class CheckOutPage extends StatefulWidget {

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();
  PaymentMethod? _paymentMethod = PaymentMethod.visa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            billingInfo(),
            SpacerHeight(35),
            paymentMethod(),
            SpacerHeight(30),
            confirmButton(),
          ],
        ),
      ),
    );
  }

  Widget billingInfo() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10, borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12),
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Billing Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SpacerHeight(5),
                  CustomDivider(),
                  SpacerHeight(5),
                  nameField(),
                  SpacerHeight(15),
                  emailField(),
                  SpacerHeight(15),
                  phoneNoField(),
                  SpacerHeight(15),
                  shippingAddressField(),
                  SpacerHeight(15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Name'),
        ),
        SpacerHeight(8),
        TextFormField(
          cursorColor: Colors.black,
          controller: nameController,
          validator: (value){
            if(value!.isEmpty){
              return 'Name Can\'t be Empty';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        ),
      ],
    );
  }

  Widget emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Email Address'),
        ),
        SpacerHeight(8),
        TextFormField(
          cursorColor: Colors.black,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: (value){
            if(value!.isEmpty){
              return 'Email Can\'t be Empty';
            }
            else if(!value.contains('@')){
              return 'Email should be Valid!';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        ),
      ],
    );
  }

  Widget phoneNoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Phone No.'),
        ),
        SpacerHeight(8),
        TextFormField(
          cursorColor: Colors.black,
          controller: phoneNoController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          validator: (value){
            if(value!.isEmpty){
              return 'Phone No. Can\'t be Empty';
            }
            else if(value.length != 10){
              return 'Phone No. should be Valid!';
            }
          },
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        ),
      ],
    );
  }

  Widget shippingAddressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('Shipping Address'),
        ),
        SpacerHeight(8),
        TextFormField(
          cursorColor: Colors.black,
          controller: shippingAddressController,
          validator: (value){
            if(value!.isEmpty){
              return 'Shipping Address Can\'t be Empty';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
        ),
      ],
    );
  }

  Widget paymentMethod() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10, borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SpacerHeight(5),
                CustomDivider(),
                SpacerHeight(5),

                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: PaymentMethod.visa,
                            groupValue: _paymentMethod,
                            onChanged: (PaymentMethod? val){
                              setState(() {
                                _paymentMethod = val;
                                print('Method : $_paymentMethod');
                              });
                            },
                          ),

                          Expanded(
                            child: Image(
                              image: AssetImage(ImgUrl.visa),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: PaymentMethod.paypal,
                            groupValue: _paymentMethod,
                            onChanged: (PaymentMethod? val){
                              setState(() {
                                _paymentMethod = val;
                                print('Method : $_paymentMethod');
                              });
                            },
                          ),

                          Expanded(
                            child: Image(
                              image: AssetImage(ImgUrl.paypal),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: PaymentMethod.mastercard,
                            groupValue: _paymentMethod,
                            onChanged: (PaymentMethod? val){
                              setState(() {
                                _paymentMethod = val;
                                print('Method : $_paymentMethod');
                              });
                            },
                          ),

                          Expanded(
                            child: Image(
                              image: AssetImage(ImgUrl.mastercard),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: PaymentMethod.cod,
                            groupValue: _paymentMethod,
                            onChanged: (PaymentMethod? val){
                              setState(() {
                                _paymentMethod = val;
                                print('Method : $_paymentMethod');
                              });
                            },
                          ),

                          Expanded(
                            child: Image(
                              image: AssetImage(ImgUrl.cod),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget confirmButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10,borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$200',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              GestureDetector(
                onTap: () {
                  if(formKey.currentState!.validate()){
                    print('${nameController.text.trim()} '
                        '\n${emailController.text.trim()} '
                        '\n${phoneNoController.text.trim()} '
                        '\n${shippingAddressController.text.trim()}'
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.kPinkColor,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                    child: Center(
                      child: Text(
                        'Confirm & Pay',
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
        ),
      ),
    );
  }
}
