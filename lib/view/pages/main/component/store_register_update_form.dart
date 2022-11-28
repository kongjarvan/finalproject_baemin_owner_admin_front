import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreRegisterUpdateForm extends StatelessWidget {
  final String title;
  const StoreRegisterUpdateForm({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle('${title}'),
        SizedBox(height: gap_m),
        _buildOwnerInfo(),
        SizedBox(height: gap_xl),
        _buildStoreInfo(),
        SizedBox(height: gap_xl),
      ],
    );
  }

  Align _buildTitle(text) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        '${text}',
        style: TextStyle(fontSize: 32),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildOwnerInfo() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Row(
              children: [
                Icon(CupertinoIcons.person_alt),
                SizedBox(width: gap_xs),
                Text(
                  '사업자 정보 입력하기',
                  style: textTheme().headline2,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: gap_xxs),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(text: '대표자 명'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(text: '사업자 번호'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: InputTextFormField(text: '사업자 주소'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Row(
              children: [
                Icon(CupertinoIcons.doc_text),
                SizedBox(width: gap_xs),
                Text(
                  '가게 정보 입력하기',
                  style: textTheme().headline2,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: gap_xxs),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(text: '가게 명'),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(text: '전화번호'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: InputTextFormField(text: '가게 소개란'),
              ),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: InputTextFormField(text: '가게 공지사항'),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: SizedBox(
                    width: 400,
                    child: _buildPeriodTime('영업시간', '시작시간', '종료시간'),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: SizedBox(
                    width: 400,
                    child: _buildPeriodTime('평균배달시간', '최소시간', '최대시간'),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Column _buildPeriodTime(text1, text2, text3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$text1', style: textTheme().headline2),
        SizedBox(height: gap_s),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                validator: (value) => value!.isEmpty ? '${text2}을 입력 해 주세요' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 2),
                  ),
                  hintText: '${text2}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            SizedBox(width: gap_m),
            Text('~', style: textTheme().headline2),
            SizedBox(width: gap_m),
            Expanded(
              child: TextFormField(
                validator: (value) => value!.isEmpty ? '${text3}을 입력 해 주세요' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 2),
                  ),
                  hintText: '${text3}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
