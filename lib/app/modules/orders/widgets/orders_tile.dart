import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/data/models/api_models/booking_model.dart';
import 'package:we_fast_driver_panel/app/modules/bottom_nav_bar/controllers/bottom_nav_bar_controller.dart';
import 'package:we_fast_driver_panel/app/modules/home/controllers/home_controller.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../../../../constants/app_string.dart';
import '../../../services/date_formatter.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({Key? key, required this.bookingModel}) : super(key: key);

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
          height: 120,
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
                      height: 7.h,
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
                        loadId + ": " + "123456",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        loadDate +
                            ": ${DateFormatter.formatToTextDateTime(bookingModel.createdAt)}",
                        style: TextStyle(color: Colors.grey, fontSize: 9.sp),
                      ),
                      Text("Status: ${bookingModel.status}"),
                      Spacer(),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              loadTotalAmount +
                                  ": ${rs} ${bookingModel.amount}",
                              style: primary10Style.copyWith(
                                color: darkGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            if (bookingModel.status == unconfirmed) {
                              Get.toNamed(Routes.ORDER_DETAILS,
                                  arguments: bookingModel.id);
                              return;
                            }
                            if (bookingModel.status == confirmed ||
                                bookingModel.status == onGoing) {
                              var pickUpLocation = LatLng(
                                  bookingModel.pickupLocation.coordinates[1]
                                      .toDouble(),
                                  bookingModel.pickupLocation.coordinates[0]
                                      .toDouble());
                              var dropLocation = LatLng(
                                  bookingModel.dropLocation.coordinates[1]
                                      .toDouble(),
                                  bookingModel.dropLocation.coordinates[0]
                                      .toDouble());
                              Get.find<HomeController>().setPolylines(
                                  pickUpLocation: pickUpLocation,
                                  dropLocation: dropLocation);
                              Get.find<BottomNavBarController>()
                                  .currentIndex(0); //going to home screen
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                viewDetails,
                                style: TextStyle(
                                    color: Colors.indigo, fontSize: 12),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.indigo,
                              )
                            ],
                          ),
                        ),
                      ),
                      if (bookingModel.status == confirmed)
                        ElevatedButton(
                            onPressed: () {
                              //todo call checkin APi
                            },
                            child: Text("Check In")),
                      if (bookingModel.status == onGoing)
                        ElevatedButton(
                            onPressed: () {
                              //todo call checkin APi
                            },
                            child: Text("Check Out"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
