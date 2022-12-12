import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  final String text;
  final controller;
  const InputTextFormField({required this.text, this.controller, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: textTheme().headline2,
          ),
          SizedBox(height: gap_s),
          TextFormField(
            controller: controller,
            validator: (value) => value!.isEmpty ? "${text}를 입력 해 주세요" : null,
            obscureText: text == "Password" ? true : false,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kMainColor, width: 2),
              ),
              hintText: "$text 입력",
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
