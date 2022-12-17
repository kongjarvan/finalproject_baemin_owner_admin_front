class LoginReqDto {
  final String username;
  final String password;

  LoginReqDto({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
