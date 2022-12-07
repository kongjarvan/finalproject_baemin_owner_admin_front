import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/size.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:baemin_owner_admin_front/view/pages/main/component/register_update_store_form.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:flutter/material.dart';

class UpdateStorePage extends StatefulWidget {
  final Function(int index) notifyParent;
  const UpdateStorePage({required this.notifyParent, Key? key}) : super(key: key);

  @override
  State<UpdateStorePage> createState() => _UpdateStorePageState();
}

class _UpdateStorePageState extends State<UpdateStorePage> {
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
                      RegisterUpdateStoreForm(title: '가게수정'),
                      _buildUpdateButton(context),
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

  InkWell _buildUpdateButton(context) {
    return InkWell(
      onTap: () => callback(0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(gap_xxs),
          color: kMainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: gap_s),
          child: Text('가게수정하기', style: textTheme().headline3),
        ),
      ),
    );
  }

  void callback(int index) {
    widget.notifyParent(index);
  }
}
