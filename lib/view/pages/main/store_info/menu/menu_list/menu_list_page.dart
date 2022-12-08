import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class MenuListPage extends StatefulWidget {
  final Function(int index) notifyParent;
  const MenuListPage({required this.notifyParent, Key? key}) : super(key: key);

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  List<bool>? _isChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  final ScrollController _scrollController = ScrollController();

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
                children: [
                  _buildMenuListHeader(context),
                  SizedBox(height: gap_l),
                  _buildMenuList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuListHeader(BuildContext context) {
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
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => AlertDialog(
                      titlePadding: EdgeInsets.only(left: 120, right: 120, top: 60),
                      title: SizedBox(
                        width: 300,
                        child: Text(
                          '메뉴를 숨길까요?',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kMainColor, fontSize: 32),
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: SizedBox(
                          height: 32,
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              '메뉴 외 n건',
                              style: TextStyle(fontSize: 24, color: kUnselectedListColor),
                            ),
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
                                onTap: () {
                                  Navigator.pop(context);
                                },
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
                                onTap: () {
                                  Navigator.pop(context);
                                },
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
              onTap: () => callback(3),
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

  Expanded _buildMenuList() {
    return Expanded(
      child: RawScrollbar(
        thumbColor: kUnselectedListColor,
        radius: Radius.circular(5),
        controller: _scrollController,
        thickness: 10,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMenuInfo('후라이드치킨', '18,000', '고소하군', 0),
                _buildMenuInfo('양념치킨', '18,000', '달콤하군', 1),
                _buildMenuInfo('간장치긴', '19,000', '짭짤하군', 2),
                _buildMenuInfo('후라이드치킨', '18,000', '고소하군', 3),
                _buildMenuInfo('양념치킨', '18,000', '달콤하군', 4),
                _buildMenuInfo('간장치긴', '19,000', '짭짤하군', 5),
                _buildMenuInfo('후라이드치킨', '18,000', '고소하군', 6),
                _buildMenuInfo('양념치킨', '18,000', '달콤하군', 7),
                _buildMenuInfo('간장치긴', '19,000', '짭짤하군', 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildMenuInfo(menu, price, detail, index) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Row(
        children: [
          Checkbox(
            splashRadius: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            activeColor: kMainColor,
            checkColor: Colors.white,
            value: _isChecked![index],
            onChanged: (value) {
              setState(() {
                _isChecked![index] = value!;
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

  void callback(int index) {
    widget.notifyParent(index);
  }
}
