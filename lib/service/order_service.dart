import 'package:baemin_owner_admin_front/core/http_connector.dart';

class OrderService {
  final HttpConnector httpConnector = HttpConnector();

  static final OrderService _instance = OrderService._single();
  OrderService._single();
  factory OrderService() {
    return _instance;
  }
}
