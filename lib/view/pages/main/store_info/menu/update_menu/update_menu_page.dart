import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/menu/component/insert_update_menu_form.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/component/register_update_store_form.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateMenuPage extends StatelessWidget {
  const UpdateMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
          Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              children: [
                _buildInsertMenuHeader(context),
                SizedBox(height: gap_xxs),
                InsertUpdateMenuForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsertMenuHeader(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '메뉴 추가하기',
              style: TextStyle(fontSize: 32),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateMenuPage()));
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
                        builder: (context) => MainPage(),
                      ),
                    );
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
                        '메뉴 수정하기',
                        style: textTheme().headline3,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: gap_m),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_s),
            child: Row(
              children: [
                Icon(CupertinoIcons.person_alt),
                SizedBox(width: gap_s),
                Text(
                  '메뉴 정보',
                  style: textTheme().headline2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
