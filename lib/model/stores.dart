import 'package:baemin_owner_admin_front/model/users.dart';

class Stores {
  final int id;
  final String category;
  final String name;
  final String phone;
  final String thumbnail;
  final String ceoName;
  final String businessNumber;
  final String businessAddress;
  final String openTime;
  final String closeTime;
  final int minAmount;
  final String deliveryHour;
  final int deliveryCost;
  final String intro;
  final String notice;
  final bool isOpend;
  final bool isAccept;
  final bool isClosure;
  final String createdAt;
  final Users user;

  Stores(
      this.id,
      this.category,
      this.name,
      this.phone,
      this.thumbnail,
      this.ceoName,
      this.businessNumber,
      this.businessAddress,
      this.openTime,
      this.closeTime,
      this.minAmount,
      this.deliveryHour,
      this.deliveryCost,
      this.intro,
      this.notice,
      this.isOpend,
      this.isAccept,
      this.isClosure,
      this.createdAt,
      this.user);
}
