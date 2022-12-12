import 'dart:convert';
import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/login_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:http/http.dart';

class OwnerService {
  final HttpConnector httpConnector = HttpConnector();

  static final OwnerService _instance = OwnerService._single();
  OwnerService._single();
  factory OwnerService() {
    return _instance;
  }

  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    print('============서비스 진입=============');
    print(loginReqDto.username);
    print(loginReqDto.password);
    String requestBody = jsonEncode(loginReqDto.toJson());
    Response response = await httpConnector.post("/login", requestBody);
    print('============서비스 진입=============');
    print(response.body);
    return toResponseDto(response); // ResponseDto 응답
  }
}
