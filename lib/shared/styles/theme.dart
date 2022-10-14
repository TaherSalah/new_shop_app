import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:softagy_shop_app/shared/styles/style.dart';
ThemeData lightMode = ThemeData(
    textTheme: const TextTheme(
        bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    )),
    fontFamily: 'jannah',
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        unselectedItemColor: Colors.grey,
        elevation: 25.0),
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 30.0,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 20.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
        suffixIconColor:blackColor ,
        prefixIconColor:blackColor ,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color: Colors.black.withOpacity(0.1),
            )
        )
    )

);
ThemeData darkMode = ThemeData(
  textTheme: const TextTheme(
      bodyText1: TextStyle(
    color: Colors.white,
    fontSize: 17.0,
    fontWeight: FontWeight.bold,
  )),
  fontFamily: 'jannah',
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('333739'),
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      unselectedItemColor: Colors.grey,
      elevation: 25.0),
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch:defaultColor,
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 30.0,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    suffixIconColor:whiteColor ,
    prefixIconColor:whiteColor ,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: whiteColor,
      )
    )
  )
);
