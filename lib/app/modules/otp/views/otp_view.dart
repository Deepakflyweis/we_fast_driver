import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/widgets/app_logo/app_logo_vertical.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/constants.dart';

import '../../../../constants/app_colors.dart';
import '../../../widgets/buttons/rounded_gradient_button.dart';
import '../../../widgets/text_feilds/otp_input.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: PhysicalModel(
                  color: Colors.transparent,
                  elevation: 3,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    width: double.infinity,
                    height: 68.h,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20))),
                    child: Column(
                      children: [
                        const Spacer(),
                        AppLogoVertical(),
                        const Spacer(),
                        Text(
                          autoVerifying,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OtpInput(
                                controller: controller.otpControllers[0],
                                autoFocus: true),
                            OtpInput(
                                controller: controller.otpControllers[1],
                                autoFocus: false),
                            OtpInput(
                                controller: controller.otpControllers[2],
                                autoFocus: false),
                            OtpInput(
                                controller: controller.otpControllers[3],
                                autoFocus: false),
                            OtpInput(
                                controller: controller.otpControllers[4],
                                autoFocus: false),
                            OtpInput(
                                controller: controller.otpControllers[5],
                                autoFocus: false),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(() => InkWell(
                                  onTap: () {
                                    /* isLogin
                                        ? controller.resendLoginOtp()
                                        : controller.resendRegisterOtp(); */
                                  },
                                  child: Text(
                                    resend,
                                    style: TextStyle(
                                        color: controller.elapsedTime.value ==
                                                "00:00"
                                            ? primaryColor
                                            : Colors.grey),
                                  ),
                                )),
                            Obx(
                              () => Text(
                                '${controller.elapsedTime.value} secs',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RoundedGradientButton(
                              title: verify,
                              gradient: primayGradientVertical,
                              onTap: () {
                                controller.checkOtp();
                              }),
                        ),
                        const Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                version + ' ' + versionCode,
                style: TextStyle(color: primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
