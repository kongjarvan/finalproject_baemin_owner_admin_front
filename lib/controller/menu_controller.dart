import 'package:baemin_owner_admin_front/service/menu_service.dart';
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

  // 메뉴 추가
  // 메뉴 숨기기
  // 메뉴 상세보기
  // 메뉴 수정하기
  // 메뉴 목록보기
}
