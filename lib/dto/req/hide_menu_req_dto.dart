class HideMenuReqDto {
  final bool Closure;

  HideMenuReqDto({required this.Closure});

  Map<String, dynamic> toJson() {
    return {
      "Closure": Closure,
    };
  }
}
