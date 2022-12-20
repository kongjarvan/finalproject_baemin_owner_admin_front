import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/theme.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('땡기는 민족', style: TextStyle(color: kMainColor, fontSize: 40)),
        Text('사장님', style: textTheme().headline1),
      ],
    );
  }
}
