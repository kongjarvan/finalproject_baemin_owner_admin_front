import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
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
    }
  }
}
