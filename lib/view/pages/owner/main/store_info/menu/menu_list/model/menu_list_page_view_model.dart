import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/menu_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/menu/menu_list/model/menu_list_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final menuListPageViewModel = StateNotifierProvider.autoDispose<MenuListPageViewModel, MenuListPageModel?>((ref) {
  return MenuListPageViewModel(null)..notifyViewModel();
});

class MenuListPageViewModel extends StateNotifier<MenuListPageModel?> {
  final MenuService menuService = MenuService();
  final mContext = navigatorKey.currentContext;

  MenuListPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    Logger().d('notifyViewModel 진입');
    ResponseDto responseDto = await menuService.fetchGetMenuList();
    if (responseDto.code == 1) {
      state = MenuListPageModel(responseDto.data);
    }
  }
}
