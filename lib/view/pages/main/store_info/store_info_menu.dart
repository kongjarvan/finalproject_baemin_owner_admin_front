import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/menu/insert_menu/insert_menu_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/menu/menu_list/menu_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/review/reported_review/reported_review_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/review/review_list/review_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/register_store/register_store_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/update_store/update_store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StoreInfoMenu extends StatefulWidget {
  const StoreInfoMenu({Key? key}) : super(key: key);

  @override
  State<StoreInfoMenu> createState() => _StoreInfoMenuState();
}

var _selectedIndex = 0;

bool _isOpen = false;

class _StoreInfoMenuState extends State<StoreInfoMenu> {
  void _callbackIndexPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> selectedMainView = [
      UpdateStorePage(),
      MenuListPage(notifyParent: (int) => _callbackIndexPage(int)),
      InsertMenuPage(notifyParent: (int) => _callbackIndexPage(int)),
      ReviewListPage(notifyParent: (int) => _callbackIndexPage(int)),
      ReportedReviewPage(notifyParent: (int) => _callbackIndexPage(int)),
    ];

    return Flexible(
      child: Row(
        children: [
          Container(
            color: kMenuBarMainColor,
            width: 232,
            child: Column(
              children: [
                _buildRegisterStoreMenu(),
                _buildStoreManageMenu(),
              ],
            ),
          ),
          Flexible(
            child: selectedMainView[_selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterStoreMenu() {
    return Container(
      color: (_selectedIndex == 0) ? kMainColor : null,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gap_s),
                  child: Text(textAlign: TextAlign.start, '가게수정', style: textTheme().headline3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreManageMenu() {
    return SingleChildScrollView(
      primary: false,
      child: ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: const EdgeInsets.all(0),
          children: [
            ExpansionPanel(
              backgroundColor: (_isOpen == true) ? kAdminBlackColor : kMenuBarMainColor,
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(gap_s),
                  child: SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: gap_s),
                      child: Text(textAlign: TextAlign.start, '가게관리', style: textTheme().headline3),
                    ),
                  ),
                );
              },
              body: Column(
                children: [
                  _buildInfoMenu1('메뉴관리', 1),
                  _buildInfoMenu2('리뷰관리', 3),
                ],
              ),
              isExpanded: _isOpen,
            ),
          ],
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              _isOpen = !_isOpen;
            });
          }),
    );
  }

  Widget _buildInfoMenu1(text, index) {
    return Container(
      color: (_selectedIndex == index) ? kMainColor : kMenuBarMainColor,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_m),
              child: Text(
                '${text}',
                style: TextStyle(
                  color: (_selectedIndex == index) ? kWhiteColor : kMenuIconColor,
                  fontSize: 16,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoMenu2(text, index) {
    return Container(
      color: (_selectedIndex == index || _selectedIndex == 5) ? kMainColor : kMenuBarMainColor,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_m),
              child: Text(
                '${text}',
                style: TextStyle(
                  color: (_selectedIndex == index || _selectedIndex == 5) ? kWhiteColor : kMenuIconColor,
                  fontSize: 16,
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoMenu(text, index) {
    return Container(
      color: (_selectedIndex == index) ? kMainColor : kMenuBarMainColor,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_m),
              child: Text('${text}',
                  style: TextStyle(
                    color: (_selectedIndex == index) ? kWhiteColor : kMenuIconColor,
                    fontSize: 16,
                    height: 1,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
