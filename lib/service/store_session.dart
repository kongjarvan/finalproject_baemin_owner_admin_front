import 'package:baemin_owner_admin_front/service/local_service.dart';
import 'package:logger/logger.dart';

class StoreSession {
  static int? _storeId;

  static get storeId => _storeId;

  static void successAuthentication(int storeId) {
    _storeId = storeId;
  }

  static Future<void> deleteStoreId(int storeId) async {
    _storeId = -1;
    Logger().d("세션 종료 및 디바이스 토큰 삭제");
  }
}
