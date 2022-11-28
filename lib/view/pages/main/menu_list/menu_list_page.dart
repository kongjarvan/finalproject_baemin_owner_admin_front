import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/insert_menu/insert_menu_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:flutter/material.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  bool? _isChecked = false;
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
                children: [_buildMenuListHeader(context), SizedBox(height: gap_l), _buildMenuList()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildMenuList() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildMenuInfo('후라이드치킨', '18,000', '고소하군'),
              _buildMenuInfo('양념치킨', '18,000', '달콤하군'),
              _buildMenuInfo('간장치긴', '19,000', '짭짤하군'),
              _buildMenuInfo('후라이드치킨', '18,000', '고소하군'),
              _buildMenuInfo('양념치킨', '18,000', '달콤하군'),
              _buildMenuInfo('간장치긴', '19,000', '짭짤하군'),
              _buildMenuInfo('후라이드치킨', '18,000', '고소하군'),
              _buildMenuInfo('양념치킨', '18,000', '달콤하군'),
              _buildMenuInfo('간장치긴', '19,000', '짭짤하군'),
              _buildMenuInfo('후라이드치킨', '18,000', '고소하군'),
              _buildMenuInfo('양념치킨', '18,000', '달콤하군'),
              _buildMenuInfo('간장치긴', '19,000', '짭짤하군'),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildMenuInfo(menu, price, detail) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Row(
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: kMainColor,
            checkColor: Colors.white,
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value;
              });
            },
          ),
          SizedBox(width: gap_m),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: kButtonSubColor,
            ),
          ),
          SizedBox(width: gap_m),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: gap_xs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${menu}', style: textTheme().headline1),
                SizedBox(height: gap_xs),
                Text('${price} 원', style: textTheme().bodyText1),
                SizedBox(height: gap_s),
                Text('${detail}', style: textTheme().bodyText2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Row _buildMenuListHeader(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '메뉴관리',
        style: TextStyle(fontSize: 32),
      ),
      Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kButtonSubColor),
                borderRadius: BorderRadius.circular(gap_xxs),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: gap_s,
                  horizontal: gap_xl,
                ),
                child: Text(
                  '메뉴 숨기기',
                  style: TextStyle(
                    color: kButtonSubColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: gap_m),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InsertMenuPage(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kMainColor),
                borderRadius: BorderRadius.circular(gap_xxs),
                color: kMainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: gap_s,
                  horizontal: gap_xl,
                ),
                child: Text(
                  '메뉴 추가하기',
                  style: textTheme().headline3,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
