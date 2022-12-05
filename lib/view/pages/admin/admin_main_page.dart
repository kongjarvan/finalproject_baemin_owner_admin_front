import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/delivery_status.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/store_info_menu.dart';
import 'package:baemin_owner_admin_front/view/pages/main/statistics/statistics_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  final List<Widget> selectedMainView = [
    DeliveryStatus(),
    StatisticsPage(),
    StoreInfoMenu(),
  ];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          Container(
            width: 300,
            color: kAdminGreyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: kAdminBlackColor,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(gap_s),
                    child: Center(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          '관리자 페이지',
                          style: TextStyle(fontSize: 32, color: kWhiteColor, height: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: kAdminSemiBlackColor,
                  child: Padding(
                    padding: const EdgeInsets.all(gap_m),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                '유저 관리',
                                style: TextStyle(fontSize: 18.0, color: kWhiteColor, height: 1.0),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(CupertinoIcons.chevron_forward, color: kWhiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                _buildUnselectedMenuButton('전체 회원', 0),
                _buildUnselectedMenuButton('일반 회원', 1),
                _buildSelectedMenuButton('사업자회원', 2),
                Container(
                  color: kAdminSemiBlackColor,
                  child: Padding(
                    padding: const EdgeInsets.all(gap_m),
                    child: Center(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            '신고 리뷰 관리',
                            style: TextStyle(fontSize: 18.0, color: kWhiteColor, height: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(color: kWhiteColor, height: 80),
                Divider(thickness: 1, height: 1, color: kAdminSemiBlackColor),
                Container(
                  child: selectedMainView[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnselectedMenuButton(text, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_m),
      child: Center(
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Text(
              '${text}',
              style: TextStyle(fontSize: 18.0, color: kWhiteColor, height: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedMenuButton(text, index) {
    return Container(
      color: kMainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_m),
        child: Center(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Text(
                '${text}',
                style: TextStyle(fontSize: 18.0, color: kAdminBlackColor, height: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
