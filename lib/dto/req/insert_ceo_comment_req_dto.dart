class InsertCeoCommentReqDto {
  final String content;

  InsertCeoCommentReqDto({required this.content});

  Map<String, dynamic> toJson() {
    return {
      "content": content,
    };
  }
}
