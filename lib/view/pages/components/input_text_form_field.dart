import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class InputTextFormField extends StatelessWidget {
  InputTextFormField({
    required this.text1,
    required this.text2,
    required this.controller,
    required this.isReadOnly,
    required this.maxLine,
    required this.funValidator,
    Key? key,
  }) : super(key: key);
  final String text1;
  final String text2;
  final TextEditingController controller;
  final bool isReadOnly;
  final int maxLine;
  final funValidator;

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
            validator: funValidator,
            obscureText: text1 == '비밀번호' ? true : false,
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
