import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/modules/orders/controllers/orders_controller.dart';

import '../../account/controllers/account_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(
      () => BottomNavBarController(),
    );
    Get.lazyPut<HomeController>(
      ()=> HomeController(),
    );
    Get.lazyPut<OrdersController>(
      () => OrdersController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.put<ProfileController>(
      ProfileController(),
    );
  }
}
