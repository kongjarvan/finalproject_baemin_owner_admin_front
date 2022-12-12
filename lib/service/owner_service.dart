import 'dart:convert';
import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/login_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/model/users.dart';
import 'package:baemin_owner_admin_front/service/local_service.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';

class OwnerService {
  final HttpConnector httpConnector = HttpConnector();

  static final OwnerService _instance = OwnerService._single();
  OwnerService._single();
  factory OwnerService() {
    return _instance;
  }

  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    String requestBody = jsonEncode(loginReqDto.toJson());

    Response response = await httpConnector.post("/login", requestBody);

    String jwtToken = response.headers["authorization"].toString();
    print('토큰:${jwtToken}');

    await secureStorage.write(key: "jwtToken", value: jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    Users user = Users.fromJson(responseDto.data);

    UserSession.successAuthentication(user, jwtToken);

    return responseDto;
  }
}
