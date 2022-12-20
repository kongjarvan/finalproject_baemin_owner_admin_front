class AdminResolveReviewRespDto {
  String adminComment;
  DateTime resolvedTime;
  bool resolve;

  AdminResolveReviewRespDto({
    required this.adminComment,
    required this.resolvedTime,
    required this.resolve,
  });

  factory AdminResolveReviewRespDto.fromJson(Map<String, dynamic> json) => AdminResolveReviewRespDto(
        adminComment: json["adminComment"],
        resolvedTime: DateTime.parse(json["resolvedTime"]),
        resolve: json["resolve"],
      );
}
