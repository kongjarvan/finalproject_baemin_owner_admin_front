class OrderAcceptReqDto {
  final String state;
  final String deliveryHour;

  OrderAcceptReqDto({required this.state, required this.deliveryHour});

  Map<String, dynamic> toJson() {
    return {
      "state": state,
    };
  }
}
