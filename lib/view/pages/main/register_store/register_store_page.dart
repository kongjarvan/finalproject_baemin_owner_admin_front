import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/register_update_store_form.dart';
import 'package:flutter/material.dart';

class RegisterStorePage extends StatefulWidget {
  final Function() notifyParent;
  const RegisterStorePage({required this.notifyParent, Key? key}) : super(key: key);

  @override
  State<RegisterStorePage> createState() => _RegisterStorePageState();
}

class _RegisterStorePageState extends State<RegisterStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(height: gap_xxs, thickness: gap_xxs, color: kMainColor),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(gap_l),
                  child: Column(
                    children: [
                      RegisterUpdateStoreForm(title: '가게등록'),
                      _buildRegisterButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return InkWell(
      onTap: widget.notifyParent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(gap_xxs),
          color: kMainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: gap_s),
          child: Text('가게등록하기', style: textTheme().headline3),
        ),
      ),
    );
  }
}
