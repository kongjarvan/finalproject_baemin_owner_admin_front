class UpdateStoreReqDto {
  String category;
  String name;
  String phone;
  String? thumbnail;
  String openTime;
  String closeTime;
  String minAmount;
  String deliveryHour;
  String deliveryCost;
  String intro;
  String? notice;

  UpdateStoreReqDto({
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

  factory UpdateStoreReqDto.fromJson(Map<String, dynamic> json) => UpdateStoreReqDto(
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

  Map<String, dynamic> toJson() => {
        "category": category,
        "name": name,
        "phone": phone,
        "thumbnail": thumbnail,
        "openTime": openTime,
        "closeTime": closeTime,
        "minAmount": minAmount,
        "deliveryHour": deliveryHour,
        "deliveryCost": deliveryCost,
        "intro": intro,
        "notice": notice,
      };
}
