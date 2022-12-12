import 'package:baemin_owner_admin_front/dto/login_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
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
    print(loginReqDto.username);
    print(loginReqDto.password);

    // 2. 통신 요청
    ResponseDto responseDto = await ownerService.fetchLogin(loginReqDto);
    print(responseDto.msg);
    //3. 비지니스 로직 처리
    if (responseDto.msg == "로그인 성공") {
      print('메인페이지로 이동하기');
      print(navigatorKey.currentContext);
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(Move.mainPage, (route) => false);
    } else {
      print('막힘');
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("로그인 실패")),
      );
    }
  }
  // 사업자 등록
  // 영업시작, 영업종료 (toggle)
}
