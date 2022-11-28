import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.notoSans(fontSize: 18.0, color: Colors.black, height: 1.0),
    headline2: GoogleFonts.notoSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold, height: 1.0),
    headline3: GoogleFonts.notoSans(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold, height: 1.0),
    bodyText1: GoogleFonts.notoSans(fontSize: 16.0, color: Colors.black, height: 1.0),
    bodyText2: GoogleFonts.notoSans(fontSize: 14.0, color: Colors.grey, height: 1.0),
    subtitle1: GoogleFonts.notoSans(fontSize: 15.0, color: Colors.black, height: 1.0),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    textTheme: TextTheme(
      headline6: GoogleFonts.nanumGothic(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  );
}

TextButtonThemeData styleFrom() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appTheme(),
    primaryColor: Colors.lightBlueAccent,
    bottomNavigationBarTheme: bottomNavigationBarTheme(),
  );
}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey[400],
  );
}
