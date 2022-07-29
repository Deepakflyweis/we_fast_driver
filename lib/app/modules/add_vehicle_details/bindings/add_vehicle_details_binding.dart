import 'package:get/get.dart';

import '../controllers/add_vehicle_details_controller.dart';

class AddVehicleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddVehicleDetailsController>(
      () => AddVehicleDetailsController(),
    );
  }
}
