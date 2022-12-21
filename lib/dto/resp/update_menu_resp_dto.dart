class UpdateMenuRespDto {
  final String category;
  final String name;
  final String intro;
  final int price;
  final dynamic thumbnail;
  final bool closure;

  UpdateMenuRespDto({
    required this.category,
    required this.name,
    required this.intro,
    required this.price,
    required this.thumbnail,
    required this.closure,
  });

  factory UpdateMenuRespDto.fromJson(Map<String, dynamic> json) => UpdateMenuRespDto(
        category: json["category"],
        name: json["name"],
        intro: json["intro"],
        price: json["price"],
        thumbnail: json["thumbnail"],
        closure: json["closure"],
      );
}
