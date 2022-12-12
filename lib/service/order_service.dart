import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/model/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';

class OrderService {
  final HttpConnector httpConnector = HttpConnector();

  static final OrderService _instance = OrderService._single();
  OrderService._single();

  factory OrderService() {
    return _instance;
  }

  Future<ResponseDto> fetchOrderList() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/1/order", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    print('메세지: ${responseDto.msg}');
    if (responseDto.msg == "주문 목록보기 완료") {
      print(responseDto.data);
      List<dynamic> mapList = responseDto.data; // dynamic
      List<OrderListRespDto> OrderListRespDtos = mapList.map((e) => OrderListRespDto.fromJson(e)).toList();
      responseDto.data = OrderListRespDtos;
    }

    return responseDto;
  }
}
