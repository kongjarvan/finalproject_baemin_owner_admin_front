import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/components/logo.dart';
import 'package:baemin_owner_admin_front/view/pages/register_owner/register_owner_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: SizedBox(
          width: 400,
          height: 500,
          child: ListView(
            children: [
              Logo(),
              InputTextFormField(text: '아이디'),
              SizedBox(height: 24),
              InputTextFormField(text: '비밀번호'),
              SizedBox(height: 24),
              _buildLoginButton(context),
              SizedBox(height: 24),
              _buildAdditionalMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildLoginButton(BuildContext context) {
    return InkWell(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: kMainColor),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(child: Text('로그인', style: textTheme().headline3)),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/main');
        });
  }

  Row _buildAdditionalMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
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
            Text('로그인 기억하기'),
          ],
        ),
        Row(
          children: [
            InkWell(
              child: Text('아이디 ', style: textTheme().bodyText2),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            Text('/'),
            InkWell(
              child: Text(' 비밀번호 찾기', style: textTheme().bodyText2),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterOwnerPage()));
              },
            )
          ],
        ),
      ],
    );
  }
}
