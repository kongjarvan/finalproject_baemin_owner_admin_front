class StatisticsReqDto {
  final String startTime;
  final String endTime;

  StatisticsReqDto({required this.startTime, required this.endTime});

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
      };
}
