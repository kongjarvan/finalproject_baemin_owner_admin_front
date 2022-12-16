import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/resp/menu_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/update_menu_resp_dto.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';

class MenuService {
  final HttpConnector httpConnector = HttpConnector();

  static final MenuService _instance = MenuService._single();
  MenuService._single();
  factory MenuService() {
    return _instance;
  }

  Future<ResponseDto> fetchGetMenuList() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/menu/list", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<MenuListRespDto> menuListRespDtos = mapList.map((e) => MenuListRespDto.fromJson(e)).toList();
      responseDto.data = menuListRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetMenuDetail() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/menu/1/info", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<UpdateMenuRespDto> updateMenuRespDtos = mapList.map((e) => UpdateMenuRespDto.fromJson(e)).toList();
      responseDto.data = updateMenuRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetInsertMenu() async {
    Response response = await httpConnector.getInitSession("", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<UpdateMenuRespDto> updateMenuRespDtos = mapList.map((e) => UpdateMenuRespDto.fromJson(e)).toList();
      responseDto.data = updateMenuRespDtos;
    }

    return responseDto;
  }
}
