import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/pages/cart_page/cart_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'rating_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  int activeIndex = 0;
  List productImgList = [ImgUrl.product1,ImgUrl.product2,ImgUrl.product3];
  int? activeColor;
  List<Color> colorList = [
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
  ];
  int? activeSize;
  List<String> sizeList = ['L', 'S', 'M', 'XL', 'XXL'];

  int? qty = 1;

  List<RatingInfo> ratingLists = [
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Professor',
      date: '22 jan 2021',
      productRating: '4',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Berlin',
      date: '22 jan 2021',
      productRating: '4.5',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Tokyo',
      date: '22 jan 2021',
      productRating: '4',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
    RatingInfo(
      userProfilePic: ImgUrl.profile,
      userName: 'Neirobi',
      date: '22 jan 2021',
      productRating: '4.5',
      productReview: 'Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other Users Product Review Given By Other UsersProduct Review Given By Other Users Product Review Given By Other Users',
    ),
  ];

  TextEditingController commentController = TextEditingController();
  double? ratingValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Product Detail',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            spacerHeight(10),
            productImgModule(),
            spacerHeight(10),
            productDetails(),
          ],
        ),
      ),
    );
  }

  Widget productImgModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 12),
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
                  child: carouselSlider(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                child: carouselIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //productImgModule
  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: productImgList.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(productImgList[index]),
                fit: BoxFit.contain,
              )
          ),
        );
      },
      options: CarouselOptions(
          height: Get.height * 0.30,
          autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndex = index;
            });
          }),
    );
  }

  //productImgModule
  Widget carouselIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: productImgList.length,
      effect: WormEffect(
        dotHeight: 11,
        dotWidth: 11,
        activeDotColor: CustomColor.kPinkColor,
        dotColor: Colors.grey,
      ),
    );
  }

  Widget productDetails() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Name Here Product Name Here Product Name Here Product Name Here ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          spacerHeight(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingBar.builder(
                itemCount: 5,
                ignoreGestures: true,
                unratedColor: CustomColor.kLightOrangeColor,
                allowHalfRating: true,
                itemSize: 18,
                minRating: 1,
                glow: false,
                initialRating: 3,
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star_rounded,
                    color: CustomColor.kOrangeColor,
                  );
                },
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              spacerWidth(5),
              Text(
                '(250 Reviews)',
                style: TextStyle(
                  fontSize: 12
                ),
              ),
            ],
          ),
          spacerHeight(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '\$200',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomColor.kPinkColor,
                ),
              ),
              spacerWidth(8),
              Text(
                '\$250',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough
                ),
              ),
            ],
          ),
          spacerHeight(10),
          customDivider(),
          colorOptions(),
          customDivider(),
          sizeOptions(),
          customDivider(),
          qtyOptions(),
          customDivider(),
          cartAndBuyButton(),
          spacerHeight(15),
          productRating(),
          spacerHeight(15),
          allRatings(),
          spacerHeight(15),
          leaveComment(),
        ],
      ),
    );
  }

  Widget colorOptions() {
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
              itemCount: colorList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        activeColor = index;
                        print(activeColor);
                      });
                    },
                    child: Container(
                      padding: activeColor == index ?  EdgeInsets.all(2) : EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: CustomColor.kPinkColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 20, height: 20,
                        decoration: BoxDecoration(
                            color: colorList[index],
                            shape: BoxShape.circle
                        ),
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

  Widget sizeOptions() {
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
              itemCount: sizeList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        activeSize = index;
                        print(sizeList[index]);
                      });
                    },
                    child: Container(
                      width: 34,
                      decoration: BoxDecoration(
                        border: activeSize == index ? Border.all( color: CustomColor.kPinkColor) :Border.all( color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Center(
                          child: Text(
                            sizeList[index],
                            style: TextStyle(
                              color: activeSize == index ? CustomColor.kPinkColor : Colors.black,
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

  Widget qtyOptions() {
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if(qty! <= 1) {
                        print('Amount is Less or Equal 1');
                      } else {
                        setState(() {
                          qty = qty!-1;
                          print('-- Amount $qty');
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Text(
                          '-',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                  spacerWidth(8),
                  Text('$qty'),
                  spacerWidth(8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        qty = qty!+1;
                        print('++ Amount $qty');
                      });
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

  Widget cartAndBuyButton() {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            print('Clicked Add To Cart Button');
            Get.to(CartPage());
          },
          child: Container(
            // width: Get.width * 0.30,
            decoration: BoxDecoration(
              color: CustomColor.kPinkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
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

        spacerWidth(10),

        GestureDetector(
          onTap: (){
            print('Clicked Buy Now Button');
            Get.to(CartPage());
          },
          child: Container(
            // width: Get.width * 0.30,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
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

  Widget productRating() {
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
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
            ),
            RatingBar.builder(
              itemCount: 5,
              ignoreGestures: true,
              unratedColor: CustomColor.kLightOrangeColor,
              allowHalfRating: true,
              itemSize: 18,
              minRating: 1,
              glow: false,
              initialRating: 4.5,
              itemBuilder: (context, _) {
                return Icon(
                  Icons.star_rounded,
                  color: CustomColor.kOrangeColor,
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

  Widget allRatings() {
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
            spacerHeight(10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ratingLists.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 65, height: 65,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                        child: Image(
                          image: AssetImage(ratingLists[index].userProfilePic),
                        ),
                      ),
                      spacerWidth(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    ratingLists[index].userName,
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 15
                                  ),
                                ),
                                spacerWidth(10),
                                RatingBar.builder(
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  unratedColor: CustomColor.kLightOrangeColor,
                                  allowHalfRating: true,
                                  itemSize: 18,
                                  minRating: 1,
                                  glow: false,
                                  initialRating: double.parse(ratingLists[index].productRating),
                                  itemBuilder: (context, _) {
                                    return Icon(
                                      Icons.star_rounded,
                                      color: CustomColor.kOrangeColor,
                                    );
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            Text(
                                ratingLists[index].date,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              ratingLists[index].productReview,
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

  Widget leaveComment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leave A Comment',
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15
          ),
        ),
        spacerHeight(8),
        RatingBar.builder(
          itemCount: 5,
          // ignoreGestures: true,
          unratedColor: CustomColor.kLightOrangeColor,
          allowHalfRating: true,
          itemSize: 18,
          minRating: 0,
          glow: false,
          initialRating: 0,
          itemBuilder: (context, _) {
            return Icon(
              Icons.star_rounded,
              color: CustomColor.kOrangeColor,
            );
          },
          onRatingUpdate: (rating) {
            ratingValue = rating;
            print(rating);
          },
        ),
        spacerHeight(8),
        Text('Your Comment'),
        spacerHeight(8),

        TextFormField(
          maxLines: 3,
          cursorColor: Colors.black,
          controller: commentController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        spacerHeight(8),

        GestureDetector(
          onTap: (){
            if(ratingValue ==0.0) {
              print('Min. Rating 1');
            }
            else {
              print('Rating : $ratingValue');
              print('Comment : ${commentController.text.trim()}');
            }

          },
          child: Container(
            width: Get.width * 0.35,
            decoration: BoxDecoration(
              color: CustomColor.kPinkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
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
    );
  }

}
