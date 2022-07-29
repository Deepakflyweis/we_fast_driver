import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/home_app_bar.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (val) {
              controller.currentIndex(val);
            },
            selectedLabelStyle: black12Style,
            unselectedLabelStyle: grey12Style,
            selectedItemColor: black,
            unselectedItemColor: grey400,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                  ),
                  label: home),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/orders.png"),
                  ),
                  label: orders),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/accout.png"),
                  ),
                  label: account),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/profile.png"),
                  ),
                  label: profile),
            ],
          ),
        ));
  }
}
