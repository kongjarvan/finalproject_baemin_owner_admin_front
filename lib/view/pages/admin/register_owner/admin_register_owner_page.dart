import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/admin_controller.dart';
import 'package:baemin_owner_admin_front/dto/req/accept_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/register_owner/model/admin_register_owner_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/register_owner/model/admin_register_owner_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminRegisterOwnerPage extends StatefulWidget {
  const AdminRegisterOwnerPage({Key? key}) : super(key: key);

  @override
  State<AdminRegisterOwnerPage> createState() => _AdminRegisterOwnerPageState();
}

class _AdminRegisterOwnerPageState extends State<AdminRegisterOwnerPage> {
  final _valueList = ['처리유무', '아이디순', '대표자성함순'];
  var _selectedValue = '처리유무';
  var _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(gap_l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: kWhiteColor,
              child: Padding(
                padding: const EdgeInsets.all(gap_m),
                child: Text('총 99명이 가입신청을 했어요', style: textTheme().headline1),
              ),
            ),
            const SizedBox(height: gap_l),
            Flexible(
              child: Container(
                color: kWhiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(gap_xl),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                value: _selectedValue,
                                items: _valueList.map(
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
                                    _selectedValue = value as String;
                                  });
                                }),
                          ),
                          Row(
                            children: [
                              _buildRefuseButton(),
                              const SizedBox(width: gap_s),
                              _buildRegisterButton(),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: gap_l),
                      _buildApplierHeader(),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Consumer(
                            builder: (context, ref, child) {
                              AdminRegisterOwnerPageModel? model = ref.watch(adminRegisterOwnerPageViewModel);
                              return model == null
                                  ? const Center(child: CircularProgressIndicator())
                                  : Column(
                                      children: List.generate(
                                        model.adminRegisterOwnerListRespDtos.length,
                                        (index) {
                                          return _buildApplierList(
                                            model,
                                            model.adminRegisterOwnerListRespDtos[index].username,
                                            model.adminRegisterOwnerListRespDtos[index].businessNumber,
                                            model.adminRegisterOwnerListRespDtos[index].ceoName,
                                            model.adminRegisterOwnerListRespDtos[index].accept,
                                            index,
                                          );
                                        },
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildApplierHeader() {
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kAdminGreyColor),
                color: kUnselectedListColor,
              ),
              child: Center(
                  child: Text(
                '유저아이디',
                style: TextStyle(color: kWhiteColor),
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kAdminGreyColor),
                color: kUnselectedListColor,
              ),
              child: Center(
                  child: Text(
                '사업자번호',
                style: TextStyle(color: kWhiteColor),
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kAdminGreyColor),
                color: kUnselectedListColor,
              ),
              child: Center(
                  child: Text(
                '사업자명',
                style: TextStyle(color: kWhiteColor),
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kAdminGreyColor),
                color: kUnselectedListColor,
              ),
              child: Center(
                  child: Text(
                '승인유무',
                style: TextStyle(color: kWhiteColor),
              )),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: kAdminGreyColor),
                color: kUnselectedListColor,
              ),
              child: Center(
                  child: Text(
                '처리하기',
                style: TextStyle(color: kWhiteColor),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApplierList(AdminRegisterOwnerPageModel model, String username, String businessNumber, String ceoName, bool accept, int index) {
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
              child: Center(child: Text(username)),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
              child: Center(child: Text(businessNumber)),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
              child: Center(child: Text(ceoName)),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
              child: Center(child: Text(accept == true ? '승인완료' : '미승인')),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
              child: accept == true ? Center(child: SizedBox()) : Center(child: _acceptButton(model, index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _acceptButton(AdminRegisterOwnerPageModel model, int index) {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () {
            AdminController reviewCT = ref.read(adminController);
            AcceptOwnerReqDto acceptOwnerReqDto = AcceptOwnerReqDto(model.adminRegisterOwnerListRespDtos[index].accept);
            reviewCT.acceptOwner(acceptOwnerReqDto, model.adminRegisterOwnerListRespDtos[index].id);
          },
          child: Container(
              decoration: BoxDecoration(border: Border.all(color: kAdminGreyColor)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: gap_s),
                child: Text('승인하기'),
              )),
        );
      },
    );
  }

  // TableRow _buildApplierList(ownerId, storeRegisterNumber, ownerName, result) {
  //   return TableRow(
  //     decoration: const BoxDecoration(
  //       color: kWhiteColor,
  //     ),
  //     children: <Widget>[
  //       Center(
  //         child: Checkbox(
  //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  //           activeColor: kMainColor,
  //           checkColor: Colors.white,
  //           value: _isChecked,
  //           onChanged: (value) {
  //             setState(() {
  //               _isChecked = value!;
  //             });
  //           },
  //         ),
  //       ),
  //       Align(
  //         alignment: AlignmentDirectional.center,
  //         child: Text('${ownerId}', style: textTheme().headline1),
  //       ),
  //       Align(
  //         alignment: AlignmentDirectional.center,
  //         child: Text('${storeRegisterNumber}', style: textTheme().headline1),
  //       ),
  //       Align(
  //         alignment: AlignmentDirectional.center,
  //         child: Text('${ownerName}', style: textTheme().headline1),
  //       ),
  //       Align(
  //         alignment: AlignmentDirectional.center,
  //         child: Text('${result}', style: textTheme().headline1),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildRegisterButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kMainColor),
          borderRadius: BorderRadius.circular(4),
          color: kMainColor,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_s),
          child: Text(
            '가입승인',
            style: TextStyle(fontSize: 18, color: kWhiteColor, height: 1),
          ),
        ),
      ),
    );
  }

  Widget _buildRefuseButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kButtonSubColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: gap_xl, vertical: gap_s),
          child: Text(
            '가입거절',
            style: TextStyle(fontSize: 18, color: kButtonSubColor, height: 1),
          ),
        ),
      ),
    );
  }
}
