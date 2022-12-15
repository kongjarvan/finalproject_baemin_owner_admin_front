import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/dto/login_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/register_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/store_check_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:baemin_owner_admin_front/view/pages/model/main_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constant/move.dart';

final ownerController = Provider<OwnerController>((ref) {
  return OwnerController(ref);
});

class OwnerController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  OwnerController(this._ref);
  OwnerService ownerService = OwnerService();

  // 가게 등록
  // 가게 수정
  // 로그인
  Future<void> login({required String username, required String password}) async {
    // 1. DTO 변환
    LoginReqDto loginReqDto = LoginReqDto(username: username, password: password);

    // 2. 통신 요청
    ResponseDto responseDto = await ownerService.fetchLogin(loginReqDto);
    //3. 비지니스 로직 처리
    if (responseDto.code == 1) {
      ResponseDto responseDto = await ownerService.fetchGetUserState();
      if (responseDto.code == 1) {
        print(responseDto.data.id);
        if (responseDto.data.name.isEmpty) {
          Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(Move.registerStorePage, (route) => false);
        } else {
          Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(Move.mainPage, (route) => false);
        }
      } else {
        if (responseDto.msg == '입점미신청') {
          Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(Move.registerOwnerPage, (route) => false);
        } else {
          Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(Move.waitingRegistrationPage, (route) => false);
        }
      }
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("아이디 혹은 비밀번호가 틀렸습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  void registerOwner(RegisterOwnerReqDto registerOwnerReqDto) async {
    ResponseDto responseDto = await OwnerService().fetchInsertOwner(registerOwnerReqDto);

    if (responseDto.code == 1) {
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(Move.waitingRegistrationPage, (route) => false);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("사업자 등록 실패")),
      );
    }
  }

  // 사업자 등록
  // 영업시작, 영업종료 (toggle)
}
