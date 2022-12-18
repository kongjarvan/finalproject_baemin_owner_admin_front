import 'package:intl/intl.dart';

class Users {
  final int id;
  final String role;
  final String nickname;
  final DateTime createdAt;

  Users({
    required this.id,
    required this.role,
    required this.nickname,
    required this.createdAt,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
  Map<String, dynamic> toJson() => {"id": id, "role": role, "nickname": nickname, "createdAt": createdAt};

  Users.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        role = json["role"],
        nickname = json["nickname"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]);
}
