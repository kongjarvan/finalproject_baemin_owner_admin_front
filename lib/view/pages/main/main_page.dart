import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/view/pages/components/my_icon_with_text.dart';
import 'package:baemin_owner_admin_front/view/pages/login/login_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/store_info_menu.dart';
import 'package:baemin_owner_admin_front/view/pages/main/menu_list/menu_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                StoreInfoMenu(),
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
            child: MyIconWithText(icon: CupertinoIcons.doc_text, settings: LoginPage(), text: '영업시작', color: kMenuIconColor),
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
