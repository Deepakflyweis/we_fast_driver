import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/api_client.dart';
import 'package:we_fast_driver_panel/app/data/api_provider/repositories/auth_repo.dart';
import 'package:we_fast_driver_panel/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();
  GlobalKey<FormState> numberKey = GlobalKey();

  String? numberValidator(value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return '';
    }
    return null;
  }

  checkNumber() async {
    if (numberKey.currentState!.validate()) {      
      AuthRepo authRepo = AuthRepo();
      authRepo.sendOtp(mobile: mobileNumber.text);
    }
  }
}
