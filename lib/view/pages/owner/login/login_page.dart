import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/controller/owner_controller.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/components/input_text_form_field.dart';
import 'package:baemin_owner_admin_front/view/pages/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class LoginPage extends ConsumerStatefulWidget {
  LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    OwnerController ownerCT = ref.read(ownerController);
    Logger().d("로그인 페이지 빌드 시작");
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: SizedBox(
          width: 400,
          height: 500,
          child: ListView(
            children: [
              Logo(),
              InputTextFormField(
                text1: '아이디',
                text2: '아이디 입력',
                controller: _username,
                maxLine: 1,
                isReadOnly: false,
              ),
              SizedBox(height: 24),
              InputTextFormField(
                text1: '비밀번호',
                text2: '비밀번호 입력',
                controller: _password,
                maxLine: 1,
                isReadOnly: false,
              ),
              SizedBox(height: 24),
              _buildLoginButton(context, ownerCT),
              SizedBox(height: 24),
              _buildAdditionalMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  InkWell _buildLoginButton(BuildContext context, OwnerController ownerCT) {
    return InkWell(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: kMainColor),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(child: Text('로그인', style: textTheme().headline3)),
          ),
        ),
        onTap: () async {
          await ownerCT.login(
            username: _username.text.trim(),
            password: _password.text.trim(),
          ); // 추가
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
              onTap: () {},
            ),
            Text('/'),
            InkWell(
              child: Text(' 비밀번호 찾기', style: textTheme().bodyText2),
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}
