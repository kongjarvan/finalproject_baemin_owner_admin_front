import 'package:baemin_owner_admin_front/view/pages/admin/admin_main_page.dart';
import 'package:baemin_owner_admin_front/view/pages/login/login_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:flutter/cupertino.dart';

class Move {
  static String mainPage = "/main";
  static String loginPage = "/login";
  static String adminPage = "/admin";
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => LoginPage(),
    Move.mainPage: (context) => MainPage(),
    Move.adminPage: (context) => AdminMainPage(),
  };
}
