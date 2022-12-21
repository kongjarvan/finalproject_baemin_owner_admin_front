class StatisticsRespDto {
  int orderCount;
  int? orderAmount;
  int deliveryCount;
  int? deliveryAmount;
  int takeOutCount;
  int? takeOutAmount;

  StatisticsRespDto({
    required this.orderCount,
    required this.orderAmount,
    required this.deliveryCount,
    required this.deliveryAmount,
    required this.takeOutCount,
    required this.takeOutAmount,
  });

  factory StatisticsRespDto.fromJson(Map<String, dynamic> json) => StatisticsRespDto(
        orderCount: json["orderCount"],
        orderAmount: json["orderAmount"],
        deliveryCount: json["deliveryCount"],
        deliveryAmount: json["deliveryAmount"],
        takeOutCount: json["takeOutCount"],
        takeOutAmount: json["takeOutAmount"],
      );
}
