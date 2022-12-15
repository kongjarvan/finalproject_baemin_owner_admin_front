import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/req/register_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/components/logo.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterOwnerPage extends StatelessWidget {
  RegisterOwnerPage({super.key});

  final _ceoName = TextEditingController();
  final _businessAddress = TextEditingController();
  final _businessNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              InputTextFormField(text1: '대표자 이름', text2: '대표자 이름 입력', controller: _ceoName, isReadOnly: false),
              SizedBox(height: 24),
              InputTextFormField(text1: '사업자 주소', text2: '사업자 주소 입력', controller: _businessAddress, isReadOnly: false),
              SizedBox(height: 24),
              InputTextFormField(text1: '사업자 번호', text2: '사업자 번호 입력', controller: _businessNumber, isReadOnly: false),
              SizedBox(height: 24),
              _buildApplicateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApplicateButton(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        OwnerController ownerCT = ref.read(ownerController);

        return InkWell(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: kMainColor),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(child: Text('입점 신청하기', style: textTheme().headline3)),
            ),
          ),
          onTap: () {
            RegisterOwnerReqDto registerOwnerReqDto = RegisterOwnerReqDto(
              ceoName: _ceoName.text.trim(),
              businessNumber: _businessNumber.text.trim(),
              businessAddress: _businessAddress.text.trim(),
            );
            ownerCT.registerOwner(registerOwnerReqDto);
          },
        );
      },
    );
  }
}
