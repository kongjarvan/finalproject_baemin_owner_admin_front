import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class AdminRegisterOwnerPage extends StatefulWidget {
  const AdminRegisterOwnerPage({Key? key}) : super(key: key);

  @override
  State<AdminRegisterOwnerPage> createState() => _AdminRegisterOwnerPageState();
}

class _AdminRegisterOwnerPageState extends State<AdminRegisterOwnerPage> {

  final _valueList = ['처리유무', '아이디순', '대표자성함순'];
  var _selectedValue = '처리유무';
  var _isChecked = false;

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
            Flexible(
              child: Container(
                color: kWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(gap_xl),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Center(
                                child: Checkbox(
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
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text('유저 아이디', style: textTheme().headline1),
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text('사업자 번호', style: textTheme().headline1),
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text('대표자 명함', style: textTheme().headline1),
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text('처리 유무', style: textTheme().headline1),
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
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                              _buildApplierList('cs123', '1234-56-789', '김철수', '승인완료'),
                              _buildApplierList('jinsa', '1784-56-486', '이성진', '승인거절'),
                              _buildApplierList('sylar', '6732-45-273', '김민철', '승인거절'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildApplierList(ownerId, storeRegisterNumber, ownerName, result) {
    return TableRow(
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      children: <Widget>[
        Center(
          child: Checkbox(
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
