import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/auth_repo.dart';
import 'package:we_fast_driver_panel/app/modules/login/controllers/login_controller.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';

import '../../../services/date_formatter.dart';

class OtpController extends GetxController {
  RxString elapsedTime = '01:00'.obs;
  int _start = 60;
  late Timer _timer;
  List<TextEditingController> otpControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  String _otp = "";

  void checkOtp() {
    _otp = "";
    for (var element in otpControllers) {
      _otp += element.text;
    }
    if (_otp.length == 6) {
      AuthRepo authRepo = AuthRepo();
      LoginController loginController = Get.find();
      authRepo.verifyOtp(mobile: loginController.mobileNumber.text, otp: _otp);
    }
  }

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start < 1) {
        timer.cancel();
        elapsedTime.value = '00:00';
      } else {
        _start = _start - 1;
        elapsedTime.value = DateFormatter.formatSecondsToString(_start);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
