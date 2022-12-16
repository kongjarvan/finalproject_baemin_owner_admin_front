class DeliveryCompleteReqDto {
  final String state;

  DeliveryCompleteReqDto({required this.state});

  Map<String, dynamic> toJson() {
    return {
      "state": state,
    };
  }
}
