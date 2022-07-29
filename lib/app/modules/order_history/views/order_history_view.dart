import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/back_app_bar.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_string.dart';
import '../controllers/order_history_controller.dart';
import '../widgets/order_history_tile.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: Text(
          appName,
          style: white15Style,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Text(
                      orderHistory,
                      style: black12Style,
                    ),
                  ),
                  Expanded(
                      child: Container(
                    color: grey400,
                    height: 2,
                  ))
                ],
              ),
            ),
            Expanded(
              child: controller.obx(
                  (state) => ListView.builder(
                        itemCount: state!.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: ((context, index) => OrderHistoryTile(
                              bookingModel: state[index],
                            )),
                      ),
                  onEmpty: Center(
                    child: Text("No Bookings"),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
