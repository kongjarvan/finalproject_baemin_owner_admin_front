import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_management/order_detail/model/order_detail_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderDetailPageViewModel = StateNotifierProvider.autoDispose<OrderDetailPageViewModel, OrderDetailPageModel?>((ref) {
  return OrderDetailPageViewModel(null)..notifyViewModel();
});

class OrderDetailPageViewModel extends StateNotifier<OrderDetailPageModel?> {
  final OrderService orderService = OrderService();
  final mContext = navigatorKey.currentContext;

  OrderDetailPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await orderService.fetchOrderList();
    if (responseDto.code == 1) {
      state = OrderDetailPageModel(responseDto.data);
    }
  }
}
