import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/register_store/model/insert_store_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final insertStorePageViewModel = StateNotifierProvider.autoDispose<InsertStorePageViewModel, InsertStorePageModel?>((ref) {
  return InsertStorePageViewModel(null)..notifyViewModel();
});

class InsertStorePageViewModel extends StateNotifier<InsertStorePageModel?> {
  final OwnerService ownerService = OwnerService();
  final mContext = navigatorKey.currentContext;

  InsertStorePageViewModel(super.state);

  Future<void> notifyViewModel() async {
    print('뭔지 모르겠는데 일단 진입');
    ResponseDto responseDto = await ownerService.fetchgetOwnerInfo();
    print('뭔가 응답됨');
    if (responseDto.code == 1) {
      state = InsertStorePageModel(responseDto.data);
      print('Model에 data 담김');
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("가게 등록 페이지 로딩 오류!")),
      );
    }
  }
}
