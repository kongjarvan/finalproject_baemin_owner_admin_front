import 'package:baemin_owner_admin_front/core/http_connector.dart';

class MenuService {
  final HttpConnector httpConnector = HttpConnector();

  static final MenuService _instance = MenuService._single();
  MenuService._single();
  factory MenuService() {
    return _instance;
  }
}
