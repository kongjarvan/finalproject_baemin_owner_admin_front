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
}
