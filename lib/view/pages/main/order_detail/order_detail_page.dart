import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/order_cancel_alert.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  final deliveryTitle;

  const OrderDetailPage({required this.deliveryTitle, Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final _deliveryTimeList = ['20분', '30분', '40분', '50분', '60분', '70분', '80분'];
  var _selectedDeliveryTime = '60분';

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
          Padding(
            padding: const EdgeInsets.all(gap_l),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOrderDetailHeader(context, widget.deliveryTitle),
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
                            _buildOrderInfoForm('주문번호', '1'),
                            _buildOrderInfoForm('주문시간', '5/26 (수) 20:00'),
                            _buildOrderInfoForm('예상배달시간', '${_selectedDeliveryTime}'),
                            _buildOrderInfoForm('완료시간', '진행중'),
                          ],
                        ),
                        _buildRefuseDeliveryButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ))
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
    return InkWell(
      onTap: () {},
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
  }

  Widget _buildRefuseDeliveryButton() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) => OrderCancelAlert(),
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
                '[지번] 그린구 그린동 그린아파트 423동 4호',
                style: textTheme().headline1,
              ),
              SizedBox(height: gap_xs),
              Text(
                '[도로명] 그린구 그린로 그린아파트 423동 4호',
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
                '010-1234-5678',
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
                      children: [
                        _buildMenuPrice('메뉴', '수량', '금액'),
                        _buildMenuPrice('메뉴1', 1, '6,000원'),
                        _buildMenuPrice('메뉴2', 1, '9,000원'),
                        _buildMenuPrice('메뉴3', 1, '6,000원'),
                        _buildMenuPrice('메뉴4', 1, '9,000원'),
                        _buildMenuPrice('메뉴5', 1, '6,000원'),
                        _buildMenuPrice('메뉴6', 1, '9,000원'),
                        _buildMenuPrice('메뉴7', 1, '6,000원'),
                        _buildMenuPrice('메뉴8', 1, '9,000원'),
                        _buildMenuPrice('메뉴9', 1, '6,000원'),
                        _buildMenuPrice('메뉴10', 1, '9,000원'),
                        _buildMenuPrice('메뉴11', 1, '6,000원'),
                        _buildMenuPrice('메뉴12', 1, '9,000원'),
                        _buildTotalPrice(12, '90,000원'),
                      ],
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

  Column _buildOrderDetailHeader(BuildContext context, deliveryTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${deliveryTitle}',
          style: TextStyle(color: kMainColor, fontSize: 32),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '메뉴 1개 · 10,000원 (결제완료)',
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
              '3인분 같은 2인분 주세요~',
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
    return Column(
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
    );
  }

  InkWell _buildAcceptDeliveryButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(),
            ));
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
