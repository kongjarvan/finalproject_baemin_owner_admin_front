import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/order_detail/model/order_detail_page_model.dart';
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
      print('Model에 data 담김');
    } else {
      print('asdf ${responseDto.msg}');
      print('혹시 터졌는지?');
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
      );
    }
  }
}