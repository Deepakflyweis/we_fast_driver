import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:we_fast_driver_panel/app/modules/step_selector/controllers/step_selector_controller.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/text_styles.dart';

class AnimatedSelectionTile extends StatelessWidget {
  StepSelectorController stepSelectorController = Get.find();
  AnimatedSelectionTile(
      {Key? key,
      required this.stepNumber,
      required this.title,
      required this.subTitle,
      required this.selectedStep,
      required this.onTap})
      : super(key: key);
  final int stepNumber;
  final String title;
  final String subTitle;
  final int selectedStep;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              stepSelectorController.selectedStep.value = stepNumber;
            },
            child: PhysicalModel(
              color: white,
              borderRadius: BorderRadius.circular(4.sp),
              elevation: 3,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.sp),
                    gradient: selectedStep == stepNumber
                        ? primaryGradientHorizontal
                        : LinearGradient(
                            colors: [Colors.transparent, Colors.transparent])),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: selectedStep == stepNumber ? 2.h : 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:
                                    selectedStep == stepNumber ? white : grey),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: Text(
                              stepNumber.toString(),
                              style: selectedStep == stepNumber
                                  ? white15Style
                                  : grey15Style,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: selectedStep == stepNumber
                                  ? white12Style
                                  : grey12Style,
                            ),
                            if (selectedStep == stepNumber)
                              Text(
                                subTitle,
                                style: white10Style,
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                        child: Center(
                          child: Visibility(
                            visible: selectedStep == stepNumber,
                            child: InkWell(
                              onTap: onTap,
                              child: Icon(
                                Icons.chevron_right,
                                size: 18.sp,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
