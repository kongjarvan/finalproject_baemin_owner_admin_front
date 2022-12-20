import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/menu_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/hide_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/menu_list/model/menu_list_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/menu_list/model/menu_list_page_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/update_menu/model/update_menu_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/update_menu/model/update_menu_page_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuListPage extends ConsumerStatefulWidget {
  const MenuListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuListPage> createState() => _MenuListPageState();
}

List<String> imageList = ['레드마블치킨.jpg', '청양마요치킨.jpg', '치즈스틱.jpg', '콜라.jpg'];

class _MenuListPageState extends ConsumerState<MenuListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    MenuListPageModel? model = ref.watch(menuListPageViewModel);
    return model == null ? const Center(child: CircularProgressIndicator()) : Scaffold(body: _buildBody(context));
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        const Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              children: [
                _buildMenuListHeader(context),
                const SizedBox(height: gap_l),
                _buildMenuList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuListHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '메뉴관리',
          style: TextStyle(fontSize: 32),
        ),
        Row(
          children: [
            const SizedBox(width: gap_m),
            Consumer(
              builder: (context, ref, child) {
                return InkWell(
                  onTap: () {
                    ref.read(storeInfoPageViewModel.notifier).changeIndex(2);
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
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Expanded _buildMenuList() {
    MenuListPageModel? model = ref.watch(menuListPageViewModel);
    return Expanded(
      child: RawScrollbar(
        thumbColor: kUnselectedListColor,
        radius: const Radius.circular(5),
        controller: _scrollController,
        thickness: 10,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(model!.menuListRespDtos.length, (index) {
                return _buildMenuInfo(
                  imageList[index],
                  model.menuListRespDtos[index].name,
                  model.menuListRespDtos[index].price,
                  model.menuListRespDtos[index].intro,
                  index,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildMenuInfo(image, menu, price, intro, index) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: gap_m),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kButtonSubColor,
                    ),
                    child: Image.asset('assets/$image', fit: BoxFit.cover),
                  ),
                  const SizedBox(width: gap_m),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: gap_xs),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$menu', style: textTheme().headline1),
                        const SizedBox(height: gap_xs),
                        Text('$price 원', style: textTheme().bodyText1),
                        const SizedBox(height: gap_s),
                        Text('$intro', style: textTheme().bodyText2),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  updateMenu(index),
                  const SizedBox(height: gap_m),
                  hideMenu(index),
                ],
              )
            ],
          ),
          const SizedBox(height: gap_xs),
          const Divider(height: 1, thickness: 1)
        ],
      ),
    );
  }

  Widget updateMenu(int index) {
    MenuListPageModel? model1 = ref.watch(menuListPageViewModel);
    UpdateMenuPageModel? model2 = ref.watch(updateMenuPageViewModel);
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () async {
            await ref.read(updateMenuPageViewModel.notifier).notifyViewModel(model1!.menuListRespDtos[index].id);
            ref.read(storeInfoPageViewModel.notifier).changeIndex(5);
          },
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: kMainColor),
              borderRadius: BorderRadius.circular(gap_xxs),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: gap_xs,
              ),
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  '메뉴 수정하기',
                  style: TextStyle(color: kMainColor, fontSize: 16, height: 1),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget hideMenu(int index) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              titlePadding: const EdgeInsets.only(left: 120, right: 120, top: 60),
              title: const SizedBox(
                width: 300,
                child: Text(
                  '메뉴를 숨길까요?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 32),
                ),
              ),
              content: const Padding(
                padding: EdgeInsets.only(bottom: 40),
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
                          MenuListPageModel? model = ref.watch(menuListPageViewModel);
                          MenuController menuCT = ref.read(menuController);

                          return InkWell(
                            onTap: () async {
                              HideMenuReqDto hideMenuReqDto = HideMenuReqDto(closure: true);

                              await menuCT.hideMenu(hideMenuReqDto, model!.menuListRespDtos[index].id);
                              Navigator.pop(context);
                              ref.read(menuListPageViewModel.notifier).notifyViewModel();
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
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(color: kButtonSubColor),
          borderRadius: BorderRadius.circular(gap_xxs),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: gap_xs,
          ),
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              '메뉴 숨기기',
              style: TextStyle(color: kButtonSubColor, fontSize: 16, height: 1),
            ),
          ),
        ),
      ),
    );
  }
}
