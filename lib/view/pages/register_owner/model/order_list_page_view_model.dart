import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/order_list_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainPageViewModel = StateNotifierProvider.autoDispose<MainPageViewModel, OrderListPageModel?>((ref) {
  return MainPageViewModel(null);
});

class MainPageViewModel extends StateNotifier<OrderListPageModel?> {
  final OwnerService ownerService = OwnerService();
  final mContext = navigatorKey.currentContext;

  MainPageViewModel(super.state);

  // Future<void> notifyViewModel() async {
  //   ResponseDto responseDto = await ownerService.fetchGetRegisterOwnerPage();
  //   if (responseDto.code == 1) {
  //     state = OrderListPageModel(responseDto.data);
  //     print('Model에 data 담김');
  //   } else {
  //     print('asdf ${responseDto.msg}');
  //     ScaffoldMessenger.of(mContext!).showSnackBar(
  //       const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
  //     );
  //   }
  // }
}
