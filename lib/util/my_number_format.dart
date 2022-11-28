import 'package:intl/intl.dart';

String numberPriceFormat(String price) {
  final formatter = NumberFormat("#,###원");
  return formatter.format(int.parse(price));
}
