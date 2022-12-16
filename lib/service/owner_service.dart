import 'dart:convert';
import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/get_store_info_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/login_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/register_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/register_store_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/store_check_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/update_store_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/register_store_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/update_store_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/dto/statistics_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/get_update_store_info_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/users_dto.dart';
import 'package:baemin_owner_admin_front/service/local_service.dart';
import 'package:baemin_owner_admin_front/service/store_session.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

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

    await secureStorage.write(key: "jwtToken", value: jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.code == 1) {
      Users user = Users.fromJson(responseDto.data);
      UserSession.successAuthentication(user, jwtToken);
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetUpdateStoreInfo() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/info", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      GetUpdateStoreInfoRespDto updateStoreRespDto = GetUpdateStoreInfoRespDto.fromJson(responseDto.data);
      responseDto.data = updateStoreRespDto;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetStatistics() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/info/stats", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;

      List<StatisticsRespDto> statisticsRespDtos = mapList.map((e) => StatisticsRespDto.fromJson(e)).toList();
      responseDto.data = statisticsRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchInsertOwner(RegisterOwnerReqDto registerOwnerReqDto) async {
    String requestBody = jsonEncode(registerOwnerReqDto.toJson());

    Response response = await httpConnector.post("/api/user/${UserSession.user.id}/store/apply", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

  Future<ResponseDto> fetchGetUserState() async {
    Response response = await httpConnector.get("/api/user/${UserSession.user.id}/store/name", jwtToken: UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    responseDto.data = StoreCheckDto.fromJson(responseDto.data);
    StoreSession.successAuthentication(responseDto.data.storeId);
    return responseDto;
  }

  Future<ResponseDto> fetchGetInsertStoreInfo() async {
    Response response = await httpConnector.get("/api/user/${UserSession.user.id}/store/save/info", jwtToken: UserSession.jwtToken);
    ResponseDto responseDto = toResponseDto(response);
    responseDto.data = GetStoreInfoRespDto.fromJson(responseDto.data);
    return responseDto;
  }

  Future<ResponseDto> fetchInsertStore(RegisterStoreReqDto registerStoreReqDto) async {
    String requestBody = jsonEncode(registerStoreReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/save", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    responseDto.data = RegisterStoreRespDto.fromJson(responseDto.data);

    return responseDto;
  }

  Future<ResponseDto> fetchUpdateStore(UpdateStoreReqDto updateStoreReqDto) async {
    String requestBody = jsonEncode(updateStoreReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/update", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    responseDto.data = UpdateStoreRespDto.fromJson(responseDto.data);

    return responseDto;
  }
}
