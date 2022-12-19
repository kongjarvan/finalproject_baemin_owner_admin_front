import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/menu_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/menu_list/model/menu_list_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final insertMenuPageViewModel = StateNotifierProvider.autoDispose<InsertMenuPageViewModel, MenuListPageModel?>((ref) {
  return InsertMenuPageViewModel(null);
});

class InsertMenuPageViewModel extends StateNotifier<MenuListPageModel?> {
  final MenuService menuService = MenuService();
  final mContext = navigatorKey.currentContext;

  InsertMenuPageViewModel(super.state);
}
