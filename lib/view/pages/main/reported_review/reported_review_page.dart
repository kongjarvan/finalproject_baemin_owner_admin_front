import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/OrderInfo.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/review_type_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportedReviewPage extends StatefulWidget {
  const ReportedReviewPage({Key? key}) : super(key: key);

  @override
  State<ReportedReviewPage> createState() => _ReportedReviewPageState();
}

class _ReportedReviewPageState extends State<ReportedReviewPage> {
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
                          _buildReportedReview(),
                          _buildReportedReview(),
                          _buildReportedReview(),
                          _buildReportedReview(),
                          _buildReportedReview(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
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
                Text('답변된 리뷰만 확인하기', style: textTheme().headline1),
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

  Widget _buildReportedReview() {
    return Container(
      color: Colors.white,
      width: getBodyWidth(context),
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(CupertinoIcons.star_fill, color: kMainColor, size: 32),
                Icon(CupertinoIcons.star, color: kMainColor, size: 32),
                Icon(CupertinoIcons.star, color: kMainColor, size: 32),
                Icon(CupertinoIcons.star, color: kMainColor, size: 32),
                Icon(CupertinoIcons.star, color: kMainColor, size: 32),
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
                  _buildSolution(),
                ],
              ),
            ),
            SizedBox(height: gap_m),
            Divider(thickness: 2),
          ],
        ),
      ),
    );
  }

  Expanded _buildSolution() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('처리내용', style: TextStyle(fontSize: 20)),
              SizedBox(height: gap_s),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kUnselectedListColor),
                  borderRadius: BorderRadius.circular(4),
                ),
                height: getBodyHeight(context) * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                    text: TextSpan(text: '별점 1점줬다고 신고를 하는놈이 어딨누'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
