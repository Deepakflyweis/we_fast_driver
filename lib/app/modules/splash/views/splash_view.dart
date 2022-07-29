import 'package:flutter/material.dart';
 

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
 
import 'package:we_fast_driver_panel/app/widgets/app_logo/app_logo_vertical.dart';

import '../../../../constants/app_string.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppLogoVertical(),
          Lottie.asset('assets/lottie/delivery-animation.json'),
          Text(
            welcomeText,
            style: TextStyle(
                color: Color(0xff505050),
                fontStyle: FontStyle.italic,
                fontSize: 17),
          )
        ],
      ),
    );
  }
}
