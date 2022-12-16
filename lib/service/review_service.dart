import 'package:baemin_owner_admin_front/core/http_connector.dart';
import 'package:baemin_owner_admin_front/core/util/parsing_util.dart';
import 'package:baemin_owner_admin_front/dto/reported_review_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/dto/review_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:http/http.dart';

class ReviewService {
  final HttpConnector httpConnector = HttpConnector();

  static final ReviewService _instance = ReviewService._single();
  ReviewService._single();
  factory ReviewService() {
    return _instance;
  }

  Future<ResponseDto> fetchGetReviewList() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/1/review", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<ReviewListRespDto> reviewListRespDtos = mapList.map((e) => ReviewListRespDto.fromJson(e)).toList();
      responseDto.data = reviewListRespDtos;
    }

    return responseDto;
  }

  Future<ResponseDto> fetchGetReportedReviewList() async {
    Response response = await httpConnector.getInitSession("/api/user/${UserSession.user.id}/store/1/review/report", UserSession.jwtToken);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      List<dynamic> mapList = responseDto.data;
      List<ReportedReviewListRespDto> reportedReviewListRespDtos = mapList.map((e) => ReportedReviewListRespDto.fromJson(e)).toList();
      responseDto.data = reportedReviewListRespDtos;
    }

    return responseDto;
  }
}
