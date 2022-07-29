import 'package:get/get.dart';

import '../controllers/step_selector_controller.dart';

class StepSelectorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StepSelectorController>(
      () => StepSelectorController(),
    );
  }
}
