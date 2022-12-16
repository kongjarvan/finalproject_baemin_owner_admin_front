import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_management/model/order_list_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainPageViewModel = StateNotifierProvider.autoDispose<MainPageViewModel, OrderListPageModel?>((ref) {
  return MainPageViewModel(null);
});

class MainPageViewModel extends StateNotifier<OrderListPageModel?> {
  final OwnerService ownerService = OwnerService();
  final mContext = navigatorKey.currentContext;

  MainPageViewModel(super.state);
}
