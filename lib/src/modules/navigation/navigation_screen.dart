import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/screens/home_screen.dart';

import '../../../constants/colors.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    super.key,
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home_filled,
    Icons.search,
    Icons.bookmark,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _getPage(_bottomNavIndex),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: secondaryColor,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 0,
          rightCornerRadius: 0,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            return Icon(
              iconList[index],
              size: 24,
              color: isActive ? Colors.white : primaryColor,
            );
            //other params
          }),
    );
  }

  _getPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const Placeholder();
      case 2:
        return const Placeholder();
      case 3:
        return const Placeholder();
      default:
    }
  }
}
