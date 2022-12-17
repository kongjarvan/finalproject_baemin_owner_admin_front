import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/core/util/time_list.dart';
import 'package:baemin_owner_admin_front/dto/req/register_store_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/update_store_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/store/update_store/model/update_store_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/store/update_store/model/update_store_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateStorePage extends ConsumerStatefulWidget {
  const UpdateStorePage({Key? key}) : super(key: key);

  @override
  ConsumerState<UpdateStorePage> createState() => _UpdateStorePageState();
}

final ScrollController _scrollController = ScrollController();

class _UpdateStorePageState extends ConsumerState<UpdateStorePage> {
  final _formKey = GlobalKey<FormState>();

  var _ceoName;
  var _businessNumber;
  var _businessAddress;
  var _name;
  var _phone;
  var _intro;
  var _notice;
  var _minAmount;
  var _deliveryCost;

  final _OpenTimeList = timeList();
  final _CloseTimeList = timeList();

  final _deliveryTimeList = ['배달시간을 선택 해 주세요', '20분', '30분', '40분', '50분', '60분', '70분', '80분'];

  final _categoryList = ['카테고리를 선택 해 주세요', '치킨', '피자', '보쌈', '버거', '분식', '한식', '중식', '일식', '보쌈', '죽'];

  var _selectedDeliveryTime;
  var _selectedCategory;
  var _selectedOpenTime;
  var _selectedCloseTime;

  @override
  Widget build(BuildContext context) {
    UpdateStorePageModel? model = ref.watch(updateStorePageViewModel);

    return model == null ? Center(child: CircularProgressIndicator()) : Scaffold(body: _buildBody(model));
  }

  Widget _buildBody(UpdateStorePageModel model) {
    _ceoName = TextEditingController(text: model.updateStoreListRespDto.name);
    _businessNumber = TextEditingController(text: model.updateStoreListRespDto.businessNumber);
    _businessAddress = TextEditingController(text: model.updateStoreListRespDto.businessAddress);
    _name = TextEditingController(text: model.updateStoreListRespDto.name);
    _phone = TextEditingController(text: model.updateStoreListRespDto.phone);
    _intro = TextEditingController(text: model.updateStoreListRespDto.intro);
    _notice = TextEditingController(text: model.updateStoreListRespDto.notice);
    _minAmount = TextEditingController(text: '${model.updateStoreListRespDto.minAmount}');
    _deliveryCost = TextEditingController(text: '${model.updateStoreListRespDto.deliveryCost}');

    _selectedDeliveryTime = model.updateStoreListRespDto.deliveryHour;
    _selectedCategory = model.updateStoreListRespDto.category;
    _selectedOpenTime = model.updateStoreListRespDto.openTime;
    _selectedCloseTime = model.updateStoreListRespDto.closeTime;

    return Column(
      key: _formKey,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
        Flexible(
          child: RawScrollbar(
            thumbColor: kUnselectedListColor,
            radius: Radius.circular(5),
            controller: _scrollController,
            thickness: 10,
            thumbVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(gap_l),
                child: Column(
                  children: [RegisterStoreForm('가게수정', model)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget RegisterStoreForm(title, UpdateStorePageModel model) {
    return Column(
      children: [
        _buildTitle(title),
        SizedBox(height: gap_m),
        _buildOwnerInfo(model),
        SizedBox(height: gap_xl),
        _buildStoreInfo(model),
        SizedBox(height: gap_xl),
        _buildConfirmButton(title),
      ],
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

  Widget _buildOwnerInfo(UpdateStorePageModel model) {
    return Column(
      children: [
        ownerFormTitle(),
        SizedBox(height: gap_xxs),
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
            Icon(CupertinoIcons.person_alt),
            SizedBox(width: gap_xs),
            Text(
              '사업자 정보  (수정불가)',
              style: textTheme().headline2,
            )
          ],
        ),
      ),
    );
  }

  Row ownerNameAndBusinessNumber(UpdateStorePageModel model) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '사업자 이름',
              text2: '사업자 이름 입력',
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
              text2: '사업자 등록번호 입력',
              isReadOnly: true,
              controller: _businessNumber,
              maxLine: 1,
            ),
          ),
        ),
      ],
    );
  }

  Padding businessAddress(UpdateStorePageModel model) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: InputTextFormField(
        text1: '사업자 주소',
        text2: '사업자 주소 입력',
        isReadOnly: true,
        controller: _businessAddress,
        maxLine: 1,
      ),
    );
  }

  Widget _buildStoreInfo(UpdateStorePageModel model) {
    return Column(
      children: [
        storeFormTitle(),
        SizedBox(height: gap_xxs),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nameAndPhone(model),
              intro(model),
              notice(model),
              minAmountAndDeliveryCost(model),
              Time(),
              category(),
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
            Icon(CupertinoIcons.doc_text),
            SizedBox(width: gap_xs),
            Text(
              '가게 정보 입력하기',
              style: textTheme().headline2,
            )
          ],
        ),
      ),
    );
  }

  Row nameAndPhone(UpdateStorePageModel model) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(gap_m),
            child: InputTextFormField(
              text1: '가게 이름',
              text2: '가게 이름 입력',
              isReadOnly: true,
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
              text2: '전화번호 입력',
              isReadOnly: true,
              controller: _phone,
              maxLine: 1,
            ),
          ),
        ),
      ],
    );
  }

  Padding intro(UpdateStorePageModel model) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: InputTextFormField(
        text1: '가게 소개란',
        text2: '가게 소개란 입력',
        isReadOnly: true,
        controller: _intro,
        maxLine: 4,
      ),
    );
  }

  Widget notice(UpdateStorePageModel model) {
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

  Row minAmountAndDeliveryCost(UpdateStorePageModel model) {
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

  Row Time() {
    return Row(
      children: [
        Flexible(
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
        Flexible(
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
    );
  }

  Padding category() {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: SizedBox(
        width: 400,
        child: _buildCategory('카테고리'),
      ),
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
                      _selectedOpenTime = value as String;
                    });
                  }),
            ),
            SizedBox(width: gap_m),
            Text('~', style: textTheme().headline2),
            SizedBox(width: gap_m),
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
                      _selectedCloseTime = value as String;
                    });
                  }),
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
      ],
    );
  }

  Widget _buildConfirmButton(title) {
    return Consumer(
      builder: (context, ref, child) {
        OwnerController ownerCT = ref.read(ownerController);
        return InkWell(
          onTap: () async {
            UpdateStoreReqDto registerStoreReqDto = UpdateStoreReqDto(
              category: _selectedCategory,
              name: _name.text.trim(),
              phone: _phone.text.trim(),
              openTime: _selectedOpenTime,
              closeTime: _selectedCloseTime,
              minAmount: _minAmount.text.trim(),
              deliveryHour: _selectedDeliveryTime,
              deliveryCost: _deliveryCost.text.trim(),
              intro: _intro.text.trim(),
              notice: _notice.text.trim(),
            );
            await ownerCT.updateStore(registerStoreReqDto);
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
