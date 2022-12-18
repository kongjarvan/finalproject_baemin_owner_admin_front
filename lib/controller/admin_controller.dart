import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/dto/req/accept_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/admin_service.dart';
import 'package:baemin_owner_admin_front/service/menu_service.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/register_owner/model/admin_register_owner_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../core/constant/move.dart';

final adminController = Provider<AdminController>((ref) {
  return AdminController(ref);
});

class AdminController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  AdminController(this._ref);

  MenuService orderService = MenuService();

  Future<void> acceptOwner(AcceptOwnerReqDto acceptOwnerReqDto, int storeId) async {
    Logger().d('컨트롤러 진입 : ${acceptOwnerReqDto.accept}, ${storeId}');
    ResponseDto responseDto = await AdminService().fetchAcceptOwner(acceptOwnerReqDto, storeId);

    if (responseDto.code == 1) {
      await _ref.read(adminRegisterOwnerPageViewModel.notifier).notifyViewModel();
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x99FF521C),
          content: Text("승인 완료."),
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
          content: Text("오류 발생"),
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
