import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/api_url.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:girls_fashion_store/models/cart_screen_model/cart_model.dart';
import 'package:girls_fashion_store/screens/checkout_screen/checkout_screen.dart';

final cartScreenController = Get.find<CartScreenController>();

class CartItemListModule extends StatelessWidget {
  const CartItemListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            SpacerHeight(10),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cartScreenController.userCartProductLists.length,
                itemBuilder: (context, index) {
                  Cartditeil singleCartItem =
                      cartScreenController.userCartProductLists[index];
                  return _cartItemListTile(singleCartItem, index);
                },
              ),
            ),
            SpacerHeight(10),
          ],
        ),
      ),
    );
  }

  Widget _cartItemListTile(Cartditeil singleCartItem, int index) {
    final imgUrl = ApiUrl.ApiMainPath + "asset/uploads/product/" + singleCartItem.showimg;
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
                    cartScreenController.getDeleteProductCart(singleCartItem.cartDetailId);
                  },
                  child: Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  ),
                ),
                const SpacerWidth(10),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 75,
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: NetworkImage('$imgUrl'),
                      ),
                    ),
                  ),
                ),
                const SpacerWidth(8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      singleCartItem.productname,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SpacerHeight(5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${singleCartItem.productcost}',
                          style: TextStyle(
                            color: AppColor.kPinkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SpacerWidth(5),
                        Text(
                          '\$${singleCartItem.productcost}',
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // decoration:
            //     BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (singleCartItem.cquantity > 1) {
                        var cartItemDec = singleCartItem.cquantity - 1;
                        print('cartItemDec : $cartItemDec');
                        cartScreenController.getAddProductCartQty(
                          cartItemDec,
                          singleCartItem.cartDetailId,
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(
                        Icons.remove,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // const SpacerWidth(8),
                  Text('${singleCartItem.cquantity}'),
                  // const SpacerWidth(8),
                  GestureDetector(
                    onTap: () {
                      var cartItemInc = singleCartItem.cquantity + 1;
                      print('cartItemInc : $cartItemInc');
                      cartScreenController.getAddProductCartQty(
                        cartItemInc,
                        singleCartItem.cartDetailId,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class CouponCodeModule extends StatelessWidget {
  const CouponCodeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const SpacerHeight(5),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: cartScreenController.couponCodeFieldController,
                        cursorColor: Colors.black,
                        decoration: couponInputDecoration(),
                      ),
                    ),
                    const SpacerWidth(12),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.kPinkColor,
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
}


class CheckOutButtonModule extends StatelessWidget {
  const CheckOutButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                '\$${cartScreenController.userCartTotalAmount}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SpacerWidth(10),
              GestureDetector(
                onTap: () {
                  Get.to(()=> CheckOutScreen());
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
}
