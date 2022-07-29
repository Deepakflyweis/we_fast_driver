import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/text_styles.dart';

class RecDropdownButton extends StatelessWidget {
  const RecDropdownButton({
    Key? key,
    required this.hint,
    required this.onChanged,
    required this.msg,
    required this.items,
    required this.validator,
    required this.value,
  }) : super(key: key);

  final Widget hint;
  final void Function(dynamic) onChanged;
  final String msg;
  final List<DropdownMenuItem<dynamic>> items;
  final String? Function(dynamic?) validator;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            DropdownButtonFormField(
                value: value,
                items: items,
                onChanged: onChanged,
                hint: hint,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5.w, 2.h, 0, 2.h),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none),
                validator: validator),
          ],
        ),
      ),
    ]);
  }
}
