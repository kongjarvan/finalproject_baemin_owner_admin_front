class ReportReviewRespDto {
  final String reason;

  ReportReviewRespDto({required this.reason});

  factory ReportReviewRespDto.fromJson(Map<String, dynamic> json) => ReportReviewRespDto(
        reason: json["reason"],
      );
}
