import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watchshop/CartPage.dart';
import 'package:watchshop/FavoritePage.dart';
import 'package:watchshop/HomePage.dart';
import 'package:watchshop/ProfilePage.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomePage(),
    CartPage(),
    FavoritePage(),
    ProfilePage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: (){},
          child: Icon(
            Icons.notifications ,
            color: Colors.white, 
            size: 20 ,
            ),
            backgroundColor: Color.fromRGBO(0, 96, 57, 100),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked ,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: [
            CupertinoIcons.home,
            CupertinoIcons.cart,
            CupertinoIcons.heart,
            CupertinoIcons.profile_circled,
          ],
          // splashColor:,
          inactiveColor: Colors.black.withOpacity(0.5),
          activeColor: Color.fromRGBO(0, 96, 57, 100),
          gapLocation: GapLocation.center,
          activeIndex: pageIndex,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          iconSize: 25,
          rightCornerRadius: 10,
          elevation: 0,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          }),
    );
  }
}
