import 'dart:convert';
import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/core/util/time_list.dart';
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
    print('토큰:${jwtToken}');

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
    print('가게정보 응답데이터: ${responseDto.data}');
    if (responseDto.code == 1) {
      GetUpdateStoreInfoRespDto updateStoreRespDto = GetUpdateStoreInfoRespDto.fromJson(responseDto.data);
      print('가게정보 RespDto: ${responseDto.data}');
      responseDto.data = updateStoreRespDto;
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

  Future<ResponseDto> fetchInsertOwner(RegisterOwnerReqDto registerOwnerReqDto) async {
    Logger().d("토큰 : UserSession.jwtToken : ${UserSession.jwtToken}");
    String requestBody = jsonEncode(registerOwnerReqDto.toJson());

    Response response = await httpConnector.post("/api/user/${UserSession.user.id}/store/apply", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

  Future<ResponseDto> fetchGetUserState() async {
    Logger().d("토큰 : UserSession.jwtToken : ${UserSession.jwtToken}");

    Response response = await httpConnector.get("/api/user/${UserSession.user.id}/store/name", jwtToken: UserSession.jwtToken);
    print('1');
    ResponseDto responseDto = toResponseDto(response);
    print('2: ${responseDto.data}');
    responseDto.data = StoreCheckDto.fromJson(responseDto.data);
    print('3');
    StoreSession.successAuthentication(responseDto.data.storeId);
    print('4');
    return responseDto;
  }

  Future<ResponseDto> fetchGetInsertStoreInfo() async {
    Logger().d("토큰 : UserSession.jwtToken : ${UserSession.jwtToken}");

    Response response = await httpConnector.get("/api/user/${UserSession.user.id}/store/save/info", jwtToken: UserSession.jwtToken);
    print('이거냐: ${response.body}');
    ResponseDto responseDto = toResponseDto(response);
    print('이거냐2: ${responseDto.data}');
    responseDto.data = GetStoreInfoRespDto.fromJson(responseDto.data);
    print('이거냐3');
    return responseDto;
  }

  Future<ResponseDto> fetchInsertStore(RegisterStoreReqDto registerStoreReqDto) async {
    Logger().d("토큰 : UserSession.jwtToken : ${UserSession.jwtToken}");
    String requestBody = jsonEncode(registerStoreReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/save", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    responseDto.data = RegisterStoreRespDto.fromJson(responseDto.data);
    return responseDto;
  }

  Future<ResponseDto> fetchUpdateStore(UpdateStoreReqDto updateStoreReqDto) async {
    Logger().d("updateStore : ${UserSession.jwtToken}");
    String requestBody = jsonEncode(updateStoreReqDto.toJson());
    print('1');
    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/update", requestBody, jwtToken: UserSession.jwtToken);
    print(response.body);
    ResponseDto responseDto = toResponseDto(response);
    print('3');
    responseDto.data = UpdateStoreRespDto.fromJson(responseDto.data);
    return responseDto;
  }
}
