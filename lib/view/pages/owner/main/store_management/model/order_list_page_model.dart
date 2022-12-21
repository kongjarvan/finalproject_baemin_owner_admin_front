import 'package:baemin_owner_admin_front/dto/resp/order_list_resp_dto.dart';

class OrderListPageModel {
  // state
  List<OrderListRespDto> orderListRespDtos;
  int selectedIndex = 0;

  OrderListPageModel(this.orderListRespDtos, this.selectedIndex);
}
