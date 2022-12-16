import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/menu_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/update_menu/model/update_menu_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateMenuPageViewModel = StateNotifierProvider.autoDispose<UpdateMenuPageViewModel, UpdateMenuPageModel?>((ref) {
  return UpdateMenuPageViewModel(null)..notifyViewModel();
});

class UpdateMenuPageViewModel extends StateNotifier<UpdateMenuPageModel?> {
  final MenuService menuService = MenuService();
  final mContext = navigatorKey.currentContext;

  UpdateMenuPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await menuService.fetchGetMenuDetail();
    if (responseDto.code == 1) {
      state = UpdateMenuPageModel(responseDto.data);
      print('Model에 data 담김');
    } else {
      print('${responseDto.msg}');
      print('혹시 터졌는지?');
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
      );
    }
  }
}
