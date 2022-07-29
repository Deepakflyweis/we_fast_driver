import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_string.dart';
import '../../../constants/text_styles.dart';

class UploadImageButton extends StatelessWidget {
  const UploadImageButton({
    Key? key,
    required this.onTap,
    required this.color,
  }) : super(key: key);
  final void Function() onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                uploadImage,
                style: primary10Style.copyWith(color: color),
              ),
              Icon(
                Icons.upload,
                color: color,
                size: 14.sp,
              )
            ],
          ),
        ),
      ),
    );
  }
}
