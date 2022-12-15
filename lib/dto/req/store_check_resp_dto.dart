class StoreCheckDto {
  final int id;
  final String name;
  final String role;
  final bool accept;

  StoreCheckDto({
    required this.id,
    required this.name,
    required this.role,
    required this.accept,
  });

  factory StoreCheckDto.fromJson(Map<String, dynamic> json) => StoreCheckDto(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        accept: json["accept"],
      );
}
