import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/profile/widget/details_tile.dart';
import 'package:we_fast_driver_panel/app/widgets/app_bar/home_app_bar.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';
import 'package:we_fast_driver_panel/constants/translations.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: HomeAppBar(
        title: profile,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 5.w),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(6.sp),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Username",
                      style: black15BoldStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.changeProfilePic();
                          },
                          child: Text(
                            changeProfilePicture,
                            style: primary10Style,
                          ),
                        ),
                        Icon(
                          Icons.edit,
                          size: 15.sp,
                          color: primaryColor,
                        )
                      ],
                    ),
                    DetailsTile(title: personalDocument, data: "None"),
                    DetailsTile(title: vehicleDocument, data: "None"),
                    ListTile(
                      leading: Image.asset(
                        "assets/icons/language.png",
                        height: 4.h,
                      ),
                      title: Text(
                        deviceLanguage,
                        style: black12Style,
                      ),
                      trailing: DropdownButtonHideUnderline(
                        child: DropdownButton<Map<String, String>>(
                          isDense: true,
                          items: AppTranslation.supportedLanguages
                              .map((e) => DropdownMenuItem<Map<String, String>>(
                                  value: e, child: Text(e.keys.first)))
                              .toList(),
                          onChanged: (val) {
                            controller.findAppLanguage();
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/icons/legal_info.png",
                        height: 4.h,
                      ),
                      title: Text(
                        legalInformation,
                        style: black12Style,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/icons/privacy.png",
                        height: 4.h,
                      ),
                      title: Text(
                        privacyPolicy,
                        style: black12Style,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: ClipOval(
                child: Image.network(
                  "",
                  height: 14.h,
                  errorBuilder: (context, _, __) => Image.asset(
                    "assets/images/user.png",
                    height: 14.h,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
