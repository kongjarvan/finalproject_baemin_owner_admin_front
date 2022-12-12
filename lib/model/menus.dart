import 'package:baemin_owner_admin_front/model/stores.dart';

class Menus {
  final int id;
  final String name;
  final String thumbnail;
  final String intro;
  final Stores stores;
  final int price;
  final String category;
  final bool isClosure;

  Menus({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.intro,
    required this.stores,
    required this.price,
    required this.category,
    required this.isClosure,
  });
}

List<Menus> menuList = [
  Menus(
    id: 1,
    name: '짜장면',
    thumbnail: '사진이 들어가야되넹',
    intro: '해병정신이 들어간 기합 넘치는 짜장면',
    stores: storeList[0],
    price: 7000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 2,
    name: '계란볶음밥',
    thumbnail: '사진이 들어가야되넹',
    intro: '계란은 없습니다.',
    stores: storeList[1],
    price: 8000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 3,
    name: '김치볶음밥',
    thumbnail: '사진이 들어가야되넹',
    intro: '김치는 없습니다.',
    stores: storeList[1],
    price: 8000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 4,
    name: '새우볶음밥',
    thumbnail: '사진이 들어가야되넹',
    intro: '새우는 없습니다.',
    stores: storeList[1],
    price: 8500,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 5,
    name: '양념치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '양념은 없습니다.',
    stores: storeList[2],
    price: 19000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 6,
    name: '간장치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '간장은 없습니다.',
    stores: storeList[2],
    price: 19000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 7,
    name: '후라이드치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '튀김옷은 없습니다.',
    stores: storeList[2],
    price: 18000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 8,
    name: '마늘치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '마늘은 없습니다.',
    stores: storeList[2],
    price: 19000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 9,
    name: '슈프림양념치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '양념은 없습니다.',
    stores: storeList[2],
    price: 20000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 10,
    name: '순살슈프림양념치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '뼈는 있습니다.',
    stores: storeList[2],
    price: 21000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 11,
    name: '순살뿌링클치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '뼈는 있습니다.',
    stores: storeList[2],
    price: 21000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 12,
    name: '뿌링클치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '치즈가루는 없습니다.',
    stores: storeList[2],
    price: 20000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 13,
    name: '양념치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '양념은 없습니다.',
    stores: storeList[2],
    price: 19000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 14,
    name: '간장치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '간장은 없습니다.',
    stores: storeList[2],
    price: 19000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 15,
    name: '후라이드치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '튀김옷은 없습니다.',
    stores: storeList[2],
    price: 18000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 16,
    name: '마늘치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '마늘은 없습니다.',
    stores: storeList[2],
    price: 19000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 17,
    name: '슈프림양념치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '양념은 없습니다.',
    stores: storeList[2],
    price: 20000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 18,
    name: '순살슈프림양념치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '뼈는 있습니다.',
    stores: storeList[2],
    price: 21000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 19,
    name: '순살뿌링클치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '뼈는 있습니다.',
    stores: storeList[2],
    price: 21000,
    category: '주식',
    isClosure: false,
  ),
  Menus(
    id: 20,
    name: '뿌링클치킨',
    thumbnail: '사진이 들어가야되넹',
    intro: '치즈가루는 없습니다.',
    stores: storeList[2],
    price: 20000,
    category: '주식',
    isClosure: false,
  ),
];
