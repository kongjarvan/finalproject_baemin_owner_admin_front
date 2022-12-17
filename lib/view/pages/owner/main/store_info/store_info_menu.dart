import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/insert_menu/insert_menu_page.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/menu_list/menu_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/reported_review/reported_review_page.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/review_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/store/update_store/update_store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class StoreInfoMenu extends ConsumerStatefulWidget {
  const StoreInfoMenu({Key? key}) : super(key: key);

  @override
  ConsumerState<StoreInfoMenu> createState() => _StoreInfoMenuState();
}

bool _isOpen = false;

class _StoreInfoMenuState extends ConsumerState<StoreInfoMenu> {
  @override
  Widget build(BuildContext context) {
    StoreInfoPageModel? model = ref.watch(storeInfoPageViewModel);
    final List<Widget> selectedMainView = [
      UpdateStorePage(),
      MenuListPage(),
      InsertMenuPage(),
      ReviewListPage(),
      ReportedReviewPage(),
    ];

    return model == null ? Flexible(child: Center(child: CircularProgressIndicator())) : _buildBody(model, selectedMainView);
  }

  Flexible _buildBody(StoreInfoPageModel model, List<Widget> selectedMainView) {
    return Flexible(
      child: Row(
        children: [
          Container(
            color: kMenuBarMainColor,
            width: 232,
            child: Column(
              children: [
                _buildUpdateStoreMenu(model),
                _buildStoreManageMenu(model),
              ],
            ),
          ),
          Flexible(
            child: selectedMainView[model.selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateStoreMenu(StoreInfoPageModel model) {
    return Container(
      color: (model.selectedIndex == 0) ? kMainColor : null,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                ref.read(storeInfoPageViewModel.notifier).changeIndex(0);
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

  Widget _buildStoreManageMenu(StoreInfoPageModel model) {
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
                  _buildInfoMenu1(model, '메뉴관리', 1),
                  _buildInfoMenu2(model, '리뷰관리', 3),
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

  Widget _buildInfoMenu1(StoreInfoPageModel model, text, index) {
    return Container(
      color: (model.selectedIndex == index) ? kMainColor : kMenuBarMainColor,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: InkWell(
          onTap: () {
            ref.read(storeInfoPageViewModel.notifier).changeIndex(index);
          },
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_m),
              child: Text(
                '${text}',
                style: TextStyle(
                  color: (model.selectedIndex == index) ? kWhiteColor : kMenuIconColor,
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

  Widget _buildInfoMenu2(StoreInfoPageModel model, text, index) {
    return Container(
      color: (model.selectedIndex == index || model.selectedIndex == 4) ? kMainColor : kMenuBarMainColor,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: InkWell(
          onTap: () {
            ref.read(storeInfoPageViewModel.notifier).changeIndex(index);
          },
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_m),
              child: Text(
                '${text}',
                style: TextStyle(
                  color: (model.selectedIndex == index || model.selectedIndex == 4) ? kWhiteColor : kMenuIconColor,
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

  Widget _buildInfoMenu(StoreInfoPageModel model, text, index) {
    return Container(
      color: (model.selectedIndex == index) ? kMainColor : kMenuBarMainColor,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: InkWell(
          onTap: () {
            ref.read(storeInfoPageViewModel.notifier).changeIndex(index);
          },
          child: SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: gap_m),
              child: Text('${text}',
                  style: TextStyle(
                    color: (model.selectedIndex == index) ? kWhiteColor : kMenuIconColor,
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
