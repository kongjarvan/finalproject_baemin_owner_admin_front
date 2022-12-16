class MenuListRespDto {
  int id;
  String? thumbnail;
  String name;
  String price;
  bool closure;

  MenuListRespDto({
    required this.id,
    this.thumbnail,
    required this.name,
    required this.price,
    required this.closure,
  });

  factory MenuListRespDto.fromJson(Map<String, dynamic> json) => MenuListRespDto(
        id: json["id"],
        thumbnail: json["thumbnail"],
        name: json["name"],
        price: json["price"],
        closure: json["closure"],
      );
}
