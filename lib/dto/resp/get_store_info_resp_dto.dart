class GetStoreInfoRespDto {
  final String ceoName;
  final String businessNumber;
  final String businessAddress;

  GetStoreInfoRespDto({
    required this.ceoName,
    required this.businessNumber,
    required this.businessAddress,
  });

  factory GetStoreInfoRespDto.fromJson(Map<String, dynamic> json) => GetStoreInfoRespDto(
        ceoName: json["ceoName"],
        businessNumber: json["businessNumber"],
        businessAddress: json["businessAddress"],
      );
}
