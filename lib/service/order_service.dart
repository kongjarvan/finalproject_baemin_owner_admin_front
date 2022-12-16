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
      List<OrderListRespDto> OrderListRespDtos = mapList.map((e) => OrderListRespDto.fromJson(e)).toList();
      responseDto.data = OrderListRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchDelete(OrderCancelReqDto orderCancelReqDto, int orderId) async {
    String requestBody = jsonEncode(orderCancelReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/order/${orderId}/state", requestBody,
        jwtToken: UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);

    return responseDto;
  }

  fetchAcceptOrder(OrderAcceptReqDto orderAcceptReqDto, int orderId) async {
    String requestBody = jsonEncode(orderAcceptReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/order/${orderId}/state", requestBody,
        jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

  fetchCompleteDelivery(DeliveryCompleteReqDto deliveryCompleteReqDto, orderId) async {
    String requestBody = jsonEncode(deliveryCompleteReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/order/${orderId}/state", requestBody,
        jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }
}
