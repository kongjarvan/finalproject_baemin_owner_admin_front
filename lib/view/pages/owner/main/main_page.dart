import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/store_open_close_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/model/main_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/model/main_page_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/statistics/statistics_page.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/store_info_menu.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_management/order_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  var _selectedIndex = 0;

  final _valueList = ['건강상의 사유', '재고소진', '영업시간 아님', '기타'];
  var _selectedValue = '건강상의 사유';

  @override
  Widget build(BuildContext context) {
    MainPageModel? model = ref.watch(mainPageViewModel);
    MainPageViewModel viewModel = ref.read(mainPageViewModel.notifier);
    final List<Widget> selectedMainView = [
      const OrderListPage(),
      const StatisticsPage(),
      const StoreInfoMenu(),
    ];

    return Scaffold(
      key: scaffoldKey,
      appBar: _buildAppBar(model!),
      body: Row(
        children: [
          _buildMainMenuBar(model),
          model.isOpened == true
              ? selectedMainView[_selectedIndex]
              : const Expanded(
                  child: Center(
                    child: Text(
                      '현재 영업중이 아닙니다. 좌측 하단의 영업시작 버튼을 눌러주세요.',
                      style: TextStyle(color: kMainColor, fontSize: 22),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  NavigationRail _buildMainMenuBar(MainPageModel model) {
    return NavigationRail(
        backgroundColor: kMenuBarSubColor,
        labelType: NavigationRailLabelType.all,
        minWidth: 80,
        destinations: <NavigationRailDestination>[
          _buildMainMenuIcon('영업관리', CupertinoIcons.doc_text),
          _buildMainMenuIcon('통계', CupertinoIcons.chart_bar_square),
          _buildMainMenuIcon('가게정보', CupertinoIcons.building_2_fill),
        ],
        selectedIndex: _selectedIndex,
        groupAlignment: -1,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        trailing: (model.isOpened == true) ? _buildStoreClose(context) : _buildStoreOpen(context));
  }

  AppBar _buildAppBar(MainPageModel model) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kMenuBarMainColor,
      elevation: 2,
      shadowColor: kAdminBlackColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gap_s),
        child: Row(
          children: [
            Icon(CupertinoIcons.circle_filled, color: (model.isOpened == true) ? kMainColor : kUnselectedListColor, size: 20),
            const SizedBox(width: gap_s),
            Padding(
              padding: const EdgeInsets.only(bottom: gap_xxs),
              child: Text((model.isOpened == true) ? '영업중' : '영업중지', style: const TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  NavigationRailDestination _buildMainMenuIcon(text, icon) {
    return NavigationRailDestination(
      icon: Icon(icon, color: kMenuIconColor, size: 32),
      label: Text('$text', style: const TextStyle(color: kMenuIconColor)),
    );
  }

  Widget _buildStoreClose(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
              child: Column(
                children: const [
                  Icon(FontAwesomeIcons.shop, color: kMenuIconColor),
                  Text('영업중지', style: TextStyle(color: kMenuIconColor)),
                  SizedBox(height: gap_m),
                ],
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) => AlertDialog(
                      titlePadding: const EdgeInsets.only(left: 120, right: 120, top: 60),
                      title: const SizedBox(
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
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  width: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: kMainColor),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: gap_s),
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
                              Consumer(
                                builder: (context, ref, child) {
                                  MainPageModel? model = ref.watch(mainPageViewModel);
                                  OwnerController ownerCT = ref.read(ownerController);
                                  return InkWell(
                                    onTap: () {
                                      StoreOpenCloseReqDto storeOpenCloseReqDto = StoreOpenCloseReqDto(isOpend: false);
                                      ownerCT.openCloseStore(storeOpenCloseReqDto);
                                      ref.read(mainPageViewModel.notifier).closeStore();
                                    },
                                    child: Container(
                                      width: 240,
                                      decoration: BoxDecoration(
                                        color: kMainColor,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(color: kMainColor),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: gap_s),
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
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget _buildStoreOpen(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
              child: Column(
                children: const [
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
                      titlePadding: const EdgeInsets.only(left: 120, right: 120, top: 60),
                      title: const SizedBox(
                        width: 300,
                        child: Text(
                          '영업을 시작할까요?',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kMainColor, fontSize: 32),
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
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  width: 240,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: kMainColor),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: gap_s),
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
                              Consumer(
                                builder: (context, ref, child) {
                                  MainPageModel? model = ref.watch(mainPageViewModel);
                                  OwnerController ownerCT = ref.read(ownerController);
                                  return InkWell(
                                    onTap: () {
                                      StoreOpenCloseReqDto storeOpenCloseReqDto = StoreOpenCloseReqDto(isOpend: true);
                                      ownerCT.openCloseStore(storeOpenCloseReqDto);
                                      ref.read(mainPageViewModel.notifier).openStore();
                                    },
                                    child: Container(
                                      width: 240,
                                      decoration: BoxDecoration(
                                        color: kMainColor,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(color: kMainColor),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: gap_s),
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
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
