import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/constants.dart';
import '../../../constants/text_styles.dart';

class AppLogoVertical extends StatelessWidget {
  const AppLogoVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/icons/logo.png',
            // semanticsLabel: 'Logo',
            height: 10.h,
          ),
        ),
        // Text(
        //   appName,
        //   style: black15BoldStyle,
        // )
      ],
    );
  }
}
