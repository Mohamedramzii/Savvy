import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xstore_cubit/core/color_manager.dart';

abstract class APPTHEMES {
  static ThemeData lightMode = ThemeData(
    primaryColor: ColorsManager.kprimaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'SourceSansPro',
    textTheme: const TextTheme(
        //onBoarding title
        displayLarge: TextStyle(
            fontSize: 35, fontWeight: FontWeight.w900, color: Colors.black),
        displayMedium: TextStyle(fontSize: 25, color: Colors.black)),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      elevation: 0,
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.kprimaryColor),
  );
  static ThemeData darkMode = ThemeData(
    primaryColor: ColorsManager.kprimaryColor,
    fontFamily: 'SourceSansPro',
    textTheme: TextTheme(
        //onBoarding title
        displayLarge: TextStyle(
            fontSize: 35.sp, fontWeight: FontWeight.w900, color: Colors.white),
        displayMedium: TextStyle(fontSize: 25.sp, color: Colors.white)),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light),
      elevation: 0,
      backgroundColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.kprimaryColor),
  );
}
