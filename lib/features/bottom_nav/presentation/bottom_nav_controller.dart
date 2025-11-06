import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../home/presentation/home_screen.dart';
import '../../notifications/notification_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../search/presentation/search_screen.dart';

class BottomNavController extends GetxController {
  int selectedScreen = 0;

  late List<Widget> screenList;

  BottomNavController();

  @override
  void onInit() {
    screenList = [
      HomeScreen(),
      SearchScreen(),
      NotificationScreen(),
      Profile(),
    ];

    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void setSelectedScreen(int value) {
    selectedScreen = value;
    update();
  }
}
