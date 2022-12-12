import 'package:baemin_owner_admin_front/core/http_connector.dart';

class ReviewService {
  final HttpConnector httpConnector = HttpConnector();

  static final ReviewService _instance = ReviewService._single();
  ReviewService._single();
  factory ReviewService() {
    return _instance;
  }
}
