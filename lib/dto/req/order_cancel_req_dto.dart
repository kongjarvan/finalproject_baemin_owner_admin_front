class OrderCancelReqDto {
  final String state;
  final String reason;

  OrderCancelReqDto({required this.state, required this.reason});

  Map<String, dynamic> toJson() {
    return {"state": state, "reason": reason};
  }
}
