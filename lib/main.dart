import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/model/user_session.dart';
import 'package:baemin_owner_admin_front/view/pages/admin/admin_main_page.dart';
import 'package:baemin_owner_admin_front/view/pages/login/login_page.dart';
import 'package:baemin_owner_admin_front/view/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "beamin_owner_ui",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.deepOrange),
      ),
      navigatorKey: navigatorKey,
      initialRoute: UserSession.isLogin ? Move.mainPage : Move.loginPage,
      routes: getRouters(),
    );
  }
}
