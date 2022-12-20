import 'package:baemin_owner_admin_front/dto/users_dto.dart';
import 'package:baemin_owner_admin_front/model/stores.dart';

class Likes {
  final int id;
  final Users user;
  final Stores store;

  Likes(this.id, this.user, this.store);
}
