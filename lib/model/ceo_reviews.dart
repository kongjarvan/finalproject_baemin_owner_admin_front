import 'package:baemin_owner_admin_front/dto/resp/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/model/stores.dart';

class CeoReviews {
  final int id;
  final String content;
  final Stores store;
  final Orders order;

  CeoReviews(this.id, this.content, this.store, this.order);
}
