import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/text_styles.dart';

class RecTextFeild extends StatelessWidget {
  const RecTextFeild(
      {Key? key,
      required this.msg,
      required this.hint,
      required this.controller,
      required this.validator,
      this.keyboradType = TextInputType.text})
      : super(key: key);

  final String hint;
  final TextEditingController controller;
  final String msg;
  final String? Function(String?) validator;
  final TextInputType keyboradType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          msg,
          style: grey12Style,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Stack(
            children: [
              PhysicalModel(
                  color: white,
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10.sp),
                  child: SizedBox(
                    height: 7.h,
                    width: double.infinity,
                  )),
              TextFormField(
                  validator: validator,
                  controller: controller,
                  keyboardType: keyboradType,
                  decoration: InputDecoration(
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    hintStyle: grey12Style,
                    contentPadding: EdgeInsets.fromLTRB(5.w, 2.h, 0, 2.h),
                    hintText: hint,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
