class OrderListRespDto {
  final int? id;
  final String? payment;
  final List<Orders>? orderList;
  final int? deliveryPrice;
  final String? orderComment;
  final String? deliveryState;
  final String? userAddress;
  final String? userPhone;
  final String? orderTime;
  final String? deliveryHour;
  final String? orderState;
  final String? completeTime;

  OrderListRespDto({
    required this.id,
    required this.payment,
    required this.orderList,
    required this.deliveryPrice,
    required this.orderComment,
    required this.deliveryState,
    required this.userAddress,
    required this.userPhone,
    required this.orderTime,
    required this.deliveryHour,
    required this.orderState,
    required this.completeTime,
  });

  factory OrderListRespDto.fromJson(Map<String, dynamic> json) {
    var list = json['orderList'] as List;
    List<Orders> ordersList = list.map((e) => Orders.fromJson(e)).toList();

    return OrderListRespDto(
      id: json["id"],
      payment: json["payment"],
      orderList: ordersList,
      deliveryPrice: json["deliveryPrice"],
      orderComment: json["orderComment"],
      deliveryState: json["deliveryState"],
      userAddress: json["userAddress"],
      userPhone: json["userPhone"],
      orderTime: json["orderTime"],
      deliveryHour: json["deliveryHour"],
      orderState: json["orderState"],
      completeTime: json["completeTime"],
    );
  }
}

class Orders {
  final int id;
  final int count;
  final String menuName;
  final int price;

  Orders({
    required this.id,
    required this.count,
    required this.menuName,
    required this.price,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      id: json["id"],
      count: json["count"],
      menuName: json["menuName"],
      price: json["price"],
    );
  }
}
