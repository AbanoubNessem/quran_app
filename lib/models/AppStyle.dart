import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyle{
  static Color LightPrimaryColor = const Color(0xffB7935F);
  static Color LightAccentColor = const Color(0xffffffff);
  static Color DarkPrimaryColor = const Color(0xffFACC1D);
  static Color DarkAccentColor = const Color(0xff141A2E);
  static Color BlackColor = const Color(0xff000000);
  static Color WhiteColor = const Color(0xffffffff);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: LightPrimaryColor,
      cardColor: BlackColor,
      backgroundColor: LightAccentColor,
      hoverColor: WhiteColor,
      cursorColor:LightPrimaryColor ,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 22),
      titleMedium: TextStyle(color:LightPrimaryColor,fontSize: 18 , fontWeight: FontWeight.bold ),
        headlineMedium: TextStyle(color:Colors.black,fontSize: 18 , fontWeight: FontWeight.bold ),
        headlineLarge: TextStyle(color:Colors.black,fontSize: 18 , fontWeight: FontWeight.bold ),
      headlineSmall: TextStyle(color:Colors.black , fontWeight: FontWeight.bold )
    )
  );

  static ThemeData DarkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      cardColor: WhiteColor,
      primaryColor: DarkAccentColor,
      backgroundColor: DarkAccentColor,
      hoverColor: DarkPrimaryColor,
      cursorColor: DarkPrimaryColor ,
      textTheme: TextTheme(

          titleLarge: TextStyle(color: Colors.white, fontSize: 22),
          titleMedium: TextStyle(color:DarkPrimaryColor,fontSize: 18 , fontWeight: FontWeight.bold ),
          headlineMedium: TextStyle(color:Colors.black,fontSize: 18 , fontWeight: FontWeight.bold ),
          headlineLarge: TextStyle(color:Colors.white,fontSize: 18 , fontWeight: FontWeight.bold ),
          headlineSmall: TextStyle(color:Colors.black , fontWeight: FontWeight.bold,fontSize: 18 )
      )
  );

}
