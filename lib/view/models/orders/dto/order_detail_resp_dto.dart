import 'package:baemin_owner_admin_front/view/models/orders/orders.dart';

class OrderDetailRespDto {
  final int id;
  final int storesId;
  final String comment;
  final String userAddress;
  final String userPhoneNumber;
  final DateTime orderTime;
  final String state;

  OrderDetailRespDto(
    this.id,
    this.storesId,
    this.comment,
    this.userAddress,
    this.userPhoneNumber,
    this.orderTime,
    this.state,
  );
}

class OrdersDetail {
  final int id;
  final int ordersId;
  final int price;
  final int count;

  OrdersDetail(this.id, this.ordersId, this.price, this.count);
}

List<OrdersDetail> ordersDetailList = [
  OrdersDetail(1, 1, 7000, 2),
  OrdersDetail(2, 2, 7000, 1),
  OrdersDetail(3, 2, 8000, 1),
  OrdersDetail(4, 2, 7500, 1),
  OrdersDetail(5, 3, 12000, 2),
  OrdersDetail(6, 3, 11000, 2),
  OrdersDetail(7, 3, 8000, 2),
  OrdersDetail(8, 3, 9000, 2),
  OrdersDetail(9, 3, 10000, 2),
  OrdersDetail(10, 3, 12000, 2),
  OrdersDetail(11, 3, 8000, 2),
  OrdersDetail(12, 3, 20000, 2),
  OrdersDetail(13, 3, 12000, 2),
  OrdersDetail(14, 3, 11000, 2),
];

List<OrderDetailRespDto> orderDetailRespDtoList = [
  OrderDetailRespDto(
    orderList[0].id,
    orderList[0].storesId,
    orderList[0].comment,
    '부산시 수영구 광안로 61번나길 22번지 302호',
    '010-9101-3199',
    orderList[0].createdAt,
    orderList[0].state,
  ),
  OrderDetailRespDto(
    orderList[1].id,
    orderList[1].storesId,
    orderList[1].comment,
    '김해시 안동 잠깐만 여길 어떻게 배달해',
    '010-1234-1234',
    orderList[1].createdAt,
    orderList[1].state,
  ),
  OrderDetailRespDto(
    orderList[2].id,
    orderList[2].storesId,
    orderList[2].comment,
    '부산시 수영구 광안역 3번출구',
    '010-1234-1234',
    orderList[2].createdAt,
    orderList[2].state,
  ),
];
