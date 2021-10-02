import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_color.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/pages/checkout_page/checkout_page.dart';

import 'cartItem_model.dart';

class CartPage extends StatelessWidget {

  List<CartItemInfo> cartItemList = [
    CartItemInfo(
      productImgUrl: ImgUrl.product1,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
      productQty: '5',
    ),
    CartItemInfo(
      productImgUrl: ImgUrl.product2,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
      productQty: '6',
    ),
    CartItemInfo(
      productImgUrl: ImgUrl.product3,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
      productQty: '1',
    ),
  ];

  TextEditingController? cartQtyController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            cartList(),
            spacerHeight(15),

            couponCode(),
            spacerHeight(15),

            checkOutButton(),


          ],
        ),
      ),
    );
  }


  Widget cartList() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10, borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            spacerHeight(10),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartItemList.length,
                itemBuilder: (context, index){
                  cartQtyController = TextEditingController()..text = cartItemList[index].productQty;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('Clicked On Index : $index');
                                },
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                ),
                              ),
                              spacerWidth(10),
                              Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 75, width: 75,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image(
                                      image: AssetImage(cartItemList[index].productImgUrl),
                                    ),
                                  ),
                                ),
                              ),
                              spacerWidth(8),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItemList[index].productName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  spacerHeight(5),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$${cartItemList[index].productActivePrice}',
                                        style: TextStyle(
                                          color: CustomColor.kPinkColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      spacerWidth(5),
                                      Text(
                                        '\$${cartItemList[index].productInActivePrice}',
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 50,
                          height: 25,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            maxLength: 1,
                            controller: cartQtyController,
                            validator: (value) {
                              if(value!.isEmpty){
                                return '';
                              } else if(value.contains('0')){
                                return 'Not valid';
                              }
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            spacerHeight(10),
          ],
        ),
      ),
    );
  }

  Widget couponCode() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10, borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Have A Coupon?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                spacerHeight(5),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
                    ),
                    spacerWidth(12),
                    Container(
                      decoration: BoxDecoration(
                        color: CustomColor.kPinkColor,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
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
      ),
    );
  }

  Widget checkOutButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10, borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$500.00',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              spacerWidth(10),
              GestureDetector(
                onTap: () {
                  Get.to(CheckOutPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: CustomColor.kPinkColor,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                    child: Center(
                      child: Text(
                        'CheckOut Now',
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


  Widget spacerWidth(double value){
    return SizedBox(width: value);
  }
  Widget spacerHeight(double value){
    return SizedBox(height: value);
  }
}