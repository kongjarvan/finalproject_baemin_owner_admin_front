class HideMenuReqDto {
  final bool closure;

  HideMenuReqDto({required this.closure});

  Map<String, dynamic> toJson() {
    return {
      "closure": closure,
    };
  }
}
