import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/model/menu_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/model/update_menu_resp_dto.dart';
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
      print('통과1');
      print(responseDto.data);
      List<MenuListRespDto> menuListRespDtos = mapList.map((e) => MenuListRespDto.fromJson(e)).toList();
      print('통과2');
      responseDto.data = menuListRespDtos;
      print('통과3');
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetMenuDetail() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/menu/1/info", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      print('통과1');
      print(responseDto.data);
      List<UpdateMenuRespDto> updateMenuRespDtos = mapList.map((e) => UpdateMenuRespDto.fromJson(e)).toList();
      print('통과2');
      responseDto.data = updateMenuRespDtos;
      print('통과3');
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetInsertMenu() async {
    Response response = await httpConnector.getInitSession("", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      print('통과1');
      print(responseDto.data);
      List<UpdateMenuRespDto> updateMenuRespDtos = mapList.map((e) => UpdateMenuRespDto.fromJson(e)).toList();
      print('통과2');
      responseDto.data = updateMenuRespDtos;
      print('통과3');
    }

    return responseDto;
  }
}
