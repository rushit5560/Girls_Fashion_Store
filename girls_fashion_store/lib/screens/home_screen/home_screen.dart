import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/common_functions.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/drawer_widget.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    // Every Time Call Close Drawer Method
    homeScreenController.closeDrawer();
    return Scaffold(
      body: Obx(
        () => homeScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Stack(
                children: [
                  buildDrawer(),
                  buildFrontScreen(),
                ],
              ),
      ),
    );
  }

  Widget buildDrawer() => SafeArea(child: DrawerWidget());

  Widget buildFrontScreen() {
    return GestureDetector(
      onTap: () {
        homeScreenController.closeDrawer();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        transform: Matrix4.translationValues(
          homeScreenController.xOffset.value,
          homeScreenController.yOffset.value,
          homeScreenController.scaleFactor.value,
        )..scale(homeScreenController.scaleFactor.value),
        child: AbsorbPointer(
            absorbing: homeScreenController.isDrawerOpen(),
            child: BuildNewPage(),
        ),
      ),
    );
  }
}

class BuildNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuWidget(),
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBarModule(),
              SpacerHeight(15),
              BannerModule(),
              SpacerHeight(10),
              BannerIndicatorModule(),
              SpacerHeight(20),
              CategoryListModule(),
              PopularProductsModule(),
              SpacerHeight(20),
              SingleBannerModule(),
              SpacerHeight(20),
              MostSaleProductsModule(),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerMenuWidget extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();
  // final VoidCallback openDrawer;

  // DrawerMenuWidget({required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CommonFunctions().hideKeyBoard();
        homeScreenController.openDrawer();
      },
      icon: Icon(Icons.menu_rounded, color: Colors.black,),
    );
  }
}
