import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/service/review_service.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/model/admin_main_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminMainPageViewModel = StateNotifierProvider.autoDispose<AdminMainPageViewModel, AdminMainPageModel?>((ref) {
  return AdminMainPageViewModel(AdminMainPageModel(0));
});

class AdminMainPageViewModel extends StateNotifier<AdminMainPageModel?> {
  AdminMainPageViewModel(super.state);
  final ReviewService reviewService = ReviewService();
  final mContext = navigatorKey.currentContext;

  Future<void> changeIndex(int selectedIndex) async {
    state = AdminMainPageModel(selectedIndex);
  }

  Future<void> moveToReviewDetailPage(int index) async {
    state = AdminMainPageModel(4, reviewId: index);
  }
}
