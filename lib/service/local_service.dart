import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/model/user_session.dart';
import 'package:baemin_owner_admin_front/model/users.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

const secureStorage = FlutterSecureStorage();

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single();
  LocalService._single();
  factory LocalService() {
    Logger().d("LocalRepository 생성자");
    return _instance;
  }

  Future<void> fetchJwtToken() async {
    Logger().d("jwt init");
    String? deviceJwtToken = await secureStorage.read(key: "jwtToken");
    if (deviceJwtToken != null) {
      Response response = await httpConnector.getInitSession("/jwtToken", deviceJwtToken);
      ResponseDto responseDto = toResponseDto(response);

      if (responseDto.msg == "로그인 성공") {
        Users users = Users.fromJson(responseDto.data);
        UserSession.successAuthentication(users, deviceJwtToken);
      } else {
        Logger().d("토큰이 만료됨");
        UserSession.removeAuthentication();
      }
    }
  }

  Future<void> fetchDeleteJwtToken() async {
    Logger().d("jwt remove");
    await secureStorage.delete(key: "jwtToken");
  }
}