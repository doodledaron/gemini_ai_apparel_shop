import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gemini_ai_apparel_shop/src/modules/camera/camera_bloc/camera_bloc.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/home_bloc/home_bloc.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/repositories/apparel_repo.dart';
import 'package:gemini_ai_apparel_shop/src/modules/home/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';

class NavigationScreen extends StatefulWidget {
  final int tabIndex;
  const NavigationScreen({
    super.key,
    this.tabIndex = 0,
  });

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final ApparelRepo apparelRepo = ApparelRepo();
  late HomeBloc homeBloc;
  late CameraBloc cameraBloc;
  var _bottomNavIndex = 0;
  List<CameraDescription>? _cameras;
  final iconList = <IconData>[
    Icons.home_filled,
    Icons.search,
    Icons.bookmark,
    Icons.person,
  ];

  @override
  void initState() {
    super.initState();
    initializeAvailableCameras();
    homeBloc = HomeBloc(apparelRepo)..add(HomeInitialEvent());
    cameraBloc = CameraBloc();
  }

  void initializeAvailableCameras() async {
    _cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    print('the current tab index in navigation is ${widget.tabIndex}');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          context.pushNamed('camera', extra: _cameras);
        },
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
        return HomeScreen(
          tabIndex: widget.tabIndex,
        );
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
