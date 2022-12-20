class GetUpdateStoreInfoRespDto {
  String? category;
  String? name;
  String? phone;
  String? thumbnail;
  String? ceoName;
  String? businessNumber;
  String? businessAddress;
  String? openTime;
  String? closeTime;
  int? minAmount;
  String? deliveryHour;
  int? deliveryCost;
  String? intro;
  String? notice;

  GetUpdateStoreInfoRespDto({
    this.category,
    this.name,
    this.phone,
    this.thumbnail,
    this.ceoName,
    this.businessNumber,
    this.businessAddress,
    this.openTime,
    this.closeTime,
    this.minAmount,
    this.deliveryHour,
    this.deliveryCost,
    this.intro,
    this.notice,
  });

  factory GetUpdateStoreInfoRespDto.fromJson(Map<String, dynamic> json) => GetUpdateStoreInfoRespDto(
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
