import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girls_fashion_store/common/app_color.dart';
import 'custom_widget.dart';
import 'img_url.dart';

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.kPinkColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ProfileImageAndNameModule(),

                const SpacerHeight(30),
                HomeModule(),

                CustomDivider(color: Colors.white, indent: 8.0, endIndent: Get.width * 0.55),
                NotificationModule(),

                CustomDivider(color: Colors.white, indent: 8.0, endIndent: Get.width * 0.55),
                CollectionModule(),

                CustomDivider(color: Colors.white, indent: 8.0, endIndent: Get.width * 0.55),
                MyOrderModule(),

                CustomDivider(color: Colors.white, indent: 8.0, endIndent: Get.width * 0.55),
                ProfileModule(),

                CustomDivider(color: Colors.white, indent: 8.0, endIndent: Get.width * 0.55),
                ContactUsModule(),

                CustomDivider(color: Colors.white, indent: 8.0, endIndent: Get.width * 0.55),
                SettingsModule(),

              ],
            ),
          ),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDivider(color: Colors.white, indent: 8.0, endIndent: Get.width * 0.55),
                LogOutModule(),
              ],
            ),
          ),

        ],
      ),
    );
  }

}

class ProfileImageAndNameModule extends StatelessWidget {
  ProfileImageAndNameModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      width: Get.width * 0.5,
      child: Column(
        children: [
          Container(
            height: 90, width: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white,width: 3),
                image: DecorationImage(
                    image: AssetImage(ImgUrl.profile)
                )
            ),
          ),
          const SpacerHeight(5),

          Text(
            'Jenny Doe',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SpacerHeight(5),
          Text(
            'jenny@gmail.com',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeModule extends StatelessWidget {
  HomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Home');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class NotificationModule extends StatelessWidget {
  NotificationModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Notification');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Notification',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class CollectionModule extends StatelessWidget {
  const CollectionModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Collections');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Collections',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyOrderModule extends StatelessWidget {
  MyOrderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('My Order');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'My Order',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ProfileModule extends StatelessWidget {
  ProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Profile');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ContactUsModule extends StatelessWidget {
  const ContactUsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Contact Us');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SettingsModule extends StatelessWidget {
  const SettingsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Settings');
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class LogOutModule extends StatelessWidget {
  const LogOutModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Logout');
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20,right: 8, left: 8, top: 8),
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
