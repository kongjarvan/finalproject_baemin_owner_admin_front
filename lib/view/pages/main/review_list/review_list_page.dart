import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/order_info.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/review_type_button.dart';
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(gap_l),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '리뷰관리',
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(height: gap_m),
                  Row(
                    children: [
                      ReviewTypeButton(text: '전체리뷰'),
                      SizedBox(width: gap_s),
                      ReviewTypeButton(text: '신고된 리뷰'),
                    ],
                  ),
                  SizedBox(height: gap_m),
                  _buildReviewFilterForm(),
                  SizedBox(height: gap_m),
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            _buildReview(),
                            _buildReview(),
                            _buildReview(),
                            _buildReview(),
                            _buildReview(),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReview() {
    return Container(
      color: Colors.white,
      width: getBodyWidth(context),
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
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
                _buildReportButton(),
              ],
            ),
            SizedBox(height: gap_m),
            Container(
              width: getBodyWidth(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderInfo(),
                  SizedBox(width: gap_xl),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildUserReview(context),
                        SizedBox(height: gap_m),
                        _buildOwnerComment(context, '사장님 답글'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: gap_m),
            Divider(thickness: 2)
          ],
        ),
      ),
    );
  }

  Widget _buildUserReview(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('구매자 리뷰', style: TextStyle(fontSize: 20)),
        SizedBox(height: gap_s),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: kUnselectedListColor),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  text:
                      '구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용,구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용,구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용, 구매자 리뷰 내용,'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOwnerComment(context, text) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('판매자 답글', style: TextStyle(fontSize: 20)),
            SizedBox(height: gap_s),
            TextFormField(
              maxLines: 7,
              validator: (value) => value!.isEmpty ? "${text}를 입력 해 주세요" : null,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kMainColor, width: 2),
                ),
                hintText: "$text 입력",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: gap_m),
        InkWell(
            child: Container(
              width: getBodyWidth(context) * 0.15,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: kMainColor),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(child: Text('작성하기', style: textTheme().headline3)),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/main');
            }),
      ],
    );
  }

  InkWell _buildReportButton() {
    return InkWell(
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
    );
  }

  Widget _buildReviewFilterForm() {
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
            ),
          ],
        ),
      ),
    );
  }
}
