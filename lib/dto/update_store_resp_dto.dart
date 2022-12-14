class UpdateStoreRespDto {
  String category;
  String name;
  String phone;
  String? thumbnail;
  String ceoName;
  String businessNumber;
  String businessAddress;
  String openTime;
  String closeTime;
  String minAmount;
  String deliveryHour;
  String deliveryCost;
  String intro;
  String notice;

  UpdateStoreRespDto({
    required this.category,
    required this.name,
    required this.phone,
    required this.thumbnail,
    required this.ceoName,
    required this.businessNumber,
    required this.businessAddress,
    required this.openTime,
    required this.closeTime,
    required this.minAmount,
    required this.deliveryHour,
    required this.deliveryCost,
    required this.intro,
    required this.notice,
  });

  factory UpdateStoreRespDto.fromJson(Map<String, dynamic> json) => UpdateStoreRespDto(
        category: json["category"],
        name: json["name"],
        phone: json["phone"],
        thumbnail: json["thumbnail"],
        ceoName: json["ceoName"],
        businessNumber: json["businessNumber"],
        businessAddress: json["businessAddress"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        minAmount: json["minAmount"],
        deliveryHour: json["deliveryHour"],
        deliveryCost: json["deliveryCost"],
        intro: json["intro"],
        notice: json["notice"],
      );
}
