class OrderAcceptReqDto {
  final String state;
  final String deliveryTime;

  OrderAcceptReqDto({required this.state, required this.deliveryTime});

  Map<String, dynamic> toJson() {
    return {
      "state": state,
      "deliveryTime": deliveryTime,
    };
  }
}
