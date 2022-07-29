import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/booking_model.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../../../../constants/app_string.dart';
import '../../../services/date_formatter.dart';

class OrderHistoryTile extends StatelessWidget {
  const OrderHistoryTile({Key? key, required this.bookingModel})
      : super(key: key);

  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          height: 20.h,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(6)),
          child: Padding(
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
                      "https://ak.picdn.net/shutterstock/videos/1007521867/thumb/1.jpg",
                      width: 20.w,
                      fit: BoxFit.contain,
                      errorBuilder: (context, _, __) => const Center(
                        child: Icon(Icons.image),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bookingModel.pickupAddress +
                          "-----------" +
                          bookingModel.dropAddress),
                      Text(
                        loadId + ": " + bookingModel.id,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        loadDate +
                            ": ${DateFormatter.formatToTextDateTime(bookingModel.createdAt)}",
                        style: TextStyle(color: Colors.grey, fontSize: 9.sp),
                      ),
                      Spacer(),
                      Text(
                        loadTotalAmount + ": ${rs} ${bookingModel.amount}",
                        style: primary10Style.copyWith(
                          color: darkGreen,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: buttonGradientRed),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 7),
                        child: Text(
                          bookingModel.status,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.to(() => LoadsHistoryDetails(
                        //       bookingModel: bookingModel,
                        //     ));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            viewDetails,
                            style:
                                TextStyle(color: Colors.indigo, fontSize: 12),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.indigo,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
