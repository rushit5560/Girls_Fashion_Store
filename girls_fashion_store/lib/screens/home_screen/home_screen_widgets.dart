import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/api_url.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:girls_fashion_store/models/home_screen_model/featured_product_model.dart';
import 'package:girls_fashion_store/screens/category_screen/category_screen.dart';
import 'package:girls_fashion_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SearchBarModule extends StatelessWidget {
  const SearchBarModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class BannerModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: homeScreenController.bannerLists.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = ApiUrl.ApiMainPath +
            "${homeScreenController.bannerLists[index].imagePath}";
        return _buildImage(imgUrl, index);
      },
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        // autoPlayInterval: Duration(seconds: 3),
        viewportFraction: 1,
        onPageChanged: (index, reason) =>
            homeScreenController.activeIndex.value = index,
      ),
    );
  }

  Widget _buildImage(String imgUrl, int index) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
          ),
          margin: EdgeInsets.symmetric(horizontal: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Text(
              'Fashion Trends $index',
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
}

class BannerIndicatorModule extends StatelessWidget {
  BannerIndicatorModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSmoothIndicator(
        activeIndex: homeScreenController.activeIndex.value,
        count: homeScreenController.bannerLists.length,
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

class CategoryListModule extends StatelessWidget {
  CategoryListModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Container(
          height: 115,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.categoryListImage.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Material(
                  elevation: 9,
                  type: MaterialType.circle,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => CategoryScreen());
                    },
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                                homeScreenController.categoryListImage[index]),
                          )),
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
}

class PopularProductsModule extends StatelessWidget {
  PopularProductsModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                print('Clicked On View All');
              },
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
        SpacerHeight(15),
        GridView.builder(
          itemCount: homeScreenController.featuredProductLists.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 6 / 7,
          ),
          itemBuilder: (context, index) {
            Datum1 singleItem =
                homeScreenController.featuredProductLists[index];
            String imgUrl = "${ApiUrl.ApiMainPath}" + singleItem.showimg;
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
                                image: NetworkImage("$imgUrl"),
                              ),
                            ),
                            SpacerHeight(10),
                            Text(
                              singleItem.productname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SpacerHeight(3),
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
                            SpacerHeight(3),
                            Text(
                              '\$${singleItem.productcost}',
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
                              onPressed: () {},
                              icon:
                                  /*homeScreenController
                                      .popularProductLists[index].isFavorite!
                                  ? Icon(Icons.favorite_rounded)
                                  :*/
                                  Icon(Icons.favorite_border_rounded),
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
}

class SingleBannerModule extends StatelessWidget {
  const SingleBannerModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 140,
        width: Get.width,
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
}

class MostSaleProductsModule extends StatelessWidget {
  MostSaleProductsModule({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Most Sale',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SpacerHeight(10),
        Container(
          height: 100,
          child: ListView.builder(
            itemCount: homeScreenController.featuredProductLists.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Datum1 singleItem =
                  homeScreenController.featuredProductLists[index];
              String imgUrl = "${ApiUrl.ApiMainPath}" + singleItem.showimg;
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetailScreen(),
                          arguments: singleItem.id);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: Get.width * 0.60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("$imgUrl"),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${singleItem.productname}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SpacerHeight(5),
                              RatingBar.builder(
                                itemCount: 5,
                                ignoreGestures: true,
                                unratedColor: AppColor.kLightOrangeColor,
                                allowHalfRating: true,
                                itemSize: 18,
                                minRating: 1,
                                glow: false,
                                initialRating: 4,
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
                              SpacerHeight(5),
                              Text(
                                '\$${singleItem.productcost}',
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
