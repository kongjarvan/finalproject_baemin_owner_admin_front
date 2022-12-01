import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/menu_list/menu_list_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/order_detail/order_detail_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/review_list/review_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DeliveryStatus extends StatefulWidget {
  const DeliveryStatus({Key? key}) : super(key: key);

  @override
  State<DeliveryStatus> createState() => _DeliveryStatusState();
}

class _DeliveryStatusState extends State<DeliveryStatus> {
  var _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Container(
            color: kMenuBarMainColor,
            child: SizedBox(
              width: 232,
              child: Column(
                children: [
                  Divider(thickness: 2, height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: gap_s, horizontal: gap_m),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDeliveryOptionCheck('배달'),
                        _buildDeliveryOptionCheck('포장'),
                      ],
                    ),
                  ),
                  Divider(thickness: 2, height: 2),
                  _buildDeliveryStatus(),
                  Divider(thickness: 2, height: 2),
                  Expanded(
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        children: [
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                          _buildOrderInfo('배달2', 15),
                          _buildOrderInfo('배달1', 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: OrderDetailPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInfo(orderName, menuCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: gap_s, horizontal: gap_m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailPage(),
                ),
              );
            },
            child: Text(
              '${orderName}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '메뉴 ${menuCount}개',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 18,
                ),
              ),
              SizedBox(width: gap_s),
              InkWell(
                onTap: () {},
                child: Text(
                  '취소',
                  style: TextStyle(
                    color: kButtonSubColor,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildDeliveryStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: gap_s,
        horizontal: gap_m,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '완료 0건',
            style: TextStyle(
              color: kMainColor,
              fontSize: 22,
            ),
          ),
          Text(
            '취소 0건',
            style: TextStyle(
              color: kButtonSubColor,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryOptionCheck(text) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          activeColor: kMainColor,
          checkColor: Colors.white,
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
        ),
        Text(
          '${text}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            height: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoMenu1(text) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: InkWell(
              onTap: () {},
              child: Text(
                textAlign: TextAlign.end,
                '${text}',
                style: textTheme().headline3,
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(gap_xs),
                  child: Icon(
                    CupertinoIcons.chevron_down,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoMenu2(text) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewListPage(),
                    ));
              },
              child: Text(
                textAlign: TextAlign.end,
                '${text}',
                style: TextStyle(
                  color: kMenuIconColor,
                ),
              ),
            ),
          ),
          SizedBox(width: 120),
        ],
      ),
    );
  }
}
