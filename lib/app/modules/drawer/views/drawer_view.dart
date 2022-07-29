import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:we_fast_driver_panel/app/modules/notification/views/notification_view.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/drawer_app_bar.dart';
import 'package:we_fast_driver_panel/app/widgets/app_logo/app_logo_vertical.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';

import '../../../../constants/app_string.dart';
import '../controllers/drawer_controller.dart';

class DrawerView extends GetView<DrawerGetController> {
  BottomNavBarController barController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: DrawerAppBar(title: menu),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  barController.currentIndex(0);
                  Get.back();
                },
                leading: Image.asset(
                  'assets/icons/home_color.png',
                  height: 4.h,
                ),
                title: Text(home),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.ORDER_HISTORY);
                },
                leading: Image.asset(
                  'assets/icons/loads_history.png',
                  height: 4.h,
                ),
                title: Text(orderHistory),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.EARNING);
                },
                leading: Image.asset(
                  'assets/icons/earning.png',
                  height: 4.h,
                ),
                title: Text(earnings),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  barController.currentIndex(2);
                  Get.back();
                },
                leading: Image.asset(
                  'assets/icons/my_wallet.png',
                  height: 4.h,
                ),
                title: Text(myWallet),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.NOTIFICATION);
                },
                leading: Image.asset(
                  'assets/icons/notification_color.png',
                  height: 4.h,
                ),
                title: Text(notification),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  barController.currentIndex(3);
                  Get.back();
                },
                leading: Image.asset(
                  'assets/images/user.png',
                  height: 4.h,
                ),
                title: Text(profile),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
                leading: Image.asset(
                  'assets/icons/logout.png',
                  height: 4.h,
                ),
                title: Text('Logout'),
              ),
            ),
            AppLogoVertical(),
          ],
        ),
      ),
    );
  }
}
