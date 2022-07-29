import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/text_styles.dart';
import '../../routes/app_pages.dart';

class DrawerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DrawerAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

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
                  child: Image.asset(
                    "assets/icons/menu_close.png",
                    height: 5.h,
                  ),
                ),
                Text(
                  title,
                  style: white15Style,
                ),
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
