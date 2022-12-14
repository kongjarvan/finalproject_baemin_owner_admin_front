import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/order_list_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final mainPageViewModel = StateNotifierProvider.autoDispose<MainPageViewModel, OrderListPageModel?>((ref) {
  return MainPageViewModel(null)..notifyViewModel();
});

class MainPageViewModel extends StateNotifier<OrderListPageModel?> {
  final OrderService orderService = OrderService();
  final mContext = navigatorKey.currentContext;

  MainPageViewModel(super.state);

  Future<void> changeIndex(int index) async {
    Logger().d("changeIndex 변경됨");
    OrderListPageModel model = state!;
    model.selectedIndex = index;
    state = OrderListPageModel(model.orderListRespDtos, model.selectedIndex);
  }

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await orderService.fetchOrderList();
    if (responseDto.code == 1) {
      state = OrderListPageModel(responseDto.data, 0);
      print('Model에 data 담김');
    } else {
      print('asdf ${responseDto.msg}');
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
      );
    }
  }

  void delete(int orderId) {
    OrderListPageModel model = state!;
    List<OrderListRespDto> orders = model.orderListRespDtos; // [1,2,3]
    List<OrderListRespDto> filter = orders.where((element) => element.id != orderId).toList(); // [1,3]
    state = OrderListPageModel(filter, 0);
  }
}
