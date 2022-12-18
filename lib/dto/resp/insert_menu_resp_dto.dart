class InsertMenuRespDto {
  final dynamic thumbnail;
  final String category;
  final String name;
  final String price;
  final String intro;
  final bool closure;

  InsertMenuRespDto({
    this.thumbnail,
    required this.category,
    required this.name,
    required this.price,
    required this.intro,
    required this.closure,
  });

  factory InsertMenuRespDto.fromJson(Map<String, dynamic> json) => InsertMenuRespDto(
        thumbnail: json["thumbnail"],
        category: json["category"],
        name: json["name"],
        price: json["price"],
        intro: json["intro"],
        closure: json["closure"],
      );
}
