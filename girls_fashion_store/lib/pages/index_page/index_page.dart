import 'package:flutter/material.dart';
import 'package:girls_fashion_store/pages/cart_page/cart_page.dart';
import 'package:girls_fashion_store/pages/favorite_page/favorite_page.dart';
import 'package:girls_fashion_store/pages/home_page/home_page.dart';
import 'package:girls_fashion_store/pages/notification_page/notification_page.dart';
import 'package:girls_fashion_store/pages/profile_page/profile_page.dart';

class IndexPage extends StatefulWidget {

  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {


  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    NotificationPage(),
    CartPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(

          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(_currentIndex);
            });
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
        ),
    );
  }
}
