import 'package:flutter/material.dart';

Map<int, Color> primaryColorMap = {
  50: primaryColor,
  100: primaryColor,
  200: primaryColor,
  300: primaryColor,
  400: primaryColor,
  500: primaryColor,
  600: primaryColor,
  700: primaryColor,
  800: primaryColor,
  900: primaryColor,
};
MaterialColor primarySwatch = MaterialColor(0xff21C1A0, primaryColorMap);

const Color backgroundColor = const Color(0xffEFFBFF);
const Color primaryColor = const Color(0xff237F9E);
const Gradient primayGradientVertical = const LinearGradient(
  colors: [Color(0xffAFE8FB), Color(0xff237F9E)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const Gradient primaryGradientHorizontal = const LinearGradient(
  colors: [Color(0xffAFE8FB), Color(0xff237F9E)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const Gradient buttonGradientOrange = const LinearGradient(
  colors: [Color(0xffF9AB67), Color(0xffBB6417)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const Gradient buttonGradientGreen = const LinearGradient(
  colors: [Color(0xff72FEA1), Color(0xff1CBC52)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const Gradient buttonGradientBlue = const LinearGradient(
  colors: [Color(0xffAFE8FB), Color(0xff237F9E)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const Gradient buttonGradientRed = const LinearGradient(
  colors: [Color(0xffFF8A8A), Color(0xffBF3333)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const Color black = Colors.black;
const Color white = Colors.white;
Color golden = Colors.amber.shade300;
Color grey400 = Colors.grey.shade400;
Color grey200 = Colors.grey.shade200;
const Color grey = Colors.black54;
Color darkGreen = Colors.green.shade900;
Color green = Colors.green;
Color lightPrimaryColor = primaryColor.withAlpha(40);
