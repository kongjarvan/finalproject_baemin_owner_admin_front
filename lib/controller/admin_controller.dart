import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/dto/req/admin_accept_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/admin_resolve_review_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/admin_service.dart';
import 'package:baemin_owner_admin_front/service/menu_service.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/model/admin_main_view_model.dart';
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

  Future<void> acceptOwner(AdminAcceptOwnerReqDto adminAcceptOwnerReqDto, int storeId) async {
    ResponseDto responseDto = await AdminService().fetchAcceptOwner(adminAcceptOwnerReqDto, storeId);

    if (responseDto.code == 1) {
      await _ref.read(adminRegisterOwnerPageViewModel.notifier).notifyViewModel();
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0x99FF521C),
          content: const Text("승인 완료."),
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
          backgroundColor: const Color(0x996D62E8),
          content: const Text("오류 발생"),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future<void> resolveReview(AdminResolveReviewReqDto adminResolveReviewReqDto, int reportedReviewId) async {
    ResponseDto responseDto = await AdminService().fetchResolveReview(adminResolveReviewReqDto, reportedReviewId);

    if (responseDto.code == 1) {
      await _ref.read(adminMainPageViewModel.notifier).moveToReviewListPage();
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0x99FF521C),
          content: const Text("처리 완료."),
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
          backgroundColor: const Color(0x996D62E8),
          content: const Text("오류 발생"),
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
