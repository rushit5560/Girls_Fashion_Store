import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/common/drawer_widget.dart';
import 'package:girls_fashion_store/common/img_url.dart';
import 'package:girls_fashion_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeScreenController = Get.put(HomeScreenController());
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void openDrawer() => setState(() {
        xOffset = Get.width * 0.60;
        yOffset = Get.height * 0.20;
        scaleFactor = 0.9;
        isDrawerOpen = true;
      });

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildDrawer(),
          buildFrontScreen(),
        ],
      ),
    );
  }

  Widget buildDrawer() => SafeArea(child: DrawerWidget());

  Widget buildFrontScreen() {
    return GestureDetector(
      onTap: () {
        closeDrawer();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        transform: Matrix4.translationValues(xOffset, yOffset, scaleFactor)
          ..scale(scaleFactor),
        child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: BuildNewPage(openDrawer: openDrawer)),
      ),
    );
  }
}

class BuildNewPage extends StatelessWidget {
  final VoidCallback openDrawer;

  BuildNewPage({required this.openDrawer});

  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuWidget(openDrawer: openDrawer),
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
  final VoidCallback openDrawer;

  DrawerMenuWidget({required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        FocusManager.instance.primaryFocus!.unfocus();
        openDrawer();
      },
      icon: Icon(Icons.menu_rounded, color: Colors.black,),
    );
  }
}
