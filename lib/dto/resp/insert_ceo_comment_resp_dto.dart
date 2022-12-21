class InsertCeoCommentRespDto {
  final String content;

  InsertCeoCommentRespDto({required this.content});

  factory InsertCeoCommentRespDto.fromJson(Map<String, dynamic> json) => InsertCeoCommentRespDto(
        content: json["content"],
      );
}
