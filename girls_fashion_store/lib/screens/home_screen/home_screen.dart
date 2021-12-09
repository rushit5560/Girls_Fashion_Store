import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/drawer_widget.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../models/home_screen_model/popular_product_model.dart';

class HomeScreen extends StatefulWidget {
  final void openDrawer;
  const HomeScreen({Key? key, this.openDrawer}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  TextEditingController searchTextController = TextEditingController();

  final bannerList = [
    ImgUrl.banner1, ImgUrl.banner2, ImgUrl.banner3,
  ];
  final bannerListText = ['Fashion Trends', 'Fashion Trends2', 'Fashion Trends3'];

  int activeIndex = 0;
  // bool isFavorite = false;

  final categoryListImage = [
    ImgUrl.category1, ImgUrl.category2, ImgUrl.category3,
    ImgUrl.category4, ImgUrl.category5, ImgUrl.category6,
    ImgUrl.category7, ImgUrl.category8, ImgUrl.category9,
  ];

  List<PopularProductModel> popularProductLists = [
    PopularProductModel(
      productImg: ImgUrl.product1,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product2,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product3,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
  ];

  List<PopularProductModel> mostSaleList = [
    PopularProductModel(
      productImg: ImgUrl.product5,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product6,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product4,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
    PopularProductModel(
      productImg: ImgUrl.product2,
      productName: 'Product Name Here',
      productPrice: '200',
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     print('Menu Button');
        //     widget.openDrawer;
        //   },
        //   icon: Icon(Icons.menu),
        // ),
        title: Image(
          image: AssetImage(ImgUrl.logo),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Clicked On Cart Button');
            },
            icon: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),

      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              searchBar(),
              spacer(15),
              carouselSlider(),
              spacer(10),
              carouselIndicator(),
              spacer(20),
              categoryList(),
              // spacer(10),
              popularProduct(),
              spacer(20),
              banner(),
              spacer(20),
              mostSale(),
            ],
          ),
        ),
      ),
    );
  }

  Widget spacer(double value) {
    return SizedBox(height: value);
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40,
          child: Center(
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: 'Search',
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  // borderSide: BorderSide(width: 5),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    print('Clicked On Search Button');
                  },
                  child: Icon(
                    Icons.search_rounded,
                    color: AppColor.kPinkColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: bannerList.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = bannerList[index];
        return buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: 150,
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

  Widget buildImage(String urlImage, int index) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: DecorationImage(
              image: AssetImage(urlImage),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Text(
                bannerListText[index],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget carouselIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: bannerList.length,
      effect: WormEffect(
        dotHeight: 11,
        dotWidth: 11,
        activeDotColor: AppColor.kPinkColor,
        dotColor: Colors.grey,
      ),
    );
  }

  Widget categoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18,
          ),
        ),
        Container(
          height: 115,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryListImage.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Material(
                  elevation: 9,
                  type: MaterialType.circle,
                  color: Colors.white,
                  child: Container(
                    height: 80, width: 80,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(categoryListImage[index]),
                          )
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
    );
  }

  Widget popularProduct() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular Products',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            GestureDetector(
              onTap: () {print('Clicked On View All');},
              child: Text(
                'View All',
                style: TextStyle(
                  color: AppColor.kPinkColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        spacer(15),
        GridView.builder(
          itemCount: popularProductLists.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 6/7,
          ),
          itemBuilder: (context, index){
            return Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.grey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 120,
                              child: Image(
                                image: AssetImage(popularProductLists[index].productImg),
                              ),
                            ),
                            spacer(10),
                            Text(
                                popularProductLists[index].productName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            spacer(3),
                            RatingBar.builder(
                              itemCount: 5,
                              ignoreGestures: true,
                              unratedColor: AppColor.kLightOrangeColor,
                              allowHalfRating: true,
                              itemSize: 20,
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
                            spacer(3),
                            Text(
                              '\$${popularProductLists[index].productPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.kPinkColor,
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          right: -10,
                          child: Container(
                            child: IconButton(
                              onPressed: () {
                                print('Clicked On Favorite Button');
                                setState(() {
                                  popularProductLists[index].isFavorite = !popularProductLists[index].isFavorite!;
                                  print(popularProductLists[index].isFavorite);
                                });
                                },
                              icon: popularProductLists[index].isFavorite! ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border_rounded),
                              color: AppColor.kPinkColor,
                              iconSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget banner() {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 140, width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(ImgUrl.banner2),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget mostSale() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Most Sale',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
        ),
        spacer(10),
        Container(
          height: 100,
          child: ListView.builder(
            itemCount: mostSaleList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,right: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: Get.width * 0.60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          height: 70, width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(mostSaleList[index].productImg)
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                mostSaleList[index].productName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            spacer(5),
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
                            spacer(5),
                            Text(
                              '\$${mostSaleList[index].productPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.kPinkColor,
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
          ),
        ),
      ],
    );
  }
}
