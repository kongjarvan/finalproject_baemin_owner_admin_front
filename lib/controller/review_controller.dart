import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/req/insert_ceo_comment_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/report_review_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/review_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/reported_review/model/reported_review_list_page_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_info/review/review_list/model/review_list_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewController = Provider<ReviewController>((ref) {
  return ReviewController(ref);
});

class ReviewController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;

  ReviewController(this._ref);

  ReviewService orderService = ReviewService();

  Future<void> insertCeoComment(InsertCeoCommentReqDto insertCeoCommentReqDto, int reviewId) async {
    ResponseDto responseDto = await ReviewService().fetchInsertCeoComment(insertCeoCommentReqDto, reviewId);
    await _ref.read(reviewListPageViewModel.notifier).notifyViewModel();
    if (responseDto.code == 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x99FF521C),
          content: Text("사장님 리뷰 등록이 완료 되었습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("사장님 리뷰 등록 실패"),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future<void> reportReview(ReportReviewReqDto reportReviewReqDto, int reviewId) async {
    ResponseDto responseDto = await ReviewService().fetchReportReview(reportReviewReqDto, reviewId);

    if (responseDto.code == 1) {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x99FF521C),
          content: Text("리뷰 신고가 완료 되었습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("리뷰 신고 실패"),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  // 리뷰 목록보기
  // 리뷰 답글달기
  // 리뷰 신고하기
  // 신고된 리뷰 목록보기
}
