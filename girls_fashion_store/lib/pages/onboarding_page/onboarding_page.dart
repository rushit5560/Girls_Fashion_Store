import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'package:girls_fashion_store/common/custom_widget.dart';
import 'package:girls_fashion_store/pages/onboarding_page/onboarding_controller.dart';

class OnBoardingPage extends StatelessWidget {


  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onBoardingController.pageController,
            onPageChanged: onBoardingController.selectedPageIndex,
            itemCount: onBoardingController.onBoardingPages.length,
            itemBuilder: (context, index){
              return Container(
                width: Get.width, height: Get.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        onBoardingController.onBoardingPages[index].bgImg,
                    ),
                    fit: BoxFit.cover

                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          onBoardingController.onBoardingPages[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      SpacerHeight(15),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(
                            onBoardingController.onBoardingPages[index].description,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: 25,
            left: 20,
            child: Row(
              children: List.generate(
                onBoardingController.onBoardingPages.length,
                    (index) => Obx(
                      () => Container(
                    margin: EdgeInsets.all(4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: onBoardingController.selectedPageIndex.value ==
                            index
                            ? AppColor.kPinkColor
                            : Colors.white,
                        shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 25,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: AppColor.kPinkColor,
              onPressed: onBoardingController.forwardAction,
              child: Obx(
                    () => Text(
                  onBoardingController.isLastPage ? 'Start' : 'Next',
                  style: TextStyle(
                    color: Colors.white,
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
