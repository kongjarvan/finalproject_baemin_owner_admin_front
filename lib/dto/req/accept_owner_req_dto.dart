class AcceptOwnerReqDto {
  final bool accept;

  AcceptOwnerReqDto(this.accept);

  Map<String, dynamic> toJson() {
    return {
      "accept": accept,
    };
  }
}
