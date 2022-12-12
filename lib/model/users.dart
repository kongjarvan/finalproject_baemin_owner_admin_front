class Users {
  final int id;
  final String deliveryAddress;
  final String username;
  final String password;
  final String nickname;
  final String phone;
  final String role;

  Users({
    required this.id,
    required this.deliveryAddress,
    required this.username,
    required this.password,
    required this.nickname,
    required this.phone,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "deliveryAddress": deliveryAddress,
        "username": username,
        "password": password,
        "nickname": nickname,
        "phone": phone,
        "role": role,
      };

  Users.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        deliveryAddress = json["deliveryAddress"],
        username = json["username"],
        password = json["password"],
        nickname = json["nickname"],
        phone = json["phone"],
        role = json["role"];
}

List<Users> userList = [
  Users(
    id: 1,
    deliveryAddress: '부산시 수영구 어디어디',
    username: 'marine69',
    password: 'asdf',
    nickname: '기합쟁이',
    phone: '010-1234-5678',
    role: '사장님',
  ),
  Users(
    id: 2,
    deliveryAddress: '부산시 부산진구 어디어디',
    username: '3kim',
    password: 'asdf',
    nickname: '3김',
    phone: '010-4356-2131',
    role: '사장님',
  ),
  Users(
    id: 3,
    deliveryAddress: '김해시 랄로동 어디어디',
    username: 'cmkim',
    password: 'asdf',
    nickname: '철민킴',
    phone: '010-6789-9786',
    role: '사장님',
  ),
];
