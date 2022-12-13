import 'package:intl/intl.dart';

String numberPriceFormat(String price) {
  final formatter = NumberFormat("##,### 원");
  return formatter.format(int.parse(price));
}

String dateFormat(String dateTime) {
  final formatter = DateFormat("yyyy-MM-dd H:mm");
  return formatter.format(DateTime.parse(dateTime));
}
