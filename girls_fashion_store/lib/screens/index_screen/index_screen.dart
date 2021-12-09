import 'package:flutter/material.dart';
import 'package:girls_fashion_store/screens/cart_screen/cart_screen.dart';
import 'package:girls_fashion_store/screens/favorite_screen/favorite_screen.dart';
import 'package:girls_fashion_store/screens/home_screen/home_screen.dart';
import 'package:girls_fashion_store/screens/notification_screen/notification_screen.dart';
import 'package:girls_fashion_store/screens/profile_screen/profile_screen.dart';

class IndexScreen extends StatefulWidget {

  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {


  int _currentIndex = 0;

  final tabs = [
    HomeScreen(),
    NotificationScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
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
