import 'package:flutter/material.dart';

class MyIconWithText extends StatelessWidget {
  final icon;
  final settings;
  final text;
  final color;
  const MyIconWithText({required this.icon, required this.settings, required this.text, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Icon(icon, color: color),
          Text('${text}', style: TextStyle(color: color)),
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => settings));
      },
    );
  }
}
