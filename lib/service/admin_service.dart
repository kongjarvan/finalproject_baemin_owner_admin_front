import 'dart:convert';

import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/req/admin_accept_owner_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/admin_resolve_review_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/admin_register_owner_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/admin_reported_review_detail_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/admin_reported_review_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/admin_resolve_review_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class AdminService {
  final HttpConnector httpConnector = HttpConnector();

  static final AdminService _instance = AdminService._single();
  AdminService._single();

  factory AdminService() {
    return _instance;
  }

  Future<ResponseDto> fetchGetReportedReviewList() async {
    Response response = await httpConnector.getInitSession("/api/admin/review/report/list", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data['reportReviews'];
      List<AdminReportedReviewListRespDto> adminReportedReviewListRespDtos = mapList.map((e) => AdminReportedReviewListRespDto.fromJson(e)).toList();

      responseDto.data = adminReportedReviewListRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchAcceptOwner(AdminAcceptOwnerReqDto adminAcceptOwnerReqDto, int storeId) async {
    String requestBody = jsonEncode(adminAcceptOwnerReqDto.toJson());

    Response response = await httpConnector.put("/api/admin/store/$storeId/apply/accept", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);

    return responseDto;
  }

  Future<ResponseDto> fetchGetOwnerList() async {
    Response response = await httpConnector.getInitSession("/api/admin/store/apply/list", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<AdminRegisterOwnerListRespDto> adminRegisterOwnerListRespDtos = mapList.map((e) => AdminRegisterOwnerListRespDto.fromJson(e)).toList();

      responseDto.data = adminRegisterOwnerListRespDtos;
    }

    return responseDto;
  }

  fetchGetReportedReviewDetail(int reportReviewId) async {
    Response response = await httpConnector.getInitSession("/api/admin/review/$reportReviewId/report/detail", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      AdminReportedReviewDetailRespDto adminReportedReviewDetailRespDto = AdminReportedReviewDetailRespDto.fromJson(responseDto.data);
      responseDto.data = adminReportedReviewDetailRespDto;
    }

    return responseDto;
  }

  fetchResolveReview(AdminResolveReviewReqDto adminResolveReviewReqDto, int reportedReviewId) async {
    String requestBody = jsonEncode(adminResolveReviewReqDto.toJson());
    Response response = await httpConnector.put("/api/admin/review/$reportedReviewId/resolve", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      AdminResolveReviewRespDto adminResolveReviewRespDto = AdminResolveReviewRespDto.fromJson(responseDto.data);
      responseDto.data = adminResolveReviewRespDto;
    }

    return responseDto;
  }
}
