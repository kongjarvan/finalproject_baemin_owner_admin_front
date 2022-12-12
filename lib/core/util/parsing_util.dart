import 'dart:convert';

import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:http/http.dart';

ResponseDto toResponseDto(Response response) {
  Map<String, dynamic> responseMap = jsonDecode(utf8.decode(response.bodyBytes)); // 문자열 -> Map
  print('여기는 오는지?');

  ResponseDto responseDto = ResponseDto.fromJson(responseMap); // Map -> Dart Class

  return responseDto;
}
