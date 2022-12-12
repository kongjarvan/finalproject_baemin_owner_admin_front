class OrderListRespDto {
  final int id;
  final String payment;
  final Orders orderList;
  final String deliveryPrice;
  final String orderComment;
  final String deliveryState;
  final String userAddress;
  final String userPhone;
  final String orderTime;
  final String deliveryHour;
  final String orderState;
  final String completeTime;

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

  OrderListRespDto.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        payment = json["payment"],
        orderList = json["orderList"],
        deliveryPrice = json["deliveryPrice"],
        orderComment = json["orderComment"],
        deliveryState = json["deliveryState"],
        userAddress = json["userAddress"],
        userPhone = json["userPhone"],
        orderTime = json["orderTime"],
        deliveryHour = json["deliveryHour"],
        orderState = json["orderState"],
        completeTime = json["completeTime"];
}

class Orders {
  final int id;
  final int count;
  final String menuName;
  final String price;

  Orders({
    required this.id,
    required this.count,
    required this.menuName,
    required this.price,
  });
}
