import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/text_styles.dart';

class RectangularBorderButton extends StatelessWidget {
  const RectangularBorderButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 5.h,
          //width: 50.w,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(6)),
          child: Center(
              child: Text(
            title,
            style: primary15Style,
          )),
        ),
      ),
    );
  }
}
