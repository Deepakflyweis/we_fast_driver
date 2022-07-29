import 'package:get/get.dart';

import 'package:we_fast_driver_panel/app/modules/account/bindings/account_binding.dart';
import 'package:we_fast_driver_panel/app/modules/account/views/account_view.dart';
import 'package:we_fast_driver_panel/app/modules/add_vehicle_details/bindings/add_vehicle_details_binding.dart';
import 'package:we_fast_driver_panel/app/modules/add_vehicle_details/views/add_vehicle_details_view.dart';
import 'package:we_fast_driver_panel/app/modules/bottom_nav_bar/bindings/bottom_nav_bar_binding.dart';
import 'package:we_fast_driver_panel/app/modules/bottom_nav_bar/views/bottom_nav_bar_view.dart';
import 'package:we_fast_driver_panel/app/modules/drawer/bindings/drawer_binding.dart';
import 'package:we_fast_driver_panel/app/modules/drawer/views/drawer_view.dart';
import 'package:we_fast_driver_panel/app/modules/earning/bindings/earning_binding.dart';
import 'package:we_fast_driver_panel/app/modules/earning/views/earning_view.dart';
import 'package:we_fast_driver_panel/app/modules/home/bindings/home_binding.dart';
import 'package:we_fast_driver_panel/app/modules/home/views/home_view.dart';
import 'package:we_fast_driver_panel/app/modules/login/bindings/login_binding.dart';
import 'package:we_fast_driver_panel/app/modules/login/views/login_view.dart';
import 'package:we_fast_driver_panel/app/modules/notification/bindings/notification_binding.dart';
import 'package:we_fast_driver_panel/app/modules/notification/views/notification_view.dart';
import 'package:we_fast_driver_panel/app/modules/order_details/bindings/order_details_binding.dart';
import 'package:we_fast_driver_panel/app/modules/order_details/views/order_details_view.dart';
import 'package:we_fast_driver_panel/app/modules/order_history/bindings/order_history_binding.dart';
import 'package:we_fast_driver_panel/app/modules/order_history/views/order_history_view.dart';
import 'package:we_fast_driver_panel/app/modules/orders/bindings/orders_binding.dart';
import 'package:we_fast_driver_panel/app/modules/orders/views/orders_view.dart';
import 'package:we_fast_driver_panel/app/modules/otp/bindings/otp_binding.dart';
import 'package:we_fast_driver_panel/app/modules/otp/views/otp_view.dart';
import 'package:we_fast_driver_panel/app/modules/profile/bindings/profile_binding.dart';
import 'package:we_fast_driver_panel/app/modules/profile/views/profile_view.dart';
import 'package:we_fast_driver_panel/app/modules/splash/bindings/splash_binding.dart';
import 'package:we_fast_driver_panel/app/modules/splash/views/splash_view.dart';
import 'package:we_fast_driver_panel/app/modules/step_selector/bindings/step_selector_binding.dart';
import 'package:we_fast_driver_panel/app/modules/step_selector/views/step_selector_view.dart';
import 'package:we_fast_driver_panel/app/modules/upload_document/bindings/upload_document_binding.dart';
import 'package:we_fast_driver_panel/app/modules/upload_document/views/upload_document_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.ADD_VEHICLE_DETAILS,
      page: () => AddVehicleDetailsView(),
      binding: AddVehicleDetailsBinding(),
    ),
    GetPage(
      name: _Paths.STEP_SELECTOR,
      page: () => StepSelectorView(),
      binding: StepSelectorBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_DOCUMENT,
      page: () => UploadDocumentView(),
      binding: UploadDocumentBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
        name: _Paths.DRAWER,
        page: () => DrawerView(),
        binding: DrawerBinding(),
        transitionDuration: Duration(milliseconds: 500),
        transition: Transition.leftToRightWithFade),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
        name: _Paths.NOTIFICATION,
        page: () => NotificationView(),
        binding: NotificationBinding(),
        transitionDuration: Duration(milliseconds: 500),
        transition: Transition.rightToLeftWithFade),
    GetPage(
      name: _Paths.ORDER_HISTORY,
      page: () => OrderHistoryView(),
      binding: OrderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.EARNING,
      page: () => EarningView(),
      binding: EarningBinding(),
    ),
  ];
}
