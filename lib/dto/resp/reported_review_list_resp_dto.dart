class ReportedReviewListRespDto {
  int reportReviewId;
  int starPoint;
  String? photo;
  int orderId;
  DateTime createdAt;
  bool isClosure;
  bool isResolve;
  String? adminComment;

  ReportedReviewListRespDto({
    required this.reportReviewId,
    required this.starPoint,
    required this.photo,
    required this.orderId,
    required this.createdAt,
    required this.isClosure,
    required this.isResolve,
    required this.adminComment,
  });

  factory ReportedReviewListRespDto.fromJson(Map<String, dynamic> json) => ReportedReviewListRespDto(
        reportReviewId: json["reportReviewId"],
        starPoint: json["starPoint"],
        photo: json["photo"],
        orderId: json["orderId"],
        createdAt: DateTime.parse(json["createdAt"]),
        isClosure: json["isClosure"],
        isResolve: json["isResolve"],
        adminComment: json["adminComment"],
      );
}
