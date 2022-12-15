import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/core/util/time_list.dart';
import 'package:baemin_owner_admin_front/dto/req/register_store_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/register_store/model/insert_store_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/register_store/model/insert_store_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class UpdateStorePage extends ConsumerStatefulWidget {
  const UpdateStorePage({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateStorePage> createState() => _RegisterStorePageState();
}

final ScrollController _scrollController = ScrollController();

class _RegisterStorePageState extends ConsumerState<UpdateStorePage> {
  final _formKey = GlobalKey<FormState>();

  final _ceoName = TextEditingController();
  final _businessNumber = TextEditingController();
  final _businessAddress = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _intro = TextEditingController();
  final _notice = TextEditingController();
  final _minAmount = TextEditingController();
  final _deliveryCost = TextEditingController();

  final _OpenTimeList = timeList();
  final _CloseTimeList = timeList();

  final _deliveryTimeList = ['20분', '30분', '40분', '50분', '60분', '70분', '80분'];
  var _selectedDeliveryTime = '60분';

  final _categoryList = ['치킨', '피자', '보쌈', '분식', '일식', '한식', '양식'];
  var _selectedCategory = '치킨';

  var _selectedOpenTime = '09시';
  var _selectedCloseTime = '22시';

  @override
  Widget build(BuildContext context) {
    InsertStorePageModel? model = ref.watch(insertStorePageViewModel);
    return model == null ? Flexible(child: Center(child: CircularProgressIndicator())) : _buildBody();
  }

  Widget _buildBody() {
    return Flexible(
      child: Column(
        key: _formKey,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
          Expanded(
            child: RawScrollbar(
              thumbColor: kUnselectedListColor,
              radius: Radius.circular(5),
              controller: _scrollController,
              thickness: 10,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(gap_l),
                  child: Column(
                    children: [RegisterStoreForm('가게등록')],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget RegisterStoreForm(title) {
    return Column(
      children: [
        _buildTitle(title),
        SizedBox(height: gap_m),
        _buildOwnerInfo(),
        SizedBox(height: gap_xl),
        _buildStoreInfo(),
        SizedBox(height: gap_xl),
        _buildConfirmButton(title),
      ],
    );
  }

  Consumer _buildConfirmButton(title) {
    return Consumer(
      builder: (context, ref, child) {
        OwnerController ownerCT = ref.read(ownerController);
        return InkWell(
          onTap: () {
            RegisterStoreReqDto registerStoreReqDto = RegisterStoreReqDto(
              category: _selectedCategory,
              name: _name.text.trim(),
              phone: _phone.text.trim(),
              openTime: _selectedOpenTime,
              closeTime: _selectedCloseTime,
              minAmount: _minAmount.text.trim(),
              deliveryHour: _selectedDeliveryTime,
              deliveryCost: _deliveryCost.text.trim(),
              intro: _intro.text.trim(),
            );
            ownerCT.registerStore(registerStoreReqDto);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(gap_xxs),
              color: kMainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: gap_s),
              child: Text('$title하기', style: textTheme().headline3),
            ),
          ),
        );
      },
    );
  }

  Align _buildTitle(text) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        '${text}',
        style: TextStyle(fontSize: 32),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildOwnerInfo() {
    Logger().d("model 담기 전");
    InsertStorePageModel? model = ref.watch(insertStorePageViewModel);
    Logger().d("model : ${model}");
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Row(
              children: [
                Icon(CupertinoIcons.person_alt),
                SizedBox(width: gap_xs),
                Text(
                  '사업자 정보  (수정불가)',
                  style: textTheme().headline2,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: gap_xxs),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(
                        text1: '사업자 이름',
                        text2: '${model!.insertStoreRespDto.ceoName}',
                        controller: _ceoName,
                        isReadOnly: true,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(
                        text1: '사업자 등록번호',
                        text2: '${model.insertStoreRespDto.businessNumber}',
                        controller: _businessNumber,
                        isReadOnly: true,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: InputTextFormField(
                  text1: '사업자 주소',
                  text2: '${model.insertStoreRespDto.businessAddress}',
                  controller: _businessAddress,
                  isReadOnly: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoreInfo() {
    InsertStorePageModel? model = ref.watch(insertStorePageViewModel);
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Row(
              children: [
                Icon(CupertinoIcons.doc_text),
                SizedBox(width: gap_xs),
                Text(
                  '가게 정보 입력하기',
                  style: textTheme().headline2,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: gap_xxs),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(
                        text1: '가게 명',
                        text2: '${model!.insertStoreRespDto.name}',
                        controller: _name,
                        isReadOnly: false,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(
                        text1: '전화번호',
                        text2: '${model.insertStoreRespDto.phone}',
                        controller: _phone,
                        isReadOnly: false,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: InputTextFormField(
                  text1: '가게 소개란',
                  text2: '${model.insertStoreRespDto.intro}',
                  controller: _intro,
                  isReadOnly: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: InputTextFormField(
                  text1: '가게 공지사항',
                  text2: '${model.insertStoreRespDto.notice}',
                  controller: _notice,
                  isReadOnly: false,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(
                        text1: '최소주문금액',
                        text2: '${model.insertStoreRespDto.minAmount}',
                        controller: _minAmount,
                        isReadOnly: false,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.all(gap_m),
                          child: _buildOpenTime('영업시간', '시작시간', '종료시간'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.all(gap_m),
                          child: SizedBox(
                            width: 400,
                            child: _buildDeliveryTime('평균배달시간'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: SizedBox(
                        width: 400,
                        child: _buildCategory('카테고리'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(gap_m),
                      child: InputTextFormField(
                        text1: '배달비용',
                        text2: '${model.insertStoreRespDto.deliveryCost}',
                        controller: _deliveryCost,
                        isReadOnly: false,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOpenTime(text1, text2, text3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$text1', style: textTheme().headline2),
        SizedBox(height: gap_s),
        Row(
          children: [
            Expanded(
              child: Container(
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
                    value: _selectedOpenTime,
                    items: _OpenTimeList.map(
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
                        _selectedDeliveryTime = value as String;
                      });
                    }),
              ),
            ),
            SizedBox(width: gap_m),
            Text('~', style: textTheme().headline2),
            SizedBox(width: gap_m),
            Expanded(
              child: Container(
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
                    value: _selectedCloseTime,
                    items: _CloseTimeList.map(
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
                        _selectedDeliveryTime = value as String;
                      });
                    }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeliveryTime(text1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$text1', style: textTheme().headline2),
        SizedBox(height: gap_s),
        Row(
          children: [
            Expanded(
              child: Container(
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
                    value: _selectedDeliveryTime,
                    items: _deliveryTimeList.map(
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
                        _selectedDeliveryTime = value as String;
                      });
                    }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategory(text1) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$text1', style: textTheme().headline2),
        SizedBox(height: gap_s),
        Row(
          children: [
            Expanded(
              child: Container(
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
            ),
          ],
        ),
      ],
    );
  }
}
