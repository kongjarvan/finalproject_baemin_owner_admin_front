class AdminResolveReviewReqDto {
  final String adminComment;

  AdminResolveReviewReqDto({required this.adminComment});

  Map<String, dynamic> toJson() => {"adminComment": adminComment};
}
