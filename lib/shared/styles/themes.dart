import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme=ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    color:HexColor('333739'),
    elevation: 0.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness:Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      color:Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type:BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: TextTheme(
    bodyText1:TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
    subtitle1:TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
  ),
);

ThemeData lightTheme=ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color:Colors.white,
    elevation: 0.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness:Brightness.light,
    ),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 25.0,
      color:Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    type:BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20.0,
  ),
  textTheme: TextTheme(
    bodyText1:TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
    subtitle1:TextStyle(
      color: Colors.black,
      fontSize: 14.0,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),

  ),
);