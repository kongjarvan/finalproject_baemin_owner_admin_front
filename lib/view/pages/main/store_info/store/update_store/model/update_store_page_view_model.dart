import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/update_store/model/update_store_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/order_list_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updateStorePageViewModel = StateNotifierProvider.autoDispose<UpdateStorePageViewModel, UpdateStoreListPageModel?>((ref) {
  return UpdateStorePageViewModel(null)..notifyViewModel();
});

class UpdateStorePageViewModel extends StateNotifier<UpdateStoreListPageModel?> {
  final OrderService orderService = OrderService();
  final mContext = navigatorKey.currentContext;

  UpdateStorePageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await orderService.fetchOrderList();
    if (responseDto.msg == "주문 목록보기 완료") {
      state = UpdateStoreListPageModel(responseDto.data);
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
