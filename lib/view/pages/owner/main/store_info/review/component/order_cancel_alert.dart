import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:flutter/material.dart';

class OrderCancelAlert extends StatefulWidget {
  const OrderCancelAlert({Key? key}) : super(key: key);

  @override
  State<OrderCancelAlert> createState() => _OrderCancelAlertState();
}

final _orderRefuseReasonList = ['기상악화', '재고소진', '기타'];
var _selectedOrderRefuseReason = '기상악화';

class _OrderCancelAlertState extends State<OrderCancelAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.only(left: 120, right: 120, top: 60),
      title: SizedBox(
        width: 300,
        child: Text(
          '주문을 거절할까요?',
          textAlign: TextAlign.center,
          style: TextStyle(color: kMainColor, fontSize: 32),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: kUnselectedListColor),
          ),
          child: DropdownButton(
            borderRadius: BorderRadius.circular(4),
            underline: Container(
              height: 0,
            ),
            isExpanded: true,
            value: _selectedOrderRefuseReason,
            items: _orderRefuseReasonList.map(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(value),
                  ),
                );
              },
            ).toList(),
            onChanged: (value) {
              setState(
                () {
                  _selectedOrderRefuseReason = value as String;
                },
              );
            },
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(gap_s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: kMainColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: gap_s),
                    child: Center(
                      child: Text(
                        '아니오',
                        style: TextStyle(
                          color: kMainColor,
                          fontSize: 20,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 240,
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: kMainColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: gap_s),
                    child: Center(
                      child: Text(
                        '네',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
