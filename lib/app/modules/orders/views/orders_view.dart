import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/orders/widgets/orders_tile.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/home_app_bar.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_string.dart';
import '../../../../constants/text_styles.dart';
import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: appName,
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        displacement: 10,
        onRefresh: () async {
          await controller.callGetBookingSuggestionApi();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: Text(
                          orderAvailables,
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
                controller.obx(
                    (state) => ListView.builder(
                          itemCount: state!.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) => OrderTile(
                                bookingModel: state[index],
                              )),
                        ),
                    onEmpty: Center(
                      child: Text("No Orders"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
