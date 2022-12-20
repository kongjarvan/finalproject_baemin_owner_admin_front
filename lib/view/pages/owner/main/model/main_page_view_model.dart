import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/model/main_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final mainPageViewModel = StateNotifierProvider.autoDispose<MainPageViewModel, MainPageModel?>((ref) {
  return MainPageViewModel(null)..closeStore();
});

class MainPageViewModel extends StateNotifier<MainPageModel?> {
  final OwnerService ownerService = OwnerService();
  final mContext = navigatorKey.currentContext;

  MainPageViewModel(super.state);

  Future<void> closeStore() async {
    MainPageModel mainPageModel = MainPageModel(false);
    state = MainPageModel(mainPageModel.isOpened);
  }

  Future<void> openStore() async {
    MainPageModel mainPageModel = MainPageModel(true);
    state = MainPageModel(mainPageModel.isOpened);
  }
}
