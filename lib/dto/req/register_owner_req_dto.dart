class RegisterOwnerReqDto {
  String ceoName;
  String businessNumber;
  String businessAddress;

  RegisterOwnerReqDto({
    required this.ceoName,
    required this.businessNumber,
    required this.businessAddress,
  });

  Map<String, dynamic> toJson() => {
        "ceoName": ceoName,
        "businessNumber": businessNumber,
        "businessAddress": businessAddress,
      };
}
