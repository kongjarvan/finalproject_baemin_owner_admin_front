import 'package:baemin_owner_admin_front/view/models/menus/menus.dart';
import 'package:baemin_owner_admin_front/view/models/orders/orders.dart';

class OrderDetailRespDto {
  final int id;
  final int storesId;
  final String comment;
  final String userAddress;
  final String userPhoneNumber;
  final DateTime orderTime;
  final String state;

  OrderDetailRespDto({
    required this.id,
    required this.storesId,
    required this.comment,
    required this.userAddress,
    required this.userPhoneNumber,
    required this.orderTime,
    required this.state,
  });
}

class OrdersDetail {
  final int id;
  final int ordersId;
  final Menus menu;
  final int count;

  OrdersDetail({
    required this.id,
    required this.ordersId,
    required this.menu,
    required this.count,
  });
}

List<OrdersDetail> ordersDetailList = [
  OrdersDetail(id: 1, ordersId: 1, menu: menuList[0], count: 2),
  OrdersDetail(id: 2, ordersId: 2, menu: menuList[1], count: 1),
  OrdersDetail(id: 3, ordersId: 2, menu: menuList[2], count: 1),
  OrdersDetail(id: 4, ordersId: 2, menu: menuList[3], count: 1),
  OrdersDetail(id: 5, ordersId: 3, menu: menuList[4], count: 2),
  OrdersDetail(id: 6, ordersId: 3, menu: menuList[5], count: 2),
  OrdersDetail(id: 7, ordersId: 3, menu: menuList[6], count: 2),
  OrdersDetail(id: 8, ordersId: 3, menu: menuList[7], count: 2),
  OrdersDetail(id: 9, ordersId: 3, menu: menuList[8], count: 2),
  OrdersDetail(id: 10, ordersId: 3, menu: menuList[9], count: 2),
  OrdersDetail(id: 11, ordersId: 3, menu: menuList[10], count: 2),
  OrdersDetail(id: 12, ordersId: 3, menu: menuList[11], count: 2),
  OrdersDetail(id: 13, ordersId: 3, menu: menuList[12], count: 2),
  OrdersDetail(id: 14, ordersId: 3, menu: menuList[13], count: 2),
];

List<OrderDetailRespDto> orderDetailRespDtoList = [
  OrderDetailRespDto(
    id: orderList[0].id,
    storesId: orderList[0].storesId,
    comment: orderList[0].comment,
    userAddress: '부산시 수영구 광안로 61번나길 22번지 302호',
    userPhoneNumber: '010-9101-3199',
    orderTime: orderList[0].createdAt,
    state: orderList[0].state,
  ),
  OrderDetailRespDto(
    id: orderList[1].id,
    storesId: orderList[1].storesId,
    comment: orderList[1].comment,
    userAddress: '부산시 수영구 광안로 61번나길 22번지 302호',
    userPhoneNumber: '010-9101-3199',
    orderTime: orderList[1].createdAt,
    state: orderList[1].state,
  ),
  OrderDetailRespDto(
    id: orderList[2].id,
    storesId: orderList[2].storesId,
    comment: orderList[2].comment,
    userAddress: '부산시 수영구 광안로 61번나길 22번지 302호',
    userPhoneNumber: '010-9101-3199',
    orderTime: orderList[2].createdAt,
    state: orderList[2].state,
  ),
];
