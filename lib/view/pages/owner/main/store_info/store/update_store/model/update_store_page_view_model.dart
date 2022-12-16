import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/store/update_store/model/update_store_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateStorePageViewModel = StateNotifierProvider.autoDispose<UpdateStorePageViewModel, UpdateStorePageModel?>((ref) {
  return UpdateStorePageViewModel(null)..notifyViewModel();
});

class UpdateStorePageViewModel extends StateNotifier<UpdateStorePageModel?> {
  final OwnerService ownerService = OwnerService();
  final mContext = navigatorKey.currentContext;

  UpdateStorePageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await ownerService.fetchGetUpdateStoreInfo();
    if (responseDto.code == 1) {
      state = UpdateStorePageModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
      );
    }
  }
}
