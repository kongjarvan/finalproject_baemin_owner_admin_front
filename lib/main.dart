import 'package:baemin_owner_admin_front/constants.dart';
import 'package:baemin_owner_admin_front/core/constant/move.dart';
import 'package:baemin_owner_admin_front/service/local_service.dart';
import 'package:baemin_owner_admin_front/service/user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService().fetchJwtToken();
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
      title: "beamin_owner_ui",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: null,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        textSelectionTheme: TextSelectionThemeData(cursorColor: kMainColor),
      ),
      navigatorKey: navigatorKey,
      initialRoute: UserSession.isLogin ? Move.mainPage : Move.loginPage,
      routes: getRouters(),
    );
  }
}
