import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDay1 = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    DateTime selectedDay2 = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    DateTime focusedDay = DateTime.now();
    String formatDate1 = DateFormat('yy/MM/dd').format(selectedDay1);
    String formatDate2 = DateFormat('yy/MM/dd').format(selectedDay2);

    return Flexible(
      child: Scaffold(
        body: SizedBox(
          width: getBodyWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(gap_l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '통계',
                        style: TextStyle(color: kMainColor, fontSize: 32, height: 1),
                      ),
                      SizedBox(height: gap_m),
                      _buildDateFilter(formatDate1, formatDate2),
                      SizedBox(height: gap_m),
                      _buildTotalIncome(),
                      SizedBox(height: gap_m),
                      _buildIncomeDetail(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildIncomeDetail() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.doc_text),
                      SizedBox(width: gap_s),
                      Text('배달', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
                    ],
                  ),
                ),
                Divider(thickness: gap_xs, height: gap_xs, color: kBackgroundColor),
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputIncomeFormField('700,000', '10,000,000', 0.05),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: gap_s),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.doc_text),
                      SizedBox(width: gap_s),
                      Text('포장', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
                    ],
                  ),
                ),
                Divider(thickness: gap_xs, height: gap_xs, color: kBackgroundColor),
                Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputIncomeFormField('300,000', '5,000,000', 0.05),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _buildTotalIncome() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Row(
              children: [
                Icon(CupertinoIcons.doc_text),
                SizedBox(width: gap_s),
                Text('지출, 수입', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
              ],
            ),
          ),
          Divider(thickness: gap_xs, height: gap_xs, color: kBackgroundColor),
          Padding(
            padding: const EdgeInsets.all(gap_m),
            child: _buildInputIncomeFormField('1,000,000', '15,000,000', 0.1),
          ),
        ],
      ),
    );
  }

  Column _buildInputIncomeFormField(expense, income, gap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('총 주문 n건', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
        SizedBox(height: gap_m),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('지출', style: textTheme().headline1),
                SizedBox(height: gap_m),
                Text('${expense}원', style: TextStyle(fontSize: 32, color: Colors.black, height: 1)),
              ],
            ),
            SizedBox(width: getBodyWidth(context) * gap),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('주문금액', style: textTheme().headline1),
                SizedBox(height: gap_m),
                Text('${income}원', style: TextStyle(fontSize: 32, color: kMainColor, height: 1)),
              ],
            ),
          ],
        )
      ],
    );
  }

  Container _buildDateFilter(String formatDate1, String formatDate2) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('기간', style: TextStyle(fontSize: 24, color: Colors.black, height: 1)),
            SizedBox(height: gap_s),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildPeriodButton('일간'),
                    SizedBox(width: gap_s),
                    _buildPeriodButton('주간'),
                    SizedBox(width: gap_s),
                    _buildPeriodButton('월간'),
                    SizedBox(width: 80),
                    Row(
                      children: [
                        _buildDateButton(formatDate1),
                        SizedBox(width: gap_m),
                        Text('~'),
                        SizedBox(width: gap_m),
                        _buildDateButton(formatDate2),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kMainColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: gap_xs),
                      child: Text(
                        '조회하기',
                        style: TextStyle(color: kMainColor, fontSize: 24, height: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildDateButton(formatDates) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kUnselectedListColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            children: [
              Text(
                '${formatDates}',
                style: TextStyle(color: kUnselectedListColor, fontSize: 18, height: 1),
              ),
              SizedBox(width: 60),
              Icon(
                CupertinoIcons.arrowtriangle_down_fill,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPeriodButton(text) {
  return InkWell(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: kUnselectedListColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: gap_xs),
        child: Text(
          '${text}',
          style: TextStyle(color: kUnselectedListColor, fontSize: 24, height: 1),
        ),
      ),
    ),
  );
}
