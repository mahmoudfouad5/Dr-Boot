import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData themeData = ThemeData(
  primarySwatch: Colors.teal,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 15,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.teal,
    unselectedItemColor: Colors.grey,
  ),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
  appBarTheme: const AppBarTheme(

    titleSpacing: 20,
    titleTextStyle: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0.0,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  ),
);

ThemeData DarkTheme = ThemeData(
  iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.black,
  ),
  primarySwatch: Colors.pink,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 15,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Color(0xFF757575),
      backgroundColor: Colors.black),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
    color: Colors.black,
    titleTextStyle: TextStyle(
        color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
    iconTheme: IconThemeData(color: Colors.blue),
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  ),
);
