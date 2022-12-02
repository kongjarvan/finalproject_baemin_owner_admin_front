import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/delivery_status.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/store_info_menu.dart';
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
  final List<Widget> selectedMainView = [
    DeliveryStatus(),
    StatisticsPage(),
    StoreInfoMenu(),
  ];

  var _selectedIndex = 0;

  final _valueList = ['건강상의 사유', '재고소진', '기타'];
  var _selectedValue = '건강상의 사유';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kMenuBarMainColor,
        elevation: 0,
        title: Row(
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
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: kMenuBarSubColor,
            labelType: NavigationRailLabelType.all,
            minWidth: 80,
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.doc_text, color: kMenuIconColor),
                label: Text('영업관리', style: TextStyle(color: kMenuIconColor)),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.doc_text, color: kMenuIconColor),
                label: Text('통계', style: TextStyle(color: kMenuIconColor)),
              ),
              NavigationRailDestination(
                icon: Icon(CupertinoIcons.doc_text, color: kMenuIconColor),
                label: Text('가게정보', style: TextStyle(color: kMenuIconColor)),
              ),
            ],
            selectedIndex: _selectedIndex,
            groupAlignment: -1,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            trailing: Expanded(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(FontAwesomeIcons.shop, color: kMenuIconColor),
                    Text('영업시작', style: TextStyle(color: kMenuIconColor)),
                    SizedBox(height: gap_m),
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
          ),
          Container(
            child: selectedMainView[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
