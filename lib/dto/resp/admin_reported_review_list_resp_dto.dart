class AdminReportedReviewListRespDto {
  int id;
  String role;
  String username;
  String reason;
  bool isResolved;

  AdminReportedReviewListRespDto({
    required this.id,
    required this.role,
    required this.username,
    required this.reason,
    required this.isResolved,
  });

  factory AdminReportedReviewListRespDto.fromJson(Map<String, dynamic> json) => AdminReportedReviewListRespDto(
        id: json["id"],
        role: json["role"],
        username: json["username"],
        reason: json["reason"],
        isResolved: json["isResolved"],
      );
}
