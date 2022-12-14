import 'package:baemin_owner_admin_front/model/stores.dart';

class Menus {
  final int id;
  final String name;
  final String thumbnail;
  final String intro;
  final int price;
  final String category;
  final bool isClosure;
  final Stores store;

  Menus(
    this.id,
    this.name,
    this.thumbnail,
    this.intro,
    this.price,
    this.category,
    this.isClosure,
    this.store,
  );
}
