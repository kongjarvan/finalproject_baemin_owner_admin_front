class UpdateStoreRespDto {
  String category;
  String name;
  String phone;
  String? thumbnail;
  String openTime;
  String closeTime;
  int minAmount;
  String deliveryHour;
  int deliveryCost;
  String intro;
  String? notice;

  UpdateStoreRespDto({
    required this.category,
    required this.name,
    required this.phone,
    this.thumbnail,
    required this.openTime,
    required this.closeTime,
    required this.minAmount,
    required this.deliveryHour,
    required this.deliveryCost,
    required this.intro,
    this.notice,
  });

  factory UpdateStoreRespDto.fromJson(Map<String, dynamic> json) => UpdateStoreRespDto(
        category: json["category"],
        name: json["name"],
        phone: json["phone"],
        thumbnail: json["thumbnail"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        minAmount: json["minAmount"],
        deliveryHour: json["deliveryHour"],
        deliveryCost: json["deliveryCost"],
        intro: json["intro"],
        notice: json["notice"],
      );
}
