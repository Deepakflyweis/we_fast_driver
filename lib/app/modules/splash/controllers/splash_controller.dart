import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  late Timer timer;
  final count = 0.obs;
  @override
  void onInit() {
    timer = Timer(Duration(seconds: 3), isLogin);
    super.onInit();
  }

  isLogin() async {
    GetStorage box = GetStorage();
    var token = await box.read(tokenString);
    var areDocumentUploaded = await box.read(areDocumentsUploadedString);
    var isVehicleRegistered = await box.read(isVehicleRegisteredString);
    if (token != null &&
        areDocumentUploaded != null &&
        isVehicleRegistered != null) {
      if (isVehicleRegistered != null && isVehicleRegistered == false) {
        Get.offNamed(Routes.ADD_VEHICLE_DETAILS);
      } else if (areDocumentUploaded != null && areDocumentUploaded == false) {
        Get.offNamed(Routes.STEP_SELECTOR);
      } else if (areDocumentUploaded == true && isVehicleRegistered == true) {
        Get.offNamed(Routes.BOTTOM_NAV_BAR);
      }
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
