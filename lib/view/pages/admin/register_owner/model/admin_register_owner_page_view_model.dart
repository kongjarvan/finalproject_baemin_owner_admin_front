import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/resp/response_dto.dart';
import 'package:baemin_owner_admin_front/service/admin_service.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/register_owner/model/admin_register_owner_page_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminRegisterOwnerPageViewModel = StateNotifierProvider.autoDispose<AdminRegisterOwnerPageViewModel, AdminRegisterOwnerPageModel?>((ref) {
  return AdminRegisterOwnerPageViewModel(null)..notifyViewModel();
});

class AdminRegisterOwnerPageViewModel extends StateNotifier<AdminRegisterOwnerPageModel?> {
  final AdminService adminService = AdminService();
  final mContext = navigatorKey.currentContext;

  AdminRegisterOwnerPageViewModel(super.state);

  Future<void> notifyViewModel() async {
    ResponseDto responseDto = await adminService.fetchGetOwnerList();
    if (responseDto.code == 1) {
      state = AdminRegisterOwnerPageModel(responseDto.data);
    }
  }
}
