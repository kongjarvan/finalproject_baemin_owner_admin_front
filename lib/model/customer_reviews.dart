import 'package:baemin_owner_admin_front/dto/resp/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/users_dto.dart';
import 'package:baemin_owner_admin_front/model/ceo_reviews.dart';
import 'package:baemin_owner_admin_front/model/stores.dart';

class CustomerReviews {
  final int id;
  final String content;
  final double starPoint;
  final String photo;
  final bool isClosure;
  final Users user;
  final Stores store;
  final Orders order;
  final String createdAt;
  final CeoReviews ceoReview;

  CustomerReviews(
    this.id,
    this.content,
    this.starPoint,
    this.photo,
    this.isClosure,
    this.user,
    this.store,
    this.order,
    this.createdAt,
    this.ceoReview,
  );
}
