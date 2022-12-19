import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/resp/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_management/model/order_list_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderListPageViewModel = StateNotifierProvider.autoDispose<OrderListPageViewModel, OrderListPageModel?>((ref) {
  return OrderListPageViewModel(null)..notifyViewModel();
});

class OrderListPageViewModel extends StateNotifier<OrderListPageModel?> {
  final OrderService orderService = OrderService();
  final mContext = navigatorKey.currentContext;

  OrderListPageViewModel(super.state);

  Future<void> changeIndex(int index) async {
    OrderListPageModel model = state!;
    model.selectedIndex = index;
    state = OrderListPageModel(model.orderListRespDtos, model.selectedIndex);
  }

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await orderService.fetchOrderList();
    if (responseDto.code == 1) {
      state = OrderListPageModel(responseDto.data, 0);
    }
  }

  void delete(int orderId) {
    OrderListPageModel model = state!;
    List<OrderListRespDto> orders = model.orderListRespDtos; // [1,2,3]
    List<OrderListRespDto> filter = orders.where((element) => element.id != orderId).toList(); // [1,3]
    state = OrderListPageModel(filter, 0);
  }
}
