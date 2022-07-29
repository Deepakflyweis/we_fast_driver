import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/text_styles.dart';

class BasicTextField extends StatelessWidget {
  final TextEditingController controller;
  final String msg;
  final String? Function(String?) validator;
  final TextInputType keyboradType;
  const BasicTextField({
    Key? key,
    required this.controller,
    required this.msg,
    required this.validator,
    this.keyboradType = TextInputType.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          msg,
          style: black10Style,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboradType,
          decoration: InputDecoration(
            suffixIcon: InkWell(
                onTap: () {
                  controller.clear();
                },
                child: Icon(Icons.clear)),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: grey400)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: grey400)),
            border:
                UnderlineInputBorder(borderSide: BorderSide(color: grey400)),
          ),
        ),
      ],
    );
  }
}
