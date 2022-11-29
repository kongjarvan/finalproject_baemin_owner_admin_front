import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewListPage extends StatefulWidget {
  const ReviewListPage({Key? key}) : super(key: key);

  @override
  State<ReviewListPage> createState() => _ReviewListPageState();
}

class _ReviewListPageState extends State<ReviewListPage> {
  bool? _isChecked = false;
  final _valueList = ['최신순', '별점순', '어떤순'];
  var _selectedValue = '최신순';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
          Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              children: [
                Text(
                  '리뷰관리',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: gap_m),
                Row(
                  children: [
                    _buildReviewTypeButton('전체리뷰'),
                    SizedBox(width: gap_s),
                    _buildReviewTypeButton('신고된 리뷰'),
                  ],
                ),
                SizedBox(height: gap_m),
                _buildReviewFilterForm(),
                SizedBox(height: gap_m),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.star_fill, color: kMainColor, size: 32),
                            Icon(CupertinoIcons.star_fill, color: kMainColor, size: 32),
                            Icon(CupertinoIcons.star_fill, color: kMainColor, size: 32),
                            Icon(CupertinoIcons.star_fill, color: kMainColor, size: 32),
                            Icon(CupertinoIcons.star, color: kMainColor, size: 32),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: kUnselectedListColor, width: 2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_xs),
                              child: Text(
                                '신고하기',
                                style: TextStyle(color: kUnselectedListColor, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: gap_m),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 300,
                              height: 200,
                              color: Colors.green,
                            ),
                            Text('주문번호: ', style: TextStyle(fontSize: 20)),
                            Text('구매일자: ', style: textTheme().bodyText2),
                            Text('숨김여부: ', style: textTheme().bodyText2),
                          ],
                        ),
                        Column(
                          children: [
                            _buildComments(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildComments() {
    return Column(
      children: [
        Text('구매자 리뷰', style: TextStyle(fontSize: 20)),
        SizedBox(height: gap_s),
        RichText(
          text: TextSpan(text: '구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용,'),
        )
      ],
    );
  }

  Container _buildReviewFilterForm() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_s),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  activeColor: kMainColor,
                  checkColor: Colors.white,
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text('미답변 리뷰만 확인하기', style: textTheme().headline1),
              ],
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kUnselectedListColor,
                ),
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: DropdownButton(
                  isExpanded: true,
                  style: textTheme().headline1,
                  underline: Container(
                    height: 0,
                  ),
                  value: _selectedValue,
                  items: _valueList.map(
                    (value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.only(left: gap_xs),
                          child: Text(value),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as String;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReviewTypeButton(text) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Center(
              child: Text(
                '${text}',
                style: TextStyle(fontSize: 20, color: kUnselectedListColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
