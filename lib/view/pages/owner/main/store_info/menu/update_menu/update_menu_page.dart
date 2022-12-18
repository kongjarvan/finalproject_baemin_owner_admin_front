import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/menu_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/update_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/update_menu/model/update_menu_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/update_menu/model/update_menu_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateMenuPage extends ConsumerStatefulWidget {
  const UpdateMenuPage({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateMenuPage> createState() => _UpdateMenuPageState();
}

final _formKey = GlobalKey<FormState>();

class _UpdateMenuPageState extends ConsumerState<UpdateMenuPage> {
  @override
  Widget build(BuildContext context) {
    UpdateMenuPageModel? model = ref.watch(updateMenuPageViewModel);
    var _categoryList = ['메인 메뉴', '사이드', '음료'];
    var _selectedCategory = model!.menuDetailRespDto.category;

    var _name = TextEditingController(text: model.menuDetailRespDto.name);
    var _price = TextEditingController(text: '${model.menuDetailRespDto.price}');
    var _thumbnail = TextEditingController(text: model.menuDetailRespDto.thumbnail);
    var _intro = TextEditingController(text: model.menuDetailRespDto.intro);
    return Scaffold(
      body: model == null
          ? const Center(child: CircularProgressIndicator())
          : _buildBody(
              _selectedCategory,
              _name,
              _price,
              _thumbnail,
              _intro,
              _categoryList,
            ),
    );
  }

  Column _buildBody(
    String _selectedCategory,
    TextEditingController _name,
    TextEditingController _price,
    TextEditingController _thumbnail,
    TextEditingController _intro,
    List<String> _categoryList,
  ) {
    return Column(
      children: [
        const Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
        Padding(
          padding: const EdgeInsets.all(gap_l),
          child: Column(
            children: [
              _buildInsertMenuHeader(_selectedCategory, _name.text.trim(), _price.text.trim(), _thumbnail.text.trim(), _intro.text.trim()),
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
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(CupertinoIcons.add),
                                        Text(
                                          '사진 추가하기',
                                          style: textTheme().bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
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
                                      child: DropdownButton(
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
                                          }),
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

  Widget _buildInsertMenuHeader(String selectedCategory, String name, String price, String thumbnail, String intro) {
    return Column(
      key: _formKey,
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
                UpdateMenuPageModel? model = ref.watch(updateMenuPageViewModel);
                return InkWell(
                  onTap: () async {
                    MenuController menuCT = ref.read(menuController);
                    UpdateMenuReqDto updateMenuReqDto = UpdateMenuReqDto(
                      category: selectedCategory,
                      name: name,
                      price: price,
                      intro: intro,
                    );
                    await menuCT.updateMenu(updateMenuReqDto, 1);
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
