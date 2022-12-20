class AdminAcceptOwnerReqDto {
  final bool accept;

  AdminAcceptOwnerReqDto(this.accept);

  Map<String, dynamic> toJson() {
    return {
      "accept": accept,
    };
  }
}
