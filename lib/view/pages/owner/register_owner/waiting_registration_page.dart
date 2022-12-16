import 'package:baemin_owner_admin_front/constants.dart';
import 'package:flutter/material.dart';

class WaitingRegistrationPage extends StatelessWidget {
  const WaitingRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Text(
          '사업자 등록 승인을 대기 중입니다. 관리자의 승인 완료 시 사장님 페이지를 이용 가능합니다.',
          style: TextStyle(fontSize: 32, color: kMainColor),
        ),
      ),
    );
  }
}
