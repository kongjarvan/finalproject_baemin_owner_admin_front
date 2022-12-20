class AdminReportedReviewListRespDto {
  int id;
  String role;
  String username;
  String reason;
  bool accept;
  bool resolved;

  AdminReportedReviewListRespDto({
    required this.id,
    required this.role,
    required this.username,
    required this.reason,
    required this.accept,
    required this.resolved,
  });

  factory AdminReportedReviewListRespDto.fromJson(Map<String, dynamic> json) => AdminReportedReviewListRespDto(
        id: json["id"],
        role: json["role"],
        username: json["username"],
        reason: json["reason"],
        accept: json["accept"],
        resolved: json["resolved"],
      );
}
