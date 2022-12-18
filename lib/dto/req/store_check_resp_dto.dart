class StoreCheckDto {
  final int storeId;
  final String name;
  final String role;
  final bool accept;

  StoreCheckDto({
    required this.storeId,
    required this.name,
    required this.role,
    required this.accept,
  });

  factory StoreCheckDto.fromJson(Map<String, dynamic> json) => StoreCheckDto(
        storeId: json["storeId"],
        name: json["name"],
        role: json["role"],
        accept: json["accept"],
      );
}
