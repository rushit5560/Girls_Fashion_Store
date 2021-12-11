import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/api_url.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/controllers/product_detail_screen_controller/product_detail_screen_controller.dart';
import 'package:girls_fashion_store/models/product_detail_screen_model/get_product_review_model.dart';
import 'package:girls_fashion_store/screens/cart_screen/cart_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final productDetailScreenController = Get.find<ProductDetailScreenController>();

class ProductImagesModule extends StatelessWidget {
  const ProductImagesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 12),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  child: _imageSlider(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                child: _imageSliderIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageSlider() {
    return CarouselSlider.builder(
      itemCount:
          productDetailScreenController.productDetailLists[0].images.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = ApiUrl.ApiMainPath +
            '${productDetailScreenController.productDetailLists[0].images[index]}';
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage('$imgUrl'),
                fit: BoxFit.contain,
              )),
        );
      },
      options: CarouselOptions(
        height: Get.height * 0.30,
        autoPlay: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) =>
            productDetailScreenController.activeIndex.value = index,
      ),
    );
  }

  Widget _imageSliderIndicator() {
    return Obx(
      () => AnimatedSmoothIndicator(
        activeIndex: productDetailScreenController.activeIndex.value,
        count:
            productDetailScreenController.productDetailLists[0].images.length,
        effect: WormEffect(
          dotHeight: 11,
          dotWidth: 11,
          activeDotColor: AppColor.kPinkColor,
          dotColor: Colors.grey,
        ),
      ),
    );
  }
}

class ProductDetailsModule extends StatelessWidget {
  const ProductDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${productDetailScreenController.productDetailLists[0].productname}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SpacerHeight(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingBar.builder(
                itemCount: 5,
                ignoreGestures: true,
                unratedColor: AppColor.kLightOrangeColor,
                allowHalfRating: true,
                itemSize: 18,
                minRating: 1,
                glow: false,
                initialRating: 3,
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star_rounded,
                    color: AppColor.kOrangeColor,
                  );
                },
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SpacerWidth(5),
              Text(
                '(250 Reviews)',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SpacerHeight(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '\$${productDetailScreenController.productDetailLists[0].productcost}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.kPinkColor,
                ),
              ),
              SpacerWidth(8),
              Text(
                '\$${productDetailScreenController.productDetailLists[0].productcost}',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
          const SpacerHeight(10),
          CustomDivider(),
          ColorOptionsModule(),
          CustomDivider(),
          SizeOptionModule(),
          CustomDivider(),
          QuantityOptionModule(),
          CustomDivider(),
          CartAndBuyButtons(),
          const SpacerHeight(15),
          ProductRatingModule(),
          const SpacerHeight(15),
          AllRatingsModule(),
          const SpacerHeight(15),
          LeaveCommentModule(),
        ],
      ),
    );
  }
}

class ColorOptionsModule extends StatelessWidget {
  const ColorOptionsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Color',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Container(
            height: 22,
            width: Get.width * 0.45,
            alignment: Alignment.centerRight,
            child: ListView.builder(
              itemCount: productDetailScreenController.colorList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    onTap: () =>
                        productDetailScreenController.activeColor.value = index,
                    child: Container(
                      padding:
                          productDetailScreenController.activeColor.value ==
                                  index
                              ? EdgeInsets.all(2)
                              : EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: AppColor.kPinkColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color:
                                productDetailScreenController.colorList[index],
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class SizeOptionModule extends StatelessWidget {
  const SizeOptionModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Size',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Container(
            height: 25,
            width: Get.width * 0.45,
            alignment: Alignment.centerRight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: productDetailScreenController.sizeList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () =>
                        productDetailScreenController.activeSize.value = index,
                    child: Container(
                      width: 34,
                      decoration: BoxDecoration(
                        border:
                            productDetailScreenController.activeSize.value ==
                                    index
                                ? Border.all(color: AppColor.kPinkColor)
                                : Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Center(
                          child: Text(
                            productDetailScreenController.sizeList[index],
                            style: TextStyle(
                              color: productDetailScreenController
                                          .activeSize.value ==
                                      index
                                  ? AppColor.kPinkColor
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityOptionModule extends StatelessWidget {
  const QuantityOptionModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quantity',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (productDetailScreenController.productCount.value <= 1) {
                        print('Amount is Less or Equal 1');
                      } else {
                        productDetailScreenController.productCount.value =
                            productDetailScreenController.productCount.value - 1;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                        '-',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  SpacerWidth(8),
                  Obx(()=> Text('${productDetailScreenController.productCount.value}')),
                  SpacerWidth(8),
                  GestureDetector(
                    onTap: () {
                      productDetailScreenController.productCount.value =
                          productDetailScreenController.productCount.value + 1;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
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

class CartAndBuyButtons extends StatelessWidget {
  const CartAndBuyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            productDetailScreenController.productAddToCart();
          },
          child: Container(
            // width: Get.width * 0.30,
            decoration: BoxDecoration(
              color: AppColor.kPinkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Text(
                  'Add To Cart',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
        SpacerWidth(10),
        GestureDetector(
          onTap: () {
            print('Clicked Buy Now Button');
            Get.to(CartScreen());
          },
          child: Container(
            // width: Get.width * 0.30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Text(
                  '  Buy Now  ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductRatingModule extends StatelessWidget {
  const ProductRatingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ratings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            RatingBar.builder(
              itemCount: 5,
              ignoreGestures: true,
              unratedColor: AppColor.kLightOrangeColor,
              allowHalfRating: true,
              itemSize: 18,
              minRating: 1,
              glow: false,
              initialRating: 4.5,
              itemBuilder: (context, _) {
                return Icon(
                  Icons.star_rounded,
                  color: AppColor.kOrangeColor,
                );
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AllRatingsModule extends StatelessWidget {
  const AllRatingsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Ratings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SpacerHeight(10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productDetailScreenController.productReviewList.length,
              itemBuilder: (context, index) {
                Datum1 productSingleReview =
                productDetailScreenController.productReviewList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: 65,
                      //   height: 65,
                      //   decoration: BoxDecoration(shape: BoxShape.circle),
                      //   child: Image(
                      //     image: AssetImage(productDetailScreenController
                      //         .ratingLists[index].userProfilePic),
                      //   ),
                      // ),
                      // const SpacerWidth(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${productSingleReview.username}",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const SpacerWidth(10),
                                RatingBar.builder(
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  unratedColor: AppColor.kLightOrangeColor,
                                  allowHalfRating: true,
                                  itemSize: 18,
                                  minRating: 1,
                                  glow: false,
                                  initialRating: 4.5,
                                  itemBuilder: (context, _) {
                                    return Icon(
                                      Icons.star_rounded,
                                      color: AppColor.kOrangeColor,
                                    );
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "${productSingleReview.createdDate.day} ${productSingleReview.createdDate.month} ${productSingleReview.createdDate.year}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${productSingleReview.ratings}",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LeaveCommentModule extends StatelessWidget {
  const LeaveCommentModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: productDetailScreenController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Leave A Comment',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SpacerHeight(8),
          RatingBar.builder(
            itemCount: 5,
            // ignoreGestures: true,
            unratedColor: AppColor.kLightOrangeColor,
            allowHalfRating: true,
            itemSize: 18,
            minRating: 0,
            glow: false,
            initialRating: 0,
            itemBuilder: (context, _) {
              return Icon(
                Icons.star_rounded,
                color: AppColor.kOrangeColor,
              );
            },
            onRatingUpdate: (rating) {
              productDetailScreenController.ratingValue.value = rating;
              print(rating);
            },
          ),
          const SpacerHeight(8),
          Text('Your Comment'),
          const SpacerHeight(8),
          TextFormField(
            maxLines: 3,
            cursorColor: Colors.black,
            controller: productDetailScreenController.commentController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SpacerHeight(8),
          GestureDetector(
            onTap: () {
              if(productDetailScreenController.formKey.currentState!.validate()){
                if (productDetailScreenController.ratingValue.value == 0.0) {
                  Fluttertoast.showToast(msg: 'Minimum rating 1');
                } else {
                  productDetailScreenController.addProductReview(
                    "${productDetailScreenController.ratingValue.value}",
                    "${productDetailScreenController.commentController.text.trim()}",
                  );
                }
              }
            },
            child: Container(
              width: Get.width * 0.35,
              decoration: BoxDecoration(
                color: AppColor.kPinkColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  child: Text(
                    'Submit',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      // fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
