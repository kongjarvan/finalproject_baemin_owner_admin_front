class MenuDetailRespDto {
  int menuId;
  String category;
  String name;
  String intro;
  int price;
  String? thumbnail;
  bool closure;

  MenuDetailRespDto({
    required this.menuId,
    required this.category,
    required this.name,
    required this.intro,
    required this.price,
    required this.thumbnail,
    required this.closure,
  });

  factory MenuDetailRespDto.fromJson(Map<String, dynamic> json) => MenuDetailRespDto(
        menuId: json["menuId"],
        category: json["category"],
        name: json["name"],
        intro: json["intro"],
        price: json["price"],
        thumbnail: json["thumbnail"],
        closure: json["closure"],
      );
}
