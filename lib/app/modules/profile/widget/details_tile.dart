import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';

import '../../../../constants/text_styles.dart';

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: black12Style,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 1.h,
            ),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.sp),
                    border: Border.all(color: grey400)),
                child: Padding(
                  padding: EdgeInsets.all(6.sp),
                  child: Text(
                    data,
                    style: grey12Style,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
