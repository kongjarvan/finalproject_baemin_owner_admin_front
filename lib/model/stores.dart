import 'package:baemin_owner_admin_front/model/users.dart';

class Stores {
  final int id;
  final Users users;
  final String category;
  final String name;
  final String phone;
  final String thumbnail;
  final String ownerName;
  final String businessNumber;
  final String businessAddress;
  final DateTime openTime;
  final DateTime closeTime;
  final String minAmount;
  final String deliveryHour;
  final String deliveryCost;
  final String intro;
  final String notice;
  final bool isOpened;
  final bool isAccept;

  Stores({
    required this.id,
    required this.users,
    required this.category,
    required this.name,
    required this.phone,
    required this.thumbnail,
    required this.ownerName,
    required this.businessNumber,
    required this.businessAddress,
    required this.openTime,
    required this.closeTime,
    required this.minAmount,
    required this.deliveryHour,
    required this.deliveryCost,
    required this.intro,
    required this.notice,
    required this.isOpened,
    required this.isAccept,
  });
}

List<Stores> storeList = [
  Stores(
    id: 1,
    users: userList[0],
    category: '중식',
    name: '오도관',
    phone: '010-1234-5678',
    thumbnail: '사진넣어주세용',
    ownerName: '마철두',
    businessNumber: '1234-5678-99',
    businessAddress: '부산시 수영구 어디어디',
    openTime: DateTime.now(),
    closeTime: DateTime.now(),
    minAmount: '13000원',
    deliveryHour: '30분',
    deliveryCost: '2000원',
    intro: '악!',
    notice: '악!',
    isOpened: true,
    isAccept: true,
  ),
  Stores(
    id: 2,
    users: userList[1],
    category: '분식',
    name: '볶음밥집',
    phone: '010-1221-3365',
    thumbnail: '사진넣어주세용',
    ownerName: '김김김',
    businessNumber: '1364-5611-94',
    businessAddress: '부산시 부산진구 어디어디',
    openTime: DateTime.now(),
    closeTime: DateTime.now(),
    minAmount: '11000원',
    deliveryHour: '50분',
    deliveryCost: '3000원',
    intro: '볶진 않았습니다.',
    notice: '볶진 않았습니다.',
    isOpened: true,
    isAccept: true,
  ),
  Stores(
    id: 3,
    users: userList[2],
    category: '철민이 세마리 치킨',
    name: '치킨',
    phone: '010-3312-9496',
    thumbnail: '사진넣어주세용',
    ownerName: '김철민',
    businessNumber: '8546-5723-12',
    businessAddress: '김해시 랄로동 어디어디',
    openTime: DateTime.now(),
    closeTime: DateTime.now(),
    minAmount: '15000원',
    deliveryHour: '40분',
    deliveryCost: '3000원',
    intro: '닭은 쓰지 않았습니다.',
    notice: '닭은 쓰지 않았습니다.',
    isOpened: true,
    isAccept: true,
  ),
];
