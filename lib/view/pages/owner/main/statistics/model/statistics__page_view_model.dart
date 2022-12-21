import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/req/statistics_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/owner_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/statistics/model/statistics_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statisticsPageViewModel = StateNotifierProvider.autoDispose<StatisticsPageViewModel, StatisticsPageModel?>((ref) {
  return StatisticsPageViewModel(null);
});

class StatisticsPageViewModel extends StateNotifier<StatisticsPageModel?> {
  final OwnerService ownerService = OwnerService();
  final mContext = navigatorKey.currentContext;

  StatisticsPageViewModel(super.state);

  Future<void> notifyViewModel(StatisticsReqDto statisticsReqDto) async {
    ResponseDto responseDto = await ownerService.fetchGetStatistics(statisticsReqDto);
    if (responseDto.code == 1) {
      state = StatisticsPageModel(responseDto.data);
    }
  }
}
