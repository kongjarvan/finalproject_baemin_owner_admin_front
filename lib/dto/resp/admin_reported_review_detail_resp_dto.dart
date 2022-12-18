class AdminReportedReviewDetailRespDto {
  int reportReviewId;
  String nickname;
  String content;
  String reason;
  String storeName;
  String comment;

  AdminReportedReviewDetailRespDto({
    required this.reportReviewId,
    required this.nickname,
    required this.content,
    required this.reason,
    required this.storeName,
    required this.comment,
  });

  factory AdminReportedReviewDetailRespDto.fromJson(Map<String, dynamic> json) => AdminReportedReviewDetailRespDto(
        reportReviewId: json["reportReviewId"],
        nickname: json["nickname"],
        content: json["content"],
        reason: json["reason"],
        storeName: json["storeName"],
        comment: json["comment"],
      );
}
