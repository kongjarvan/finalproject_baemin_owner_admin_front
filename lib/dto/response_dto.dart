class ResponseDto {
  final String? msg;
  dynamic data; // JsonArray [], JsonObject {}

  ResponseDto({
    this.msg,
    this.data,
  });

  ResponseDto.fromJson(Map<String, dynamic> json)
      : msg = json["msg"],
        data = json["data"];
}
