import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/location_repo.dart';
import 'package:we_fast_driver_panel/app/modules/account/views/account_view.dart';
import 'package:we_fast_driver_panel/app/modules/home/views/home_view.dart';
import 'package:we_fast_driver_panel/app/modules/orders/views/orders_view.dart';
import 'package:we_fast_driver_panel/app/modules/profile/views/profile_view.dart';

class BottomNavBarController extends GetxController {
  Rx<int> currentIndex = 0.obs;
  late Timer timer;
  List<Widget> pages = [
    HomeView(),
    OrdersView(),
    AccountView(),
    ProfileView(),
  ];

  @override
  onInit() {
    super.onInit();
    callUpdateUserLocationApi();
  }

  callUpdateUserLocationApi() {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      LocationRepo locationRepo = LocationRepo();
      locationRepo.updateUserLocation();
    });
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
