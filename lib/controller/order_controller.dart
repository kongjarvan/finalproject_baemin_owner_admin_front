import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/dto/req/delivery_complete_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/order_accept_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/req/order_cancel_req_dto.dart';
import 'package:baemin_owner_admin_front/dto/response_dto.dart';
import 'package:baemin_owner_admin_front/service/order_service.dart';
import 'package:baemin_owner_admin_front/view/pages/owner/main/store_management/model/order_list_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderController = Provider<OrderController>((ref) {
  return OrderController(ref);
});

class OrderController {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  OrderController(this._ref);

  OrderService orderService = OrderService();

  Future<void> refreshMainPage() async {
    _ref.read(orderListPageViewModel.notifier).notifyViewModel();
  }

  Future<void> cancelOrder(OrderCancelReqDto orderCancelReqDto, int orderId, orderState) async {
    // 통신
    // userId, orderId, storeId
    print('주문취소 컨트롤러 진입');
    if (orderState == '주문완료') {
      ResponseDto responseDto = await OrderService().fetchDelete(orderCancelReqDto, orderId);
      print('응답받음');
      if (responseDto.code == 1) {
        await _ref.read(orderListPageViewModel.notifier).notifyViewModel();
        //_ref.read(mainPageViewModel.notifier).delete(orderId);
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(
            backgroundColor: Color(0x996D62E8),
            content: Text("주문이 취소 되었습니다."),
            action: SnackBarAction(
              label: '확인',
              textColor: kWhiteColor,
              onPressed: () {},
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(mContext!).showSnackBar(
          SnackBar(
            backgroundColor: Color(0x996D62E8),
            content: Text("주문을 취소 할 수 없습니다. (1)"),
            action: SnackBarAction(
              label: '확인',
              textColor: kWhiteColor,
              onPressed: () {},
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("주문을 취소 할 수 없습니다. (2)"),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }

    // Navigator.popAndPushNamed(mContext!, Move.loginPage);
    //_ref.read(mainPageViewModel.notifier).delete();
  }

  Future<void> acceptOrder(OrderAcceptReqDto orderAcceptReqDto, int orderId, orderState) async {
    if (orderState == '주문완료') {
      ResponseDto responseDto = await OrderService().fetchAcceptOrder(orderAcceptReqDto, orderId);
      await _ref.read(orderListPageViewModel.notifier).notifyViewModel();
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x99FF521C),
          content: Text("주문이 접수되었습니다!"),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("주문을 받을 수 없습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
    }
  }

  Future<int> completeDelivery(DeliveryCompleteReqDto deliveryCompleteReqDto, orderId, int storeId, orderState) async {
    if (orderState == '주문확인') {
      ResponseDto responseDto = await OrderService().fetchCompleteDelivery(deliveryCompleteReqDto, orderId);
      await _ref.read(orderListPageViewModel.notifier).notifyViewModel();
      return 1;
    } else if (orderState == '배달중') {
      ResponseDto responseDto = await OrderService().fetchCompleteDelivery(deliveryCompleteReqDto, orderId);
      await _ref.read(orderListPageViewModel.notifier).notifyViewModel();
      return 1;
    } else {
      print('주문완료 불가능');
      ScaffoldMessenger.of(mContext!).showSnackBar(
        SnackBar(
          backgroundColor: Color(0x996D62E8),
          content: Text("배달을 완료 할 수 없습니다."),
          action: SnackBarAction(
            label: '확인',
            textColor: kWhiteColor,
            onPressed: () {},
          ),
        ),
      );
      return 0;
    }
  }

  // 주문 상세보기
  // 주문 목록보기
  // 주문 받기?
  // 주문 거절하기
  // 배달완료 알림 보내기
}
