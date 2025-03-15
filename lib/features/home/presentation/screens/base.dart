import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/nav_bar_item.dart';
import 'favorite_page.dart';
import 'home_page.dart';
import 'notification_page.dart';
import 'profile_page.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  List<Widget> pages = [
    HomePage(),
    FavoritePage(),
    NotificationPage(),
    ProfilePage(),
  ];
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.primaryColor,
        items: [
          buildNavItem(
              selectedIndex == 0 ? ImageAssets.fillHome : ImageAssets.home),
          buildNavItem(
              selectedIndex == 1 ? ImageAssets.fillHeart : ImageAssets.heart),
          buildNavItem(selectedIndex == 2
              ? ImageAssets.fillNotification
              : ImageAssets.notification),
          buildNavItem(selectedIndex == 3
              ? ImageAssets.fillProfile
              : ImageAssets.profile),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
