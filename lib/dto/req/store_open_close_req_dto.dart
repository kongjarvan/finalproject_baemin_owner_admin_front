class StoreOpenCloseReqDto {
  final bool isOpend;

  StoreOpenCloseReqDto({required this.isOpend});

  Map<String, dynamic> toJson() => {
        "isOpend": isOpend,
      };
}
