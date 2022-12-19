import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/menu_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/update_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/update_menu/model/update_menu_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/update_menu/model/update_menu_page_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class UpdateMenuPage extends ConsumerStatefulWidget {
  const UpdateMenuPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateMenuPage> createState() => _UpdateMenuPageState();
}

final _formKey = GlobalKey<FormState>();

class _UpdateMenuPageState extends ConsumerState<UpdateMenuPage> {
  var _name;
  var _price;
  var _thumbnail;
  var _intro;

  var _categoryList = ['메인 메뉴', '사이드 메뉴', '음료'];
  var _selectedCategory;
  @override
  Widget build(BuildContext context) {
    UpdateMenuPageModel? model = ref.watch(updateMenuPageViewModel);

    _selectedCategory = model!.menuDetailRespDto.category;

    _name = TextEditingController(text: model.menuDetailRespDto.name);
    _price = TextEditingController(text: '${model.menuDetailRespDto.price}');
    _thumbnail = TextEditingController(text: model.menuDetailRespDto.thumbnail);
    _intro = TextEditingController(text: model.menuDetailRespDto.intro);
    return Scaffold(
      body: model == null ? const Center(child: CircularProgressIndicator()) : _buildBody(),
    );
  }

  Column _buildBody() {
    return Column(
      key: _formKey,
      children: [
        const Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
        Padding(
          padding: const EdgeInsets.all(gap_l),
          child: Column(
            children: [
              _buildInsertMenuHeader(),
              const SizedBox(height: gap_xxs),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Image.asset('assets/레드마블치킨.jpg', fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(width: gap_l),
                              Flexible(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InputTextFormField(
                                      text1: '메뉴 이름',
                                      text2: '메뉴 이름 입력',
                                      controller: _name,
                                      maxLine: 1,
                                      isReadOnly: false,
                                    ),
                                    const SizedBox(height: gap_l),
                                    InputTextFormField(
                                      text1: '메뉴 가격',
                                      text2: '메뉴 가격 입력',
                                      controller: _price,
                                      maxLine: 1,
                                      isReadOnly: false,
                                    ),
                                    const SizedBox(height: gap_l),
                                    Text('카테고리', style: textTheme().headline2),
                                    const SizedBox(height: gap_s),
                                    Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kUnselectedListColor,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.white,
                                      ),
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return DropdownButton(
                                              isExpanded: true,
                                              style: textTheme().headline1,
                                              underline: Container(
                                                height: 0,
                                              ),
                                              value: _selectedCategory,
                                              items: _categoryList.map(
                                                (value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: gap_xs),
                                                      child: Text(value),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedCategory = value as String;
                                                });
                                              });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: gap_m),
                          InputTextFormField(
                            text1: '메뉴 설명',
                            text2: '메뉴 설명 입력',
                            controller: _intro,
                            maxLine: 3,
                            isReadOnly: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInsertMenuHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '메뉴 수정하기',
              style: TextStyle(fontSize: 32),
            ),
            Consumer(
              builder: (context, ref, child) {
                UpdateMenuPageModel? model1 = ref.watch(updateMenuPageViewModel);
                StoreInfoPageModel? model2 = ref.watch(storeInfoPageViewModel);
                return InkWell(
                  onTap: () async {
                    MenuController menuCT = ref.read(menuController);

                    UpdateMenuReqDto updateMenuReqDto = UpdateMenuReqDto(
                      category: _selectedCategory,
                      name: _name.text.trim(),
                      price: int.parse(_price.text.trim()),
                      intro: _intro.text.trim(),
                    );
                    await menuCT.updateMenu(updateMenuReqDto, model1!.menuDetailRespDto.menuId);
                    ref.read(storeInfoPageViewModel.notifier).changeIndex(1);
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
                );
              },
            )
          ],
        ),
        const SizedBox(height: gap_m),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_s),
            child: Row(
              children: [
                const Icon(CupertinoIcons.person_alt),
                const SizedBox(width: gap_s),
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
