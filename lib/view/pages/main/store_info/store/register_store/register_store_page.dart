import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/register_store/model/insert_store_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/register_store/model/insert_store_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

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
  final _openTime = TextEditingController();
  final _closeTime = TextEditingController();
  final _deliveryHour = TextEditingController();
  final _deliveryCost = TextEditingController();

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
        _buildConfirmButton(title)
      ],
    );
  }

  Consumer _buildConfirmButton(title) {
    return Consumer(
      builder: (context, ref, child) {
        OwnerController ownerCT = ref.read(ownerController);
        return InkWell(
          onTap: () {},
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
                        text2: '가게 이름 입력',
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
                        text2: '전화번호 입력',
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
                  text2: '가게 소개란 입력',
                  controller: _intro,
                  isReadOnly: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(gap_m),
                child: InputTextFormField(
                  text1: '가게 공지사항',
                  text2: '가게 공지사항 입력',
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
                        text2: '최소주문금액 입력',
                        controller: _deliveryCost,
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
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.all(gap_m),
                  child: SizedBox(
                    width: 400,
                    child: _buildDeliveryTime('평균배달시간'),
                  ),
                ),
              ),
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
              child: TextFormField(
                controller: _openTime,
                validator: (value) => value!.isEmpty ? '${text2}을 입력 해 주세요' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 2),
                  ),
                  hintText: '${text2}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            SizedBox(width: gap_m),
            Text('~', style: textTheme().headline2),
            SizedBox(width: gap_m),
            Expanded(
              child: TextFormField(
                controller: _closeTime,
                validator: (value) => value!.isEmpty ? '${text3}을 입력 해 주세요' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 2),
                  ),
                  hintText: '${text3}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
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
              child: TextFormField(
                controller: _deliveryHour,
                validator: (value) => value!.isEmpty ? '${text1}을 입력 해 주세요' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kMainColor, width: 2),
                  ),
                  hintText: '${text1}',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
