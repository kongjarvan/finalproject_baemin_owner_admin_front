import 'package:baemin_owner_admin_front/view/models/orders/orders.dart';

class OrderDetailRespDto {
  final int id;
  final int storesId;
  final String comment;
  final OrdersDetail ordersDetailList;
  final String userAddress;
  final String userPhoneNumber;
  final DateTime orderTime;
  final String state;

  OrderDetailRespDto(
    this.id,
    this.storesId,
    this.comment,
    this.ordersDetailList,
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
    ordersDetailList[0],
    '어딘가겠지요',
    '어떤번호겠지요',
    orderList[0].createdAt,
    orderList[0].state,
  ),
  OrderDetailRespDto(
    orderList[1].id,
    orderList[1].storesId,
    orderList[1].comment,
    ordersDetailList[1 & 2 & 3],
    '어딘가겠지요',
    '어떤번호겠지요',
    orderList[1].createdAt,
    orderList[1].state,
  ),
  OrderDetailRespDto(
    orderList[2].id,
    orderList[2].storesId,
    orderList[2].comment,
    ordersDetailList[4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13],
    '어딘가겠지요',
    '어떤번호겠지요',
    orderList[2].createdAt,
    orderList[2].state,
  ),
];
