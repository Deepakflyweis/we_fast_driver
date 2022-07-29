import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/back_app_bar.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

import '../controllers/earning_controller.dart';

class EarningView extends GetView<EarningController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: BackAppBar(title: Text(earnings, style: white15Style)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        child: Column(
          children: [
            PhysicalModel(
              color: white,
              borderRadius: BorderRadius.circular(6.sp),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(4.sp),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    earningHistory,
                    style: black12Style,
                  )),
            ),
            Expanded(
              child: PhysicalModel(
                color: white,
                borderRadius: BorderRadius.circular(6.sp),
                elevation: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            date,
                            style: grey10Style,
                          ),
                          Text(
                            earning,
                            style: grey10Style,
                          ),
                          Text(
                            timeSpent,
                            style: grey10Style,
                          ),
                          Text(
                            tripsTaken,
                            style: grey10Style,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 1,
                      color: grey400,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                DateFormat.yMMMd().format(DateTime.now()),
                                style: black10Style,
                              ),
                              Text(
                                rs + " " + "200",
                                style: black10Style,
                              ),
                              Text(
                                "1h 20m",
                                style: black10Style,
                              ),
                              Text(
                                "1" + " " + tripTaken,
                                style: black10Style,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
