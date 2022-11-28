import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/components/logo.dart';
import 'package:baemin_owner_admin_front/view/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class RegisterOwnerPage extends StatelessWidget {
  const RegisterOwnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              InputTextFormField(text: '대표자 이름'),
              SizedBox(height: 24),
              InputTextFormField(text: '사업자 주소'),
              SizedBox(height: 24),
              InputTextFormField(text: '사업자 번호'),
              SizedBox(height: 24),
              _buildApplicateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildApplicateButton(BuildContext context) {
    return InkWell(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: kMainColor),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(child: Text('입점 신청하기', style: textTheme().headline3)),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
        });
  }
}
