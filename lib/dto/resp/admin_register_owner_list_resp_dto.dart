class AdminRegisterOwnerListRespDto {
  int id;
  String username;
  String businessNumber;
  String ceoName;
  bool accept;

  AdminRegisterOwnerListRespDto({
    required this.id,
    required this.username,
    required this.businessNumber,
    required this.ceoName,
    required this.accept,
  });

  factory AdminRegisterOwnerListRespDto.fromJson(Map<String, dynamic> json) => AdminRegisterOwnerListRespDto(
        id: json["id"],
        username: json["username"],
        businessNumber: json["businessNumber"],
        ceoName: json["ceoName"],
        accept: json["accept"],
      );
}
