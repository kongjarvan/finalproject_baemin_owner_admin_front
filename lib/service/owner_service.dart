import 'dart:convert';
import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/login_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/model/statistics_resp_dto.dart';
import 'package:baemin_owner_admin_front/model/update_store_resp_dto.dart';
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

  Future<ResponseDto> fetchGetStoreInfo() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/info", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      print('통과1');
      print(responseDto.data);
      List<UpdateStoreRespDto> updateStoreRespDtos = mapList.map((e) => UpdateStoreRespDto.fromJson(e)).toList();
      print('통과2');
      responseDto.data = updateStoreRespDtos;
      print('통과3');
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetStatistics() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/info/stats", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      print('통과1');
      print(responseDto.data);

      List<StatisticsRespDto> statisticsRespDtos = mapList.map((e) => StatisticsRespDto.fromJson(e)).toList();
      print('통과2');
      responseDto.data = statisticsRespDtos;
      print('통과3');
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetRegisterOwnerPage() async {
    // Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/info/stats", UserSession.jwtToken);
    //
    // ResponseDto responseDto = toResponseDto(response);
    // if (responseDto.code == 1) {
    //   List<dynamic> mapList = responseDto.data;
    //   print('통과1');
    //   print(responseDto.data);
    //
    //   List<StatisticsRespDto> statisticsRespDtos = mapList.map((e) => StatisticsRespDto.fromJson(e)).toList();
    //   print('통과2');
    //   responseDto.data = statisticsRespDtos;
    //   print('통과3');
    // }
    //
    // return responseDto;
    // 통신 필요 X
  }
}
