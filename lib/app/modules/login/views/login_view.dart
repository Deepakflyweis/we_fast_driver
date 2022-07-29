import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_fast_driver_panel/app/widgets/app_logo/app_logo_vertical.dart';
import 'package:we_fast_driver_panel/constants/app_string.dart';
import 'package:we_fast_driver_panel/constants/app_colors.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/buttons/rounded_gradient_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: primaryColor)),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                login,
                                style: TextStyle(color: primaryColor),
                              )),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                loginUsingMobileNumber,
                                style: TextStyle(fontSize: 15.sp),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: controller.numberKey,
                            child: PhysicalModel(
                              color: white,
                              elevation: 3,
                              borderRadius: BorderRadius.circular(50),
                              child: TextFormField(
                                validator: controller.numberValidator,
                                cursorColor: Colors.black,
                                controller: controller.mobileNumber,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(height: 0),
                                    constraints: BoxConstraints(
                                      minHeight: 5.h,
                                      maxWidth: 75.w,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: SizedBox(
                                      width: 15.w,
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              '+91',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                            child: const Center(
                                              child: VerticalDivider(
                                                color: Colors.grey,
                                                thickness: 1,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    contentPadding:
                                        const EdgeInsets.only(left: 3, top: -6),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: grey200),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: grey200),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    hintText: enterMobileNumber,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RoundedGradientButton(
                              title: login,
                              gradient: primayGradientVertical,
                              onTap: controller.checkNumber),
                        ),
                        const Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: Text(or),
              ),
              Text(
                loginWith,
                style: TextStyle(color: primaryColor),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/icons/google.png',
                    height: 10.h,
                    fit: BoxFit.fitHeight,
                  ),
                  Image.asset(
                    'assets/icons/facebook.png',
                    height: 10.h,
                    fit: BoxFit.fitHeight,
                  ),
                ],
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
