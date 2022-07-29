import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../../../widgets/app_bar/home_app_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: HomeAppBar(
        title: appName,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                bookingCount,
                style: primary12Style,
              ),
              Text(
                earning,
                style: primary12Style,
              ),
              Text(
                tripsCancelled,
                style: primary12Style,
              ),
            ],
          ),
        ),
        Divider(
          height: 2.h,
          thickness: 2,
          color: grey400,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Obx(
            ()=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  controller.bookingCount.value,
                  style: black15Style,
                ),
                Text(
                  rs + controller.earnings.value,
                  style: black15Style,
                ),
                Text(
                  controller.tripsCancelled.value,
                  style: black15Style,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GoogleMap(
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: controller.kGooglePlex,
            polylines: Set<Polyline>.of(controller.polylines),
            markers: Set<Marker>.of(controller.allMarkers),
            onMapCreated: (contr) {
              controller.mapController.complete(contr);
            },
          ),
        )
      ]),
    );
  }
}
