import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../routes/app_pages.dart';
import '../../../constants/app_colors.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final Widget title;

  @override
  Size get preferredSize => Size(
        double.infinity,
        9.h,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: primaryGradientHorizontal,
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(15.sp))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: white,
                    size: 30.sp,
                  ),
                ),
                // Text(
                //   ,
                //   style: white15Style,
                // ),
                title,
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  child: ImageIcon(
                    AssetImage("assets/icons/notification.png"),
                    color: white,
                    size: 25.sp,
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
