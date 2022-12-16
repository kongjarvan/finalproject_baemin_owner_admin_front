import 'dart:convert';
import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/delivery_complete_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/order_accept_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/order_cancel_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/register_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/store_session.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class OrderService {
  final HttpConnector httpConnector = HttpConnector();

  static final OrderService _instance = OrderService._single();
  OrderService._single();

  factory OrderService() {
    return _instance;
  }

  Future<ResponseDto> fetchOrderList() async {
    Response response =
        await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/order", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      print('통과1');
      print(responseDto.data);
      List<OrderListRespDto> OrderListRespDtos = mapList.map((e) => OrderListRespDto.fromJson(e)).toList();
      print('통과2');
      responseDto.data = OrderListRespDtos;
      print('통과3');
    }

    return responseDto;
  }

  Future<ResponseDto> fetchDelete(OrderCancelReqDto orderCancelReqDto, int orderId) async {
    Logger().d("토큰 : UserSession.jwtToken : ${UserSession.jwtToken}");
    print('가게id: ${StoreSession.storeId}');
    print('orderId: ${orderId}');
    print('상태: ${orderCancelReqDto.state}');
    print('사유: ${orderCancelReqDto.reason}');
    String requestBody = jsonEncode(orderCancelReqDto.toJson());
    print(requestBody);
    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/order/${orderId}/state", requestBody,
        jwtToken: UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("responseDto의 타입 ? : ${responseDto.data.runtimeType}");
    return responseDto;
  }

  fetchAcceptOrder(OrderAcceptReqDto orderAcceptReqDto, int orderId) async {
    Logger().d("토큰 : UserSession.jwtToken : ${UserSession.jwtToken}");
    print('가게id: ${StoreSession.storeId}');
    print('orderId: ${orderId}');
    print('상태: ${orderAcceptReqDto.state}');
    print('사유: ${orderAcceptReqDto.deliveryTime}');
    String requestBody = jsonEncode(orderAcceptReqDto.toJson());
    print(requestBody);

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/order/${orderId}/state", requestBody,
        jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

  fetchCompleteDelivery(DeliveryCompleteReqDto deliveryCompleteReqDto, orderId) async {
    Logger().d("토큰 : UserSession.jwtToken : ${UserSession.jwtToken}");
    String requestBody = jsonEncode(deliveryCompleteReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/order/${orderId}/state", requestBody,
        jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }
}
