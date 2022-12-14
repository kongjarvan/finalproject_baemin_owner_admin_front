import 'package:baemin_owner_admin_front/dto/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/model/menus.dart';

class OrderDetails {
  final int id;
  final int count;
  final Orders order;
  final Menus menu;

  OrderDetails(this.id, this.count, this.order, this.menu);
}
