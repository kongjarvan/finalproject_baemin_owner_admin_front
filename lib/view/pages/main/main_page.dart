import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/view/pages/components/my_icon_with_text.dart';
import 'package:baemin_owner_admin_front/view/pages/login/login_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/delivery_status.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/store_info_menu.dart';
import 'package:baemin_owner_admin_front/view/pages/main/menu_list/menu_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/statistics/statistics_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _valueList = ['건강상의 사유', '재고소진', '기타'];
  var _selectedValue = '건강상의 사유';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Row(
            children: [
              _buildStatus(),
              Expanded(child: Container(height: 56, color: kMenuBarMainColor)),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                _buildMenuIcon(),
                StatisticsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcon() {
    return Container(
      width: 80,
      color: kMenuBarSubColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: gap_s),
            child: Column(
              children: [
                Column(
                  children: [
                    MyIconWithText(icon: CupertinoIcons.doc_text, settings: MenuListPage(), text: '영업관리', color: kMenuIconColor),
                    Divider(height: gap_xl, thickness: gap_xxs, color: kMenuIconColor, indent: gap_m, endIndent: gap_m),
                    MyIconWithText(icon: CupertinoIcons.doc_text, settings: LoginPage(), text: '통계', color: kMenuIconColor),
                    Divider(height: gap_xl, thickness: gap_xxs, color: kMenuIconColor, indent: gap_m, endIndent: gap_m),
                    MyIconWithText(icon: CupertinoIcons.doc_text, settings: LoginPage(), text: '가게정보', color: kMenuIconColor),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: gap_s),
            child: InkWell(
              child: Column(
                children: [
                  Icon(FontAwesomeIcons.shop, color: kMenuIconColor),
                  Text('영업시작', style: TextStyle(color: kMenuIconColor)),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => AlertDialog(
                      titlePadding: EdgeInsets.only(left: 120, right: 120, top: 60),
                      title: SizedBox(
                        width: 300,
                        child: Text(
                          '영업을 중지할까요?',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kMainColor, fontSize: 32),
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: kUnselectedListColor),
                          ),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(4),
                            underline: Container(
                              height: 0,
                            ),
                            isExpanded: true,
                            value: _selectedValue,
                            items: _valueList.map(
                              (value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: gap_s),
                                    child: Text(value),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(
                                () {
                                  _selectedValue = value as String;
                                  print(_selectedValue);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(gap_s),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: kMainColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: gap_s),
                                    child: Center(
                                      child: Text(
                                        '아니오',
                                        style: TextStyle(
                                          color: kMainColor,
                                          fontSize: 20,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 240,
                                  decoration: BoxDecoration(
                                    color: kMainColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: kMainColor),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: gap_s),
                                    child: Center(
                                      child: Text(
                                        '네',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          height: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatus() {
    return Container(
      width: 312,
      height: 56,
      color: kMenuBarMainColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: gap_xs, horizontal: gap_l),
        child: Row(
          children: [
            Icon(CupertinoIcons.circle_filled, color: Colors.grey, size: 20),
            SizedBox(width: gap_s),
            Padding(
              padding: const EdgeInsets.only(bottom: gap_xxs),
              child: Text('영업중지', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
