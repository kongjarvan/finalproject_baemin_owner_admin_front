import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/review_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewListPageViewModel = StateNotifierProvider.autoDispose<ReviewListPageViewModel, ReviewListPageModel?>((ref) {
  return ReviewListPageViewModel(null)..notifyViewModel();
});

class ReviewListPageViewModel extends StateNotifier<ReviewListPageModel?> {
  final ReviewService reviewService = ReviewService();
  final mContext = navigatorKey.currentContext;

  ReviewListPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await reviewService.fetchGetReviewList();
    if (responseDto.code == 1) {
      state = ReviewListPageModel(responseDto.data);
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
