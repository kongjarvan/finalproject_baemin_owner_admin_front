import 'dart:html';

import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/dto/req/hide_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/insert_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/update_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/menu_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constant/move.dart';

final menuController = Provider<MenuController>((ref) {
  return MenuController(ref);
});

class MenuController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  MenuController(this._ref);

  MenuService orderService = MenuService();

  Future<void> hideMenu(HideMenuReqDto hideMenuReqDto, int menuId) async {
    ResponseDto responseDto = await MenuService().fetchHideMenu(hideMenuReqDto, menuId);

    if (responseDto.code == 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x99FF521C),
          content: Text("메뉴 숨김처리가 완료되었습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("메뉴 숨김처리에 실패했습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future<void> updateMenu(UpdateMenuReqDto updateMenuReqDto, int menuId) async {
    ResponseDto responseDto = await MenuService().fetchUpdateMenu(updateMenuReqDto, menuId);

    if (responseDto.code == 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x99FF521C),
          content: Text("메뉴 수정이 완료되었습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("메뉴 수정에 실패했습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future<void> insertMenu(InsertMenuReqDto insertMenuReqDto) async {
    ResponseDto responseDto = await MenuService().fetchInsertMenu(insertMenuReqDto);

    if (responseDto.code == 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x99FF521C),
          content: Text("메뉴 추가가 완료되었습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("메뉴 추가에 실패했습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }
}
