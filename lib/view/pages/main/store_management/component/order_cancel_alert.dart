import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:flutter/material.dart';

class OrderCancelAlert extends StatefulWidget {
  final deliveryTitle;
  const OrderCancelAlert({required this.deliveryTitle, Key? key}) : super(key: key);

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
                  print(_selectedOrderRefuseReason);
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

                  ScaffoldMessenger.of(context).showSnackBar(
                    //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨.
                    SnackBar(
                      backgroundColor: Color(0x996D62E8),
                      content: Text('주문이 거절되었습니다. (${widget.deliveryTitle})'), //snack bar의 내용. icon, button같은것도 가능하다.
                      duration: Duration(seconds: 3), //올라와있는 시간
                      action: SnackBarAction(
                        //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
                        label: '확인',
                        textColor: kWhiteColor, //버튼이름
                        onPressed: () {}, //버튼 눌렀을때.
                      ),
                    ),
                  );
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
