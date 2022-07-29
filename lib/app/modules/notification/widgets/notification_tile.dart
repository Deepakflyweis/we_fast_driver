import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/notification_model.dart';
import 'package:we_fast_driver_panel/app/modules/notification/controllers/notification_controller.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.notificationModel
  }) : super(key: key);

  final int index;
  final int selectedIndex;
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          NotificationController controller = Get.find();
          controller.selectedNotificationIndex.value = index;
        },
        child: PhysicalModel(
            color: Colors.white,
            elevation: 3,
            borderRadius: BorderRadius.circular(6),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset(
                    'assets/icons/notification_tile_icon.png',
                    height: 5.h,
                  ),
                  title: index == selectedIndex
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notificationModel.sender,
                              style: black12Style,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              DateFormat.yMd().format(notificationModel.updatedAt)+ " . " + DateFormat.jmv().format(notificationModel.updatedAt),
                              style: grey12Style,
                            ),
                          ],
                        )
                      : SizedBox(
                          width: 70.w,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              notificationModel.message,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                  trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                            PopupMenuItem(
                                value: "deleteNotification",
                                onTap: () {
                                  /*  Navigator.pop(context, "deleteNotification");
                                  NotificationController _notificationController =
                                      Get.find();
                                  _notificationController
                                      .callDeleteNotificationApi(notification.id); */
                                },
                                child: Center(
                                    child: Text(
                                  'Delete',
                                  style: TextStyle(fontSize: 13),
                                )))
                          ]),
                ),
                if (index == selectedIndex)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text(
                      notificationModel.message,
                      style: grey12Style,
                    ),
                  )
              ],
            )),
      ),
    );
  }
}
