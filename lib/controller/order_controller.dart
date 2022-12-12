import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/main_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderController = Provider<OrderController>((ref) {
  return OrderController(ref);
});

class OrderController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  OrderController(this._ref);

  OrderService orderService = OrderService();

  Future<void> refreshMainPage() async {
    _ref.read(mainPageViewModel.notifier).notifyViewModel();
  }

  // 주문 상세보기
  // 주문 목록보기
  // 주문 받기?
  // 주문 거절하기
  // 배달완료 알림 보내기
}
