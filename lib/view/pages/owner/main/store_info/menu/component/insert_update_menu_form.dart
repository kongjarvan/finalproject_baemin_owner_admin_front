import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertUpdateMenuForm extends StatelessWidget {
  const InsertUpdateMenuForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 240,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.add),
                              Text(
                                '사진 추가하기',
                                style: textTheme().bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: gap_l),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          InputTextFormField(
                            text1: '메뉴 이름',
                            text2: '메뉴 이름 입력',
                            controller: null,
                            maxLine: 1,
                            isReadOnly: false,
                          ),
                          SizedBox(height: gap_l),
                          InputTextFormField(
                            text1: '메뉴 가격',
                            text2: '메뉴 가격 입력',
                            controller: null,
                            maxLine: 1,
                            isReadOnly: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: gap_m),
                InputTextFormField(
                  text1: '메뉴 설명',
                  text2: '메뉴 설명 입력',
                  controller: null,
                  maxLine: 3,
                  isReadOnly: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
