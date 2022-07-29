import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/modules/step_selector/controllers/step_selector_controller.dart';
import 'package:we_fast_driver_panel/app/widgets/buttons/border_button.dart';
import 'package:we_fast_driver_panel/app/widgets/buttons/rounded_border_button.dart';
import 'package:we_fast_driver_panel/app/widgets/buttons/upload_image.dart';
import 'package:we_fast_driver_panel/app/widgets/text_feilds/basic_text_feild.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/text_styles.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/app_logo/app_logo_horizontal.dart';
import '../../../widgets/buttons/rounded_gradient_button.dart';
import '../controllers/upload_document_controller.dart';

class UploadDocumentView extends GetView<UploadDocumentController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    elevation: 3,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20))),
                      child: Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            AppLogoHorizontal(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: Text(
                                      uploadDocuments,
                                      style: black12Style,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    color: grey400,
                                    height: 2,
                                  ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: BasicTextField(
                                      controller: controller.vehicleRcNumber,
                                      msg: addVehicleRc,
                                      validator: (val) {
                                        if (val == "") {
                                          return addVehicleRc;
                                        }
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Obx(
                                    () => UploadImageButton(
                                      color: controller.rcImage.value.path == ""
                                          ? primaryColor
                                          : darkGreen,
                                      onTap: () {
                                        controller
                                            .pickImage(controller.rcImage);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: BasicTextField(
                                      controller: controller.driversLicense,
                                      msg: addDriversLicense,
                                      validator: (val) {
                                        if (val == "") {
                                          return addDriversLicense;
                                        }
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Obx(
                                    () => UploadImageButton(
                                      color:
                                          controller.licenseImage.value.path ==
                                                  ""
                                              ? primaryColor
                                              : darkGreen,
                                      onTap: () {
                                        controller
                                            .pickImage(controller.licenseImage);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: BasicTextField(
                                      controller: controller.vehicleInsurance,
                                      msg: addVehicleInsurance,
                                      validator: (val) {
                                        if (val == "") {
                                          return addVehicleInsurance;
                                        }
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Obx(
                                    () => UploadImageButton(
                                      color: controller.insurnaceImage.isEmpty
                                          ? primaryColor
                                          : darkGreen,
                                      onTap: () {
                                        controller.pickMultiImage(
                                            controller.insurnaceImage);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: BasicTextField(
                                      controller: controller.aadharOrVoter,
                                      msg: addAadharCardOrVoterId,
                                      validator: (val) {
                                        if (val == "") {
                                          return addAadharCardOrVoterId;
                                        }
                                      },
                                    ),
                                  ),
                                  Spacer(),
                                  Obx(
                                    () => UploadImageButton(
                                      color:
                                          controller.aadharOrVoterImage.isEmpty
                                              ? primaryColor
                                              : darkGreen,
                                      onTap: () {
                                        controller.pickMultiImage(
                                            controller.aadharOrVoterImage);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            RoundedGradientButton(
                              title: continueText,
                              gradient: primayGradientVertical,
                              onTap: () {
                                if (controller.key.currentState!.validate()) {
                                  controller.callUploadDocumentApi();
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h),
                              child: RoundedBorderButton(
                                title: back,
                                onTap: () {
                                  Get.toNamed(Routes.STEP_SELECTOR);
                                  /* if (controller.key.currentState!.validate()) {
                                    
                                  } */
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'version'.tr + ' ' + versionCode,
                    style: TextStyle(color: primaryColor),
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
