import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/text_styles.dart';

import '../../../constants/app_colors.dart';

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.color = primaryColor,
  }) : super(key: key);
  final String title;
  final void Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 5.h,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(25.sp)),
        child: Center(
          child: Text(
            title,
            style: primary12Style.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
