import 'dart:convert';

import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/req/insert_ceo_comment_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/report_review_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/insert_ceo_comment_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/report_review_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/reported_review_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/dto/resp/review_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/service/store_session.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ReviewService {
  final HttpConnector httpConnector = HttpConnector();

  static final ReviewService _instance = ReviewService._single();
  ReviewService._single();
  factory ReviewService() {
    return _instance;
  }

  Future<ResponseDto> fetchGetReviewList() async {
    Response response =
        await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/review", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<ReviewListRespDto> reviewListRespDtos = mapList.map((e) => ReviewListRespDto.fromJson(e)).toList();
      responseDto.data = reviewListRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetReportedReviewList() async {
    Response response =
        await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/${StoreSession.storeId}/review/report", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<ReportedReviewListRespDto> reportedReviewListRespDtos = mapList.map((e) => ReportedReviewListRespDto.fromJson(e)).toList();
      responseDto.data = reportedReviewListRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchInsertCeoComment(InsertCeoCommentReqDto insertCeoCommentReqDto, int reviewId) async {
    String requestBody = jsonEncode(insertCeoCommentReqDto.toJson());
    Response response =
        await httpConnector.post("/api/user/${UserSession.user.id}/store/${reviewId}/review", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      InsertCeoCommentRespDto insertCeoCommentRespDto = InsertCeoCommentRespDto.fromJson(responseDto.data);
      responseDto.data = insertCeoCommentRespDto;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchReportReview(ReportReviewReqDto reportReviewReqDto, int reviewId) async {
    String requestBody = jsonEncode(reportReviewReqDto.toJson());
    Response response =
        await httpConnector.post("/api/user/${UserSession.user.id}/store/review/${reviewId}/report", requestBody, jwtToken: UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      ReportReviewRespDto reportReviewRespDto = ReportReviewRespDto.fromJson(responseDto.data);
      responseDto.data = reportReviewRespDto;
    }

    return responseDto;
  }
}
