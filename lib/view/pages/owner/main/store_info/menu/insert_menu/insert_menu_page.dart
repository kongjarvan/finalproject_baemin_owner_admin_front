import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/menu_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/insert_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baemin_owner_admin_front/core/util/validator_util.dart';

class InsertMenuPage extends ConsumerStatefulWidget {
  const InsertMenuPage({Key? key}) : super(key: key);
  @override
  ConsumerState<InsertMenuPage> createState() => _InsertMenuPageState();
}

class _InsertMenuPageState extends ConsumerState<InsertMenuPage> {
  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _price = TextEditingController();
  final _thumbnail = TextEditingController();
  final _intro = TextEditingController();

  var _categoryList = ['메인 메뉴', '사이드 메뉴', '음료'];
  var _selectedCategory = '메인 메뉴';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
          Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              children: [
                Column(
                  children: [
                    _buildInsertMenuHeader(),
                    const SizedBox(height: gap_m),
                    _buildMenuInfoHeader(),
                  ],
                ),
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
                                        funValidator: validateMenuName(),
                                        maxLine: 1,
                                        isReadOnly: false,
                                      ),
                                      const SizedBox(height: gap_l),
                                      InputTextFormField(
                                        text1: '메뉴 가격',
                                        text2: '메뉴 가격 입력',
                                        controller: _price,
                                        funValidator: validateMenuPrice(),
                                        maxLine: 1,
                                        isReadOnly: false,
                                      ),
                                      const SizedBox(height: gap_l),
                                      Text('카테고리', style: textTheme().headline2),
                                      const SizedBox(height: gap_s),
                                      Container(
                                        width: 300,
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
                              funValidator: validateContent(),
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
      ),
    );
  }

  Container _buildMenuInfoHeader() {
    return Container(
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
    );
  }

  Row _buildInsertMenuHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '메뉴 추가하기',
          style: TextStyle(fontSize: 32),
        ),
        Consumer(
          builder: (context, ref, child) {
            StoreInfoPageModel? model2 = ref.watch(storeInfoPageViewModel);
            return Consumer(
              builder: (context, ref, child) {
                return InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      MenuController menuCT = ref.read(menuController);
                      InsertMenuReqDto insertMenuReqDto = InsertMenuReqDto(
                        category: _selectedCategory,
                        name: _name.text.trim(),
                        price: int.parse(_price.text.trim()),
                        intro: _intro.text.trim(),
                      );
                      await menuCT.insertMenu(insertMenuReqDto);
                      ref.read(storeInfoPageViewModel.notifier).changeIndex(1);
                    }
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
            );
          },
        )
      ],
    );
  }
}
