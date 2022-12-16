import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/review_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/reported_review/model/reported_review_list_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reportedReviewListPageViewModel = StateNotifierProvider.autoDispose<ReportedReviewListPageViewModel, ReportedReviewListPageModel?>((ref) {
  return ReportedReviewListPageViewModel(null)..notifyViewModel();
});

class ReportedReviewListPageViewModel extends StateNotifier<ReportedReviewListPageModel?> {
  final ReviewService reviewService = ReviewService();
  final mContext = navigatorKey.currentContext;

  ReportedReviewListPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await reviewService.fetchGetReportedReviewList();
    if (responseDto.code == 1) {
      state = ReportedReviewListPageModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("Jwt 토큰이 만료되었습니다. 로그인 페이지로 이동합니다.")),
      );
    }
  }
}
