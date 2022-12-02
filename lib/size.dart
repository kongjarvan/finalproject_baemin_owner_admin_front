import 'package:flutter/material.dart';

const double gap_xl = 40;
const double gap_l = 32;
const double gap_m = 24;
const double gap_s = 16;
const double gap_xs = 8;
const double gap_xxs = 4;

// MediaQuery 내 화면 사이즈를 알게 해 줌
double getBodyWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getBodyHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
