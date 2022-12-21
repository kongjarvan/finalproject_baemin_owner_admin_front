import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final String text1;
  final String text2;
  final controller;
  final bool isReadOnly;
  final int maxLine;
  const InputTextFormField({
    required this.text1,
    required this.text2,
    required this.controller,
    required this.isReadOnly,
    required this.maxLine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: textTheme().headline2,
          ),
          SizedBox(height: gap_s),
          TextFormField(
            maxLines: maxLine,
            readOnly: isReadOnly,
            controller: controller,
            validator: (value) => value!.isEmpty ? "${text1}를 입력 해 주세요" : null,
            obscureText: text1 == "Password" ? true : false,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kMainColor, width: 2),
              ),
              hintText: "$text2",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
