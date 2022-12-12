import 'package:baemin_owner_admin_front/model/users.dart';
import 'package:baemin_owner_admin_front/service/local_service.dart';
import 'package:logger/logger.dart';

class UserSession {
  static Users? _users;
  static String? _jwtToken;
  static bool _isLogin = false;

  static get user => _users;
  static get jwtToken => _jwtToken;
  static get isLogin => _isLogin;

  static void successAuthentication(Users userParam, String jwtToken) {
    _users = userParam;
    _isLogin = true;
    _jwtToken = jwtToken;
  }

  static Future<void> removeAuthentication() async {
    _users = null;
    _jwtToken = null;
    _isLogin = false;
    await LocalService().fetchDeleteJwtToken();
    Logger().d("세션 종료 및 디바이스 토큰 삭제");
  }

  static Map<String, String> getJwtTokenHeader(Map<String, String> headers) {
    return UserSession._jwtToken == null ? headers : {...headers, "Authorization": UserSession._jwtToken!};
  }
}