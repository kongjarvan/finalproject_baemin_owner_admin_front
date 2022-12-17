class ReportReviewReqDto {
  final String reason;

  ReportReviewReqDto(this.reason);

  Map<String, dynamic> toJson() => {
        "reason": reason,
      };
}
