class StatisticsRespDto {
  int orderCount;
  int orderAmount;
  int orderExpenseAmount;
  int deliveryCount;
  int deliveryAmount;
  int takeOutCount;
  int takeOutAmount;

  StatisticsRespDto({
    required this.orderCount,
    required this.orderAmount,
    required this.orderExpenseAmount,
    required this.deliveryCount,
    required this.deliveryAmount,
    required this.takeOutCount,
    required this.takeOutAmount,
  });

  factory StatisticsRespDto.fromJson(Map<String, dynamic> json) => StatisticsRespDto(
        orderCount: json["orderCount"],
        orderAmount: json["orderAmount"],
        orderExpenseAmount: json["orderExpenseAmount"],
        deliveryCount: json["deliveryCount"],
        deliveryAmount: json["deliveryAmount"],
        takeOutCount: json["takeOutCount"],
        takeOutAmount: json["takeOutAmount"],
      );
}
