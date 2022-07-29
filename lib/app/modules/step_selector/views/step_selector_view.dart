import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/step_selector/widgets/animated_selection_tile.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';
import 'package:we_fast_driver_panel/app/widgets/app_logo/app_logo_horizontal.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/constants.dart';
import '../controllers/step_selector_controller.dart';

class StepSelectorView extends GetView<StepSelectorController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PhysicalModel(
                  color: Colors.transparent,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        AppLogoHorizontal(),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Text(
                            gladYouAreBecoming,
                            style: grey12Style,
                          ),
                        ),
                        Obx(
                          () => AnimatedSelectionTile(
                            stepNumber: 1,
                            title: uploadDocuments,
                            subTitle:
                                drivingLicense + "," + aadhaarCard + "," + etc,
                            selectedStep: controller.selectedStep.value,
                            onTap: () {
                              Get.toNamed(Routes.UPLOAD_DOCUMENT);
                            },
                          ),
                        ),
                        Obx(
                          () => AnimatedSelectionTile(
                            stepNumber: 2,
                            title: training,
                            subTitle: getSelfTrained,
                            selectedStep: controller.selectedStep.value,
                            onTap: () {},
                          ),
                        ),
                        Obx(
                          () => Visibility(
                              visible: controller.selectedStep.value == 2&& controller.documentsUploaded==true,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.BOTTOM_NAV_BAR);
                                  },
                                  child: Text(
                                    skip,
                                    style: primary10Style,
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'version'.tr + ' ' + versionCode,
                style: TextStyle(color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
