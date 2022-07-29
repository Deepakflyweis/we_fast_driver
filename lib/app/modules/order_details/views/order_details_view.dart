import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/order_details/widgets/start_stop_widget.dart';
import 'package:we_fast_driver_panel/app/services/date_formatter.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/back_app_bar.dart';
import 'package:we_fast_driver_panel/app/widgets/buttons/rectangular_border_button.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../controllers/order_details_controller.dart';
import '../widgets/sender_reciever_tile.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state)=> Scaffold(
        appBar: BackAppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                loadId + ": " + state!.id,
                style: white12Style,
              ),
              Text(
                DateFormatter.formatToTextDateTime(state.createdAt),
                style: white10Style,
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        loadDetails,
                        style: black15Style,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 2,
                        color: Colors.grey.shade200,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  color: Colors.grey.shade200,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            controller.vehicleTypeModel.image,
                            height: 7.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                            errorBuilder: (context, _, __) => const Center(
                              child: Icon(Icons.image),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.vehicleTypeModel.name,
                            style: black10Style,
                          ),
                          Text(
                            vehicleNumber,
                            style: black10Style,
                          ),                          
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(
                            "${rs} ${state.amount}",
                            style: green10Style,
                          ),
                          Text(
                            totalAmount,
                            style: black10Style,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SenderReceiverTile(
                  sMobile: state.senderDetails.phoneNumber,
                  sName: state.senderDetails.name,
                  rMobile: state.receiverDetails.phoneNumber,
                  rName: state.receiverDetails.name,
                ),
                Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      border: Border.all(color: Colors.grey.shade100)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(pickeUpAndDropLocation),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: StartStopWidget(
                        distance: 35,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 15.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  state.pickupAddress,
                                  style: grey12Style,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 15.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  state.dropAddress,
                                  style: grey12Style,
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey400),
                      borderRadius: BorderRadius.circular(4.sp),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                      child: Row(
                        children: [
                          Text(
                            goodsType,
                            style: grey12Style,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CheckboxListTile(
                  value: state.labourNeeded,
                  onChanged: (val) {},
                  title: Text(
                    handlersRequired,
                    style: black12Style,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                RectangularBorderButton(
                    title: acceptLoad,
                    onTap: () {
                      controller
                          .callAcceptBookingApi();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
