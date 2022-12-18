import 'dart:convert';

import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/req/hide_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/insert_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/update_menu_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/insert_menu_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/menu_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/menu_detail_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/update_menu_resp_dto.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class MenuService {
  final HttpConnector httpConnector = HttpConnector();

  static final MenuService _instance = MenuService._single();
  MenuService._single();
  factory MenuService() {
    return _instance;
  }

  Future<ResponseDto> fetchGetMenuList() async {
    Logger().d('서비스 진입');
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/menu/list", UserSession.jwtToken);
    Logger().d('response body: ${response.body}');
    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      Logger().d('매핑시작');
      List<MenuListRespDto> menuListRespDtos = mapList.map((e) => MenuListRespDto.fromJson(e)).toList();
      responseDto.data = menuListRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetMenuDetail(int menuId) async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/menu/$menuId/info", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      responseDto.data = MenuDetailRespDto.fromJson(responseDto.data);
    }

    return responseDto;
  }

  Future<ResponseDto> fetchHideMenu(HideMenuReqDto hideMenuReqDto, int menuId) async {
    String requestBody = jsonEncode(hideMenuReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/menu/$menuId/update/state", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    return responseDto;
  }

  fetchInsertMenu(InsertMenuReqDto insertMenuReqDto) async {
    String requestBody = jsonEncode(insertMenuReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/menu/save", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      responseDto.data = InsertMenuRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }

  fetchUpdateMenu(UpdateMenuReqDto updateMenuReqDto, int menuId) async {
    String requestBody = jsonEncode(updateMenuReqDto.toJson());

    Response response = await httpConnector.put("/api/user/${UserSession.user.id}/store/menu/$menuId/update", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      responseDto.data = UpdateMenuRespDto.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
