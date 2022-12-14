import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/order_controller.dart';
import 'package:baemin_owner_admin_front/core/util/my_format.dart';
import 'package:baemin_owner_admin_front/dto/order_list_resp_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/delivery_complete_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/order_accept_req_dto.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/component/order_cancel_alert.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/order_list_page_model.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_management/model/order_list_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class OrderDetailPage extends ConsumerStatefulWidget {
  final OrderListPageModel model;
  final Function fun;
  const OrderDetailPage({required this.model, required this.fun, Key? key}) : super(key: key);

  @override
  ConsumerState<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends ConsumerState<OrderDetailPage> {
  final _deliveryTimeList = ['20분', '30분', '40분', '50분', '60분', '70분', '80분'];
  var _selectedDeliveryTime = '60분';

  final ScrollController _scrollController = ScrollController();

  int totalCount() {
    int totalCount = 0;
    int temp = widget.model.selectedIndex;
    for (int i = 0; i < widget.model.orderListRespDtos[temp].orderList!.length; i++) {
      List<Orders> list = widget.model.orderListRespDtos[temp].orderList!;
      totalCount = totalCount + list[i].count;
    }
    return totalCount;
  }

  int totalPrice() {
    int totalPrice = 0;
    int temp = widget.model.selectedIndex;
    for (int i = 0; i < widget.model.orderListRespDtos[temp].orderList!.length; i++) {
      totalPrice = totalPrice + widget.model.orderListRespDtos[temp].orderList![i].price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    OrderListPageModel? orderModel = ref.watch(mainPageViewModel);
    return Scaffold(
      body: Column(
        children: [
          Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
          Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOrderDetailHeader(context),
                SizedBox(height: gap_l),
                SizedBox(
                  width: getBodyWidth(context),
                  height: getBodyHeight(context) * 0.7,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: _buildUserRequest(),
                            ),
                            SizedBox(height: gap_l),
                            _buildOrderList(),
                          ],
                        ),
                      ),
                      SizedBox(width: gap_m),
                      _buildUserInfo(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Expanded(
      flex: 4,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(gap_m),
              child: Row(
                children: [
                  Icon(CupertinoIcons.doc_text),
                  Text(
                    '고객정보',
                    style: textTheme().headline1,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: gap_xxs,
              height: gap_xxs,
              color: kBackgroundColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(gap_m),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildUserAddress(),
                          SizedBox(height: gap_m),
                          _buildCompleteDeliveryButton(),
                        ],
                      ),
                    ),
                    SizedBox(height: gap_xl),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              _buildOrderInfoForm('주문번호', '${widget.model.orderListRespDtos[widget.model.selectedIndex].id}'),
                              _buildOrderInfoForm('주문시간', dateFormat(widget.model.orderListRespDtos[widget.model.selectedIndex].orderTime!)),
                              _buildOrderInfoForm('예상배달시간', _selectedDeliveryTime),
                              _buildOrderInfoForm('완료시간', '진행중'),
                            ],
                          ),
                          _buildRefuseDeliveryButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfoForm(text1, text2) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 1, child: Text('${text1}', style: textTheme().headline1)),
            Expanded(flex: 3, child: Text('${text2}', style: textTheme().headline1)),
          ],
        ),
        SizedBox(height: gap_m),
      ],
    );
  }

  Widget _buildCompleteDeliveryButton() {
    return Consumer(
      builder: (context, ref, child) {
        return InkWell(
          onTap: () async {
            OrderController orderCT = ref.read(orderController);
            DeliveryCompleteReqDto deliveryCompleteReqDto = DeliveryCompleteReqDto(
              state: '배달완료',
            );
            // orderId, storeId, userId
            int result = await orderCT.completeDelivery(
              deliveryCompleteReqDto,
              widget.model.orderListRespDtos[widget.model.selectedIndex].id,
              1,
              widget.model.orderListRespDtos[widget.model.selectedIndex].orderState,
            );
            if (result == 1) {
              _deliveryCompleteAlert(context);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kMainColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(gap_s),
                child: Text(
                  '배달완료 알림전송',
                  style: TextStyle(color: kMainColor, fontSize: 22, height: 1),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _deliveryCompleteAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          titlePadding: EdgeInsets.symmetric(horizontal: 120, vertical: 60),
          title: SizedBox(
            width: 300,
            child: Column(
              children: [
                Text(
                  '배달완료 알림이',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 32),
                ),
                Text(
                  '전송 되었습니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kMainColor, fontSize: 32),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(gap_s),
                child: InkWell(
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
                          '확인',
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRefuseDeliveryButton() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => OrderCancelAlert(
              fun: widget.fun,
              storeId: 1,
              orderId: widget.model.orderListRespDtos[widget.model.selectedIndex].id,
              deliveryState: widget.model.orderListRespDtos[widget.model.selectedIndex].deliveryState,
              orderState: widget.model.orderListRespDtos[widget.model.selectedIndex].orderState,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: kButtonSubColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Text(
              '주문 거절하기',
              style: TextStyle(color: kButtonSubColor, fontSize: 22, height: 1),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserAddress() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '배달주소',
                style: textTheme().headline1,
              ),
              SizedBox(height: gap_s),
              Text(
                '${widget.model.orderListRespDtos[widget.model.selectedIndex].userAddress}',
                style: textTheme().headline1,
              ),
            ],
          ),
          SizedBox(height: gap_l),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '고객연락처',
                style: textTheme().headline1,
              ),
              SizedBox(height: gap_s),
              Text(
                widget.model.orderListRespDtos[widget.model.selectedIndex].userPhone!,
                style: textTheme().headline1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList() {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(gap_m),
              child: Row(
                children: [
                  Icon(CupertinoIcons.doc_text),
                  Text(
                    '주문내역',
                    style: textTheme().headline1,
                  ),
                ],
              ),
            ),
            Divider(thickness: gap_xxs, height: gap_xxs, color: kBackgroundColor),
            Expanded(
              child: RawScrollbar(
                thumbColor: kUnselectedListColor,
                radius: Radius.circular(5),
                controller: _scrollController,
                thickness: 10,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(gap_m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                        widget.model.orderListRespDtos[widget.model.selectedIndex].orderList!.length,
                        (index) {
                          return _buildMenuPrice(
                            widget.model.orderListRespDtos[widget.model.selectedIndex].orderList![index].menuName,
                            widget.model.orderListRespDtos[widget.model.selectedIndex].orderList![index].count,
                            numberPriceFormat('${widget.model.orderListRespDtos[widget.model.selectedIndex].orderList![index].price}'),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            _buildTotalPrice(totalCount(), numberPriceFormat('${totalPrice()}')),
          ],
        ),
      ),
    );
  }

  Column _buildOrderDetailHeader(BuildContext context) {
    Logger().d("변경된 index : ${widget.model.selectedIndex}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.model.orderListRespDtos[widget.model.selectedIndex].deliveryState} ${widget.model.orderListRespDtos[widget.model.selectedIndex].id}',
          style: TextStyle(color: kMainColor, fontSize: 32),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '메뉴 ${totalCount()}개 · ${numberPriceFormat("${totalPrice()}")} (${widget.model.orderListRespDtos[widget.model.selectedIndex].orderState})',
              style: TextStyle(fontSize: 22),
            ),
            Row(
              children: [
                _buildSetDeliveryTime(),
                SizedBox(width: gap_m),
                _buildAcceptDeliveryButton(context),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Container _buildUserRequest() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Row(
              children: [
                Icon(CupertinoIcons.doc_text),
                Text(
                  '요청사항',
                  style: textTheme().headline1,
                ),
              ],
            ),
          ),
          Divider(thickness: gap_xxs, height: gap_xxs, color: kBackgroundColor),
          Padding(
            padding: const EdgeInsets.all(gap_m),
            child: Text(
              '${widget.model.orderListRespDtos[widget.model.selectedIndex].orderComment}',
              style: textTheme().headline1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuPrice(menu, amount, price) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                '${menu}',
                style: textTheme().headline1,
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  '${amount}',
                  style: textTheme().headline1,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  '${price}',
                  style: textTheme().headline1,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: gap_m),
      ],
    );
  }

  Widget _buildTotalPrice(amount, price) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Column(
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: Colors.black,
          ),
          SizedBox(height: gap_m),
          Row(
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    '${amount}',
                    style: textTheme().headline1,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    '${price}',
                    style: textTheme().headline1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell _buildAcceptDeliveryButton(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              titlePadding: EdgeInsets.symmetric(horizontal: 120, vertical: 60),
              title: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Text(
                      '주문을 접수합니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kMainColor, fontSize: 32),
                    ),
                  ],
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
                        onTap: () async {
                          OrderController orderCT = ref.read(orderController);
                          OrderAcceptReqDto orderAcceptReqDto = OrderAcceptReqDto(state: '주문확인', deliveryHour: _selectedDeliveryTime);

                          await orderCT.acceptOrder(
                            orderAcceptReqDto,
                            widget.model.orderListRespDtos[widget.model.selectedIndex].id!,
                            1,
                            widget.model.orderListRespDtos[widget.model.selectedIndex].orderState,
                          );

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
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kMainColor),
          borderRadius: BorderRadius.circular(gap_xxs),
          color: kMainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: gap_s,
            horizontal: gap_xl,
          ),
          child: Text(
            '주문 접수하기',
            style: textTheme().headline3,
          ),
        ),
      ),
    );
  }

  Container _buildSetDeliveryTime() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: kUnselectedListColor,
        ),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: DropdownButton(
          isExpanded: true,
          style: textTheme().headline1,
          underline: Container(
            height: 0,
          ),
          value: _selectedDeliveryTime,
          items: _deliveryTimeList.map(
            (value) {
              return DropdownMenuItem(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: gap_xs),
                  child: Text(value),
                ),
              );
            },
          ).toList(),
          onChanged: (value) {
            setState(() {
              _selectedDeliveryTime = value as String;
            });
          }),
    );
  }
}
