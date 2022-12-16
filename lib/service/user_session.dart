import 'package:baemin_owner_admin_front/dto/users_dto.dart';
import 'package:baemin_owner_admin_front/service/local_service.dart';
import 'package:logger/logger.dart';

// main 시작전에 확인이 필요해서 provider가 아닌 static으로 관리
class UserSession {
  static Users? _user;
  static String? _jwtToken;
  static bool _isLogin = false;

  static get user => _user;
  static get jwtToken => _jwtToken;
  static get isLogin => _isLogin;

  static void successAuthentication(Users userParam, String jwtToken) {
    _user = userParam;
    _isLogin = true;
    _jwtToken = jwtToken;
  }

  static Future<void> removeAuthentication() async {
    _user = null;
    _jwtToken = null;
    _isLogin = false;
    await LocalService().fetchDeleteJwtToken();
  }
}
