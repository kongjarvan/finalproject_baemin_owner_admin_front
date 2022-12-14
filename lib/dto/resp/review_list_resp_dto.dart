class ReviewListRespDto {
  int id;
  int starPoint;
  DateTime orderCreatedAt;
  int orderId;
  String customerContent;
  String ceoContent;
  bool closure;

  ReviewListRespDto({
    required this.id,
    required this.starPoint,
    required this.orderCreatedAt,
    required this.orderId,
    required this.customerContent,
    required this.ceoContent,
    required this.closure,
  });

  factory ReviewListRespDto.fromJson(Map<String, dynamic> json) => ReviewListRespDto(
        id: json["id"],
        starPoint: json["starPoint"],
        orderCreatedAt: DateTime.parse(json["orderCreatedAt"]),
        orderId: json["orderId"],
        customerContent: json["customerContent"],
        ceoContent: json["ceoContent"],
        closure: json["closure"],
      );
}
