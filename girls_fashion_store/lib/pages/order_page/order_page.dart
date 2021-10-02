import 'package:flutter/material.dart';
import 'package:girls_fashion_store/common/custom_color.dart';
import 'package:girls_fashion_store/common/img_url.dart';

import 'order_model.dart';

class OrderPage extends StatelessWidget {

  List<OrderInfo> orderItems = [
    OrderInfo(
      productImg: ImgUrl.product1,
      productName: 'Product Name Here, Product Name Here, Product Name Here, Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product2,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product3,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product3,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
    OrderInfo(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productActivePrice: '200',
      productInActivePrice: '250',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Column(
                    children: [
                      spacer(8),
                      Text(
                        '15 Dec 2019',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      spacer(5),
                      divider(),
                      spacer(5),
                      orderList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget orderList() {
    return ListView.builder(
      itemCount: orderItems.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 65, width: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image(
                        image: AssetImage(
                            orderItems[index].productImg
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          orderItems[index].productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      spacer(5),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              '\$${orderItems[index].productActivePrice}',
                            style: TextStyle(
                              color: CustomColor.kPinkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '\$${orderItems[index].productInActivePrice}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  Widget divider() {
    return Divider(
      color: Colors.black,
      thickness: 1,
      indent: 15,
      endIndent: 15,
    );
  }

  Widget spacer(double value) {
    return SizedBox(height: value);
  }
}
