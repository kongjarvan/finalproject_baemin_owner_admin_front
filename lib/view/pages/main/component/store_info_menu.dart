import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/menu_list/menu_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/register_store/register_store_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/review_list/review_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class StoreInfoMenu extends StatefulWidget {
  const StoreInfoMenu({Key? key}) : super(key: key);

  @override
  State<StoreInfoMenu> createState() => _StoreInfoMenuState();
}

class _StoreInfoMenuState extends State<StoreInfoMenu> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Container(
            color: kMenuBarMainColor,
            child: Column(
              children: [
                Container(color: kMainColor, child: _buildInfoMenu1('가게등록')),
                _buildInfoMenu1('가게정보'),
                _buildInfoMenu2('메뉴관리'),
                _buildInfoMenu2('리뷰관리'),
              ],
            ),
          ),
          Flexible(
            child: MenuListPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoMenu1(text) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: InkWell(
              onTap: () {},
              child: Text(textAlign: TextAlign.end, '${text}', style: textTheme().headline3),
            ),
          ),
          SizedBox(
            width: 120,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(gap_xs),
                  child: Icon(
                    CupertinoIcons.chevron_down,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoMenu2(text) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewListPage(),
                    ));
              },
              child: Text(
                textAlign: TextAlign.end,
                '${text}',
                style: TextStyle(
                  color: kMenuIconColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 120),
        ],
      ),
    );
  }
}
