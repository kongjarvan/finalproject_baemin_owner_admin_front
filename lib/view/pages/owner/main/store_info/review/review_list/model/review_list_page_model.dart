import 'package:baemin_owner_admin_front/dto/review_list_resp_dto.dart';

class ReviewListPageModel {
  // state
  List<ReviewListRespDto> reviewListRespDtos;
  int selectedIndex = 0;

  ReviewListPageModel(this.reviewListRespDtos, this.selectedIndex);
}
