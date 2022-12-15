import 'package:baemin_owner_admin_front/view/pages/admin/admin_main_page.dart';
import 'package:baemin_owner_admin_front/view/pages/login/login_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/store_info/store/register_store/register_store_page.dart';
import 'package:baemin_owner_admin_front/view/pages/register_owner/register_owner_page.dart';
import 'package:baemin_owner_admin_front/view/pages/register_owner/waiting_registration_page.dart';
import 'package:flutter/cupertino.dart';

class Move {
  static String mainPage = "/main";
  static String loginPage = "/login";
  static String adminPage = "/admin";
  static String registerOwnerPage = "/registerOwner";
  static String waitingRegistrationPage = "/WaitingRegistrationPage";
  static String registerStorePage = "/registerStorePage";
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => LoginPage(),
    Move.mainPage: (context) => MainPage(),
    Move.adminPage: (context) => AdminMainPage(),
    Move.registerOwnerPage: (context) => RegisterOwnerPage(),
    Move.waitingRegistrationPage: (context) => WaitingRegistrationPage(),
    Move.registerStorePage: (context) => RegisterStorePage(),
  };
}
