import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/model/admin_main_model.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/model/admin_main_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/register_owner/admin_register_owner_page.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_detail/reported_review_detail_page.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_list/reported_review_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminMainPage extends ConsumerStatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends ConsumerState<AdminMainPage> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    AdminMainPageModel? model = ref.watch(adminMainPageViewModel);

    final List selectedTitle = [
      '유저관리 > 사업자회원',
      '유저관리 > 사업자회원',
      '유저관리 > 사업자회원',
      '신고 리뷰 관리',
      '신고 리뷰 관리',
    ];

    final List<Widget> selectedMainView = [
      AdminRegisterOwnerPage(),
      AdminRegisterOwnerPage(),
      AdminRegisterOwnerPage(),
      ReportedReviewListPage(),
      ReportedReviewDetailPage(),
    ];

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Row(
        children: [
          Container(
            width: 300,
            color: kBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    _buildMenuBarHeader(),
                    SingleChildScrollView(
                      child: ExpansionPanelList(
                        expandedHeaderPadding: const EdgeInsets.all(0),
                        children: [
                          ExpansionPanel(
                            canTapOnHeader: true,
                            backgroundColor: kUnselectedListColor,
                            headerBuilder: (context, isExpanded) {
                              return _buildUserManageButton();
                            },
                            body: Column(
                              children: [
                                _buildUserManageListButton(model, '전체 회원', 2, 1),
                                _buildUserManageListButton(model, '일반 회원', 1, 1),
                                _buildUserManageListButton(model, '사업자회원', 0, 0),
                              ],
                            ),
                            isExpanded: _isOpen,
                          )
                        ],
                        expansionCallback: (panelIndex, isExpanded) {
                          setState(() {
                            _isOpen = !_isOpen;
                          });
                        },
                      ),
                    ),
                    _buildReportedReviewButton(model, 3),
                  ],
                ),
                _buildLogoutButton(context),
              ],
            ),
          ),
          _buildSelectedIndexPage(model, selectedTitle, selectedMainView),
        ],
      ),
    );
  }

  Center _buildLogoutButton(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.popAndPushNamed(context, '/login');
        },
        child: Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Text('로그아웃', style: textTheme().headline2),
        ),
      ),
    );
  }

  Expanded _buildSelectedIndexPage(AdminMainPageModel? model, List<dynamic> selectedTitle, List<Widget> selectedMainView) {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: kWhiteColor,
            height: 80,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.all(gap_m),
                child: Text(
                  '${selectedTitle[model!.selectedIndex]}',
                  style: TextStyle(fontSize: 24, height: 1),
                ),
              ),
            ),
          ),
          Divider(thickness: 1, height: 1, color: kAdminSemiBlackColor),
          Flexible(
            child: Container(
              child: selectedMainView[model.selectedIndex],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildReportedReviewButton(AdminMainPageModel? model, index1) {
    return Container(
      color: (model!.selectedIndex == index1 || model.selectedIndex == 4) ? kMainColor : kUnselectedListColor,
      child: InkWell(
        onTap: () {
          setState(() {
            model.selectedIndex = index1;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Center(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '신고 리뷰 관리',
                style: TextStyle(
                  fontSize: 18.0,
                  color: (model.selectedIndex == index1 || model.selectedIndex == 4) ? kAdminBlackColor : kWhiteColor,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildMenuBarHeader() {
    return Container(
      color: kAdminGreyColor,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(gap_s),
        child: Center(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '관리자 페이지',
              style: TextStyle(fontSize: 32, color: kWhiteColor, height: 1),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildUserManageButton() {
    return Container(
      color: kUnselectedListColor,
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Center(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              '유저 관리',
              style: TextStyle(fontSize: 18.0, color: kWhiteColor, height: 1.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserManageListButton(AdminMainPageModel? model, text, index1, index2) {
    return Container(
      color: index1 == model!.selectedIndex ? kMainColor : kBackgroundColor,
      child: InkWell(
        onTap: () {
          setState(() {
            model.selectedIndex = index1;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_m),
          child: Center(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '${text}',
                style: TextStyle(fontSize: 18.0, color: kAdminBlackColor, height: 1.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
