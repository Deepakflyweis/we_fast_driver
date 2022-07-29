import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/notification_model.dart';

import '../../../data/api_provider/repositories/notification_repo.dart';

class NotificationController extends GetxController  with StateMixin<List<NotificationModel>>{
  RxInt selectedNotificationIndex = 0.obs;
  callGetNotificationApi() {
    NotificationRepo notificationRepo = NotificationRepo();
    notificationRepo.getNotification().then((value) {
      if (value.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(value, status: RxStatus.success());
      }
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  @override
  void onInit() {
    callGetNotificationApi();
    super.onInit();
  }
}
