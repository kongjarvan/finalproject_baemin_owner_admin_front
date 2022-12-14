import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/service/review_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewController = Provider<ReviewController>((ref) {
  return ReviewController(ref);
});

class ReviewController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;

  ReviewController(this._ref);

  ReviewService orderService = ReviewService();

  // 리뷰 목록보기
  // 리뷰 답글달기
  // 리뷰 신고하기
  // 신고된 리뷰 목록보기
}
