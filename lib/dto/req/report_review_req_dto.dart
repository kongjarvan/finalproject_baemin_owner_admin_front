class ReportReviewReqDto {
  final String userKind;
  final String reason;

  ReportReviewReqDto(this.userKind, this.reason);

  Map<String, dynamic> toJson() => {
        "userKind": userKind,
        "reason": reason,
      };
}
