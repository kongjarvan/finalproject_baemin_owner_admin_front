class MenuListRespDto {
  int id;
  String? thumbnail;
  String name;
  int price;
  String intro;
  bool closure;

  MenuListRespDto({
    required this.id,
    this.thumbnail,
    required this.name,
    required this.price,
    required this.intro,
    required this.closure,
  });

  factory MenuListRespDto.fromJson(Map<String, dynamic> json) => MenuListRespDto(
        id: json["id"],
        thumbnail: json["thumbnail"],
        name: json["name"],
        price: json["price"],
        intro: json["intro"],
        closure: json["closure"],
      );
}
