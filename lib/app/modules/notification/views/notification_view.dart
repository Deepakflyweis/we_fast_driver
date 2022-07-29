import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/notification/widgets/notification_tile.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/back_app_bar.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
          title: Text(
        notification,
        style: white15Style,
      )),
      body: RefreshIndicator(
        displacement: 2.h,
        onRefresh: () async {
          await controller.callGetNotificationApi();
        },
        child: controller.obx(
          (state)=> ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state!.length,
            itemBuilder: (context, index) => Obx(
              () => NotificationsTile(
                notificationModel: state[index],
                  index: index,
                  selectedIndex: controller.selectedNotificationIndex.value),
            ),
          ),
          onEmpty: Center(child: Text(noCurrentNotification),)
        ),
      ),
    );
  }
}
