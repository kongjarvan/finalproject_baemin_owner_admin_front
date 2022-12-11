import 'package:intl/intl.dart';

String numberPriceFormat(String price) {
  final formatter = NumberFormat("##,### 원");
  return formatter.format(int.parse(price));
}

String dateFormat(DateTime dateTime) {
  final formatter = DateFormat("yyyy-MM-dd H:mm");
  return formatter.format(dateTime);
}
