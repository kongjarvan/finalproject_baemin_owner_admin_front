import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/core/util/time_list.dart';
import 'package:baemin_owner_admin_front/dto/req/register_store_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/component/insert_image.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/store/register_store/model/insert_store_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/store/register_store/model/insert_store_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterStorePage extends ConsumerStatefulWidget {
  const RegisterStorePage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterStorePage> createState() => _RegisterStorePageState();
}

final ScrollController _scrollController = ScrollController();

class _RegisterStorePageState extends ConsumerState<RegisterStorePage> {
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

  final _openTimeList = timeList();
  final _closeTimeList = timeList();

  final _deliveryTimeList = ['배달시간을 선택 해 주세요', '20분', '30분', '40분', '50분', '60분', '70분', '80분'];
  var _selectedDeliveryTime = '배달시간을 선택 해 주세요';

  final _categoryList = ['카테고리를 선택 해 주세요', '치킨', '피자', '보쌈', '버거', '분식', '한식', '중식', '일식', '보쌈', '죽'];
  var _selectedCategory = '치킨';

  var _selectedOpenTime = timeList()[0];
  var _selectedCloseTime = timeList()[0];

  @override
  Widget build(BuildContext context) {
    InsertStorePageModel? model = ref.watch(insertStorePageViewModel);
    return model == null ? const Center(child: CircularProgressIndicator()) : Scaffold(body: _buildBody(model));
  }

  Widget _buildBody(InsertStorePageModel model) {
    return Column(
      key: _formKey,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
        Flexible(
          child: RawScrollbar(
            thumbColor: kUnselectedListColor,
            radius: const Radius.circular(5),
            controller: _scrollController,
            thickness: 10,
            thumbVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(gap_l),
                child: Column(
                  children: [registerStoreForm('가게등록', model)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget registerStoreForm(title, InsertStorePageModel model) {
    return Column(
      children: [
        _buildTitle(title),
        const SizedBox(height: gap_m),
        _buildOwnerInfo(model),
        const SizedBox(height: gap_xl),
        _buildStoreInfo(),
        const SizedBox(height: gap_xl),
        _buildConfirmButton(title),
      ],
    );
  }

  Align _buildTitle(text) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        '$text',
        style: const TextStyle(fontSize: 32),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildOwnerInfo(InsertStorePageModel model) {
    return Column(
      children: [
        ownerFormTitle(),
        const SizedBox(height: gap_xxs),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              ownerNameAndBusinessNumber(model),
              businessAddress(model),
            ],
          ),
        ),
      ],
    );
  }

  Container ownerFormTitle() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Row(
          children: [
            const Icon(CupertinoIcons.person_alt),
            const SizedBox(width: gap_xs),
            Text(
              '사업자 정보  (수정불가)',
              style: textTheme().headline2,
            )
          ],
        ),
      ),
    );
  }

  Row ownerNameAndBusinessNumber(InsertStorePageModel model) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '사업자 이름',
              text2: model.insertStoreRespDto.ceoName,
              isReadOnly: true,
              controller: _ceoName,
              maxLine: 1,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '사업자 등록번호',
              text2: model.insertStoreRespDto.businessNumber,
              isReadOnly: true,
              controller: _businessNumber,
              maxLine: 1,
            ),
          ),
        ),
      ],
    );
  }

  Padding businessAddress(InsertStorePageModel model) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: InputTextFormField(
        text1: '사업자 주소',
        text2: model.insertStoreRespDto.businessAddress,
        isReadOnly: true,
        controller: _businessAddress,
        maxLine: 1,
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      children: [
        storeFormTitle(),
        const SizedBox(height: gap_xxs),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameAndPhone(),
              intro(),
              notice(),
              minAmountAndDeliveryCost(),
              SizedBox(
                height: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(flex: 1, child: timeAndCategory()),
                    Flexible(flex: 1, child: image()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container storeFormTitle() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(gap_m),
        child: Row(
          children: [
            const Icon(CupertinoIcons.doc_text),
            const SizedBox(width: gap_xs),
            Text(
              '가게 정보 입력하기',
              style: textTheme().headline2,
            )
          ],
        ),
      ),
    );
  }

  Row nameAndPhone() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '가게 이름',
              text2: '가게 이름 입력',
              isReadOnly: false,
              controller: _name,
              maxLine: 1,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '전화번호',
              text2: '- 제외하고 입력',
              isReadOnly: false,
              controller: _phone,
              maxLine: 1,
            ),
          ),
        ),
      ],
    );
  }

  Padding intro() {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: InputTextFormField(
        text1: '가게 소개란',
        text2: '가게 소개란 입력',
        isReadOnly: false,
        controller: _intro,
        maxLine: 4,
      ),
    );
  }

  Padding notice() {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: InputTextFormField(
        text1: '가게 공지사항',
        text2: '가게 공지사항 입력',
        isReadOnly: false,
        controller: _notice,
        maxLine: 15,
      ),
    );
  }

  Row minAmountAndDeliveryCost() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '최소주문금액',
              text2: '최소주문금액 입력',
              isReadOnly: false,
              controller: _minAmount,
              maxLine: 1,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '배달비용',
              text2: '배달비용 입력',
              isReadOnly: false,
              controller: _deliveryCost,
              maxLine: 1,
            ),
          ),
        )
      ],
    );
  }

  Widget timeAndCategory() {
    return Column(
      children: [
        SizedBox(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.all(gap_m),
              child: Container(
                width: 500,
                child: _buildOpenTime('영업시간', '시작시간', '종료시간'),
              ),
            ),
          ),
        ),
        SizedBox(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.all(gap_m),
              child: SizedBox(
                width: 500,
                child: _buildDeliveryTime('평균배달시간'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: SizedBox(
            width: 500,
            child: _buildCategory('카테고리'),
          ),
        ),
      ],
    );
  }

  Widget image() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset('assets/네네치킨.png', fit: BoxFit.cover)),
        const SizedBox(height: gap_m),
        Container(
          width: 300,
          decoration: BoxDecoration(border: Border.all(color: kMainColor), borderRadius: BorderRadius.circular(4)),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_xs),
              child: Text('사진 업로드', style: TextStyle(color: kMainColor, fontSize: 18)),
            ),
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
        const SizedBox(height: gap_s),
        Row(
          children: [
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
                      value: _selectedOpenTime,
                      items: _openTimeList.map(
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
                          _selectedOpenTime = value as String;
                        });
                      });
                },
              ),
            ),
            const SizedBox(width: gap_m),
            Text('~', style: textTheme().headline2),
            const SizedBox(width: gap_m),
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
                      value: _selectedCloseTime,
                      items: _closeTimeList.map(
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
                          _selectedCloseTime = value as String;
                        });
                      });
                },
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
        const SizedBox(height: gap_s),
        Row(
          children: [
            Container(
              width: 300,
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
                      });
                },
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
        const SizedBox(height: gap_s),
        Row(
          children: [
            Container(
              width: 300,
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
      ],
    );
  }

  Widget _buildConfirmButton(title) {
    return Consumer(
      builder: (context, ref, child) {
        OwnerController ownerCT = ref.read(ownerController);
        return InkWell(
          onTap: () async {
            RegisterStoreReqDto registerStoreReqDto = RegisterStoreReqDto(
              category: _selectedCategory,
              name: _name.text.trim(),
              phone: _phone.text.trim(),
              thumbnail: '사진 넣어줘야함',
              openTime: _selectedOpenTime,
              closeTime: _selectedCloseTime,
              minAmount: _minAmount.text.trim(),
              deliveryHour: _selectedDeliveryTime,
              deliveryCost: _deliveryCost.text.trim(),
              intro: _intro.text.trim(),
              notice: _notice.text.trim(),
            );

            await ownerCT.registerStore(registerStoreReqDto);
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
}
