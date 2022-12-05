import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class ReportedReviewListPage extends StatefulWidget {
  const ReportedReviewListPage({Key? key}) : super(key: key);

  @override
  State<ReportedReviewListPage> createState() => _ReportedReviewListPageState();
}

class _ReportedReviewListPageState extends State<ReportedReviewListPage> {
  final _valueList1 = ['신고자유형순', '유저아이디순'];
  var _selectedValue1 = '신고자유형순';

  final _valueList2 = ['신고사유순', '처리유무'];
  var _selectedValue2 = '신고사유순';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(gap_l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(gap_m),
                child: Text('총 99명이 가입신청을 했어요', style: textTheme().headline1),
              ),
            ),
            SizedBox(height: gap_l),
            _buildReportedReviewList(),
          ],
        ),
      ),
    );
  }

  Flexible _buildReportedReviewList() {
    return Flexible(
      child: Container(
        color: kWhiteColor,
        child: Padding(
          padding: const EdgeInsets.all(gap_xl),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
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
                            value: _selectedValue1,
                            items: _valueList1.map(
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
                                _selectedValue1 = value as String;
                              });
                            }),
                      ),
                      SizedBox(width: gap_s),
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
                            value: _selectedValue2,
                            items: _valueList2.map(
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
                                _selectedValue2 = value as String;
                              });
                            }),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      _buildRefuseButton(),
                      SizedBox(width: gap_s),
                      _buildRegisterButton(),
                    ],
                  ),
                ],
              ),
              SizedBox(height: gap_l),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                },
                children: <TableRow>[
                  TableRow(
                    decoration: const BoxDecoration(
                      color: kBackgroundColor,
                    ),
                    children: <Widget>[
                      Container(
                        height: 32,
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text('번호', style: textTheme().headline1),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('신고자 유형', style: textTheme().headline1),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('유저 아이디', style: textTheme().headline1),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('신고사유', style: textTheme().headline1),
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Text('처리유무', style: textTheme().headline1),
                      ),
                    ],
                  ),
                ],
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
                      4: FlexColumnWidth(),
                    },
                    children: <TableRow>[
                      _buildReportedReview('1', '사업자', 'cs123', '욕설', '처리완료'),
                      _buildReportedReview('2', '일반', 'jinsa', '욕설', '숨기기'),
                      _buildReportedReview('3', '일반', 'sylar', '욕설', '숨기기'),
                      _buildReportedReview('1', '사업자', 'cs123', '욕설', '처리완료'),
                      _buildReportedReview('2', '일반', 'jinsa', '욕설', '숨기기'),
                      _buildReportedReview('3', '일반', 'sylar', '욕설', '숨기기'),
                      _buildReportedReview('1', '사업자', 'cs123', '욕설', '처리완료'),
                      _buildReportedReview('2', '일반', 'jinsa', '욕설', '숨기기'),
                      _buildReportedReview('3', '일반', 'sylar', '욕설', '숨기기'),
                      _buildReportedReview('1', '사업자', 'cs123', '욕설', '처리완료'),
                      _buildReportedReview('2', '일반', 'jinsa', '욕설', '숨기기'),
                      _buildReportedReview('3', '일반', 'sylar', '욕설', '숨기기'),
                      _buildReportedReview('1', '사업자', 'cs123', '욕설', '처리완료'),
                      _buildReportedReview('2', '일반', 'jinsa', '욕설', '숨기기'),
                      _buildReportedReview('3', '일반', 'sylar', '욕설', '숨기기'),
                      _buildReportedReview('1', '사업자', 'cs123', '욕설', '처리완료'),
                      _buildReportedReview('2', '일반', 'jinsa', '욕설', '숨기기'),
                      _buildReportedReview('3', '일반', 'sylar', '욕설', '숨기기'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildReportedReview(reportNumber, ownerId, storeRegisterNumber, ownerName, result) {
    return TableRow(
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      children: <Widget>[
        Container(
          height: 32,
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text('${reportNumber}', style: textTheme().headline1),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: Text('${ownerId}', style: textTheme().headline1),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: Text('${storeRegisterNumber}', style: textTheme().headline1),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: Text('${ownerName}', style: textTheme().headline1),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: Text('${result}', style: textTheme().headline1),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kMainColor),
          borderRadius: BorderRadius.circular(4),
          color: kMainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_s),
          child: Text(
            '가입승인',
            style: TextStyle(fontSize: 18, color: kWhiteColor, height: 1),
          ),
        ),
      ),
    );
  }

  Widget _buildRefuseButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kButtonSubColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_s),
          child: Text(
            '가입거절',
            style: TextStyle(fontSize: 18, color: kButtonSubColor, height: 1),
          ),
        ),
      ),
    );
  }
}
