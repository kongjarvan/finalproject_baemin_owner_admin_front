import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/admin_service.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/reported_review_list/model/admin_reported_review_list_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminReportedReviewListPageViewModel = StateNotifierProvider.autoDispose<AdminReportedReviewListPageViewModel, AdminReportedReviewListPageModel?>((ref) {
  return AdminReportedReviewListPageViewModel(null)..notifyViewModel();
});

class AdminReportedReviewListPageViewModel extends StateNotifier<AdminReportedReviewListPageModel?> {
  final AdminService adminService = AdminService();
  final mContext = navigatorKey.currentContext;

  AdminReportedReviewListPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await adminService.fetchGetReportedReviewList();
    if (responseDto.code == 1) {
      state = AdminReportedReviewListPageModel(responseDto.data);
    }
  }
}