List<String> timeList() {
  List<String> list = [];
  for (int i = 0; i < 24; i++) {
    String time = '${i}시';
    list.add(time);
  }
  return list;
}
