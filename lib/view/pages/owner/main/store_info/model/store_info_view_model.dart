import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/service/review_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/model/store_info_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeInfoPageViewModel = StateNotifierProvider.autoDispose<StoreInfoPageViewModel, StoreInfoPageModel?>((ref) {
  return StoreInfoPageViewModel(StoreInfoPageModel(0));
});

class StoreInfoPageViewModel extends StateNotifier<StoreInfoPageModel?> {
  StoreInfoPageViewModel(super.state);
  final ReviewService reviewService = ReviewService();
  final mContext = navigatorKey.currentContext;

  Future<void> changeIndex(int index) async {
    state = StoreInfoPageModel(index);
  }
}
