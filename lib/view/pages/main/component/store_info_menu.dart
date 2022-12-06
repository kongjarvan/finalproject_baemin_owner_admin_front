import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/menu_list/menu_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/register_store/register_store_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/review_list/review_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/update_store/update_store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StoreInfoMenu extends StatefulWidget {
  const StoreInfoMenu({Key? key}) : super(key: key);

  @override
  State<StoreInfoMenu> createState() => _StoreInfoMenuState();
}

final List<Widget> selectedMainView = [
  RegisterStorePage(),
  UpdateStorePage(),
  MenuListPage(),
  ReviewListPage(),
];

var _selectedIndex = 0;

bool _isOpen = false;

class _StoreInfoMenuState extends State<StoreInfoMenu> {
  @override
  Widget build(BuildContext context) {
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
                  child: Text(textAlign: TextAlign.start, '가게등록', style: textTheme().headline3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateStoreMenu() {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
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
                  _buildInfoMenu('메뉴관리', 2),
                  _buildInfoMenu('리뷰관리', 3),
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
