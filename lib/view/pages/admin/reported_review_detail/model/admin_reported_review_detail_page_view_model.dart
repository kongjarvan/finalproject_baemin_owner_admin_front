import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/admin_service.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_detail/model/admin_reported_review_detail_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final adminReportedReviewDetailPageViewModel = StateNotifierProvider.autoDispose<AdminReportedReviewDetailPageViewModel, AdminReportedReviewDetailPageModel?>((ref) {
  return AdminReportedReviewDetailPageViewModel(null);
});

class AdminReportedReviewDetailPageViewModel extends StateNotifier<AdminReportedReviewDetailPageModel?> {
  final AdminService adminService = AdminService();
  final mContext = navigatorKey.currentContext;

  AdminReportedReviewDetailPageViewModel(super.state);

  Future<void> notifyViewModel(int reviewId) async {
    ResponseDto responseDto = await adminService.fetchGetReportedReviewDetail(reviewId);
    if (responseDto.code == 1) {
      Logger().d('서비스 통과');
      state = AdminReportedReviewDetailPageModel(responseDto.data);
    }
  }
}
