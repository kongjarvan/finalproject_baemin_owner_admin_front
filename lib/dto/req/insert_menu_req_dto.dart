class InsertMenuReqDto {
  dynamic thumbnail;
  String category;
  String name;
  int price;
  String intro;

  InsertMenuReqDto({
    this.thumbnail,
    required this.category,
    required this.name,
    required this.price,
    required this.intro,
  });

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "category": category,
        "name": name,
        "price": price,
        "intro": intro,
      };
}
