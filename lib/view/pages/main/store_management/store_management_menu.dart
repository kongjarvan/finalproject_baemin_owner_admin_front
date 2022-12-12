import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/component/order_cancel_alert.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/main_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/main_page_view_model.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/order_detail/order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class StoreManagementMenu extends ConsumerStatefulWidget {
  final model;
  const StoreManagementMenu({required this.model, Key? key}) : super(key: key);

  @override
  ConsumerState<StoreManagementMenu> createState() => _StoreManagementMenuState();
}

class _StoreManagementMenuState extends ConsumerState<StoreManagementMenu> {
  List<bool> _isChecked = [false, false];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Logger().d("주문목록페이지 빌드");

    var index = 0;

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
                        _buildDeliveryOptionCheck('배달', 0),
                        _buildDeliveryOptionCheck('포장', 1),
                      ],
                    ),
                  ),
                  Divider(thickness: 2, height: 2),
                  _buildDeliveryStatus(),
                  Divider(thickness: 2, height: 2),
                  Expanded(
                    child: RawScrollbar(
                      thumbColor: kMainColor,
                      radius: Radius.circular(5),
                      controller: _scrollController,
                      thickness: 10,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.vertical,
                        primary: false,
                        child: Column(
                          children: List.generate(widget.model.orderListRespDtos.length, (index) {
                            return _buildOrderInfo(widget.model.orderListRespDtos[index].id, widget.model.orderListRespDtos[index].orderList!.length);
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: OrderDetailPage(orderId: '여무'),
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
              setState(() {});
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) => OrderCancelAlert(deliveryTitle: orderName),
                    ),
                  );
                },
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

  Widget _buildDeliveryOptionCheck(text, index) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          activeColor: kMainColor,
          checkColor: Colors.white,
          value: _isChecked[index],
          onChanged: (value) {
            setState(() {
              _isChecked[index] = value!;
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
}
