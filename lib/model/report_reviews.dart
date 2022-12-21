import 'package:baemin_owner_admin_front/dto/users_dto.dart';

class ReportReviews {
  final int id;
  final Users user;
  final String customerReview;
  final String ceoReview;
  final String reason;
  final String adminComment;
  final bool isResolve;
  final String resolvedTime;
  final String createdAt;

  ReportReviews(
    this.id,
    this.user,
    this.customerReview,
    this.ceoReview,
    this.reason,
    this.adminComment,
    this.isResolve,
    this.resolvedTime,
    this.createdAt,
  );
}
