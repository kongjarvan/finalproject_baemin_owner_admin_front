import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getBodyHeight(context) * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.green,
            ),
          ),
          SizedBox(height: gap_s),
          Text('주문번호: ', style: TextStyle(fontSize: 20)),
          SizedBox(height: gap_s),
          Text('구매일자: ', style: textTheme().bodyText2),
          SizedBox(height: gap_s),
          Text('공개여부: ', style: textTheme().bodyText2),
        ],
      ),
    );
  }
}
