import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFF8421A);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: Colors.indigo,

    // AppBar Theme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),

    // TextButton Theme
    textButtonTheme:
        TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

    // FloatingActionButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary, elevation: 5),

    // ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 60,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      helperStyle: TextStyle(
        color: Colors.white,
      ),
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      labelStyle: TextStyle(
        color: Colors.white,
      ),
      floatingLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white38),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(

      // Color primario
      primaryColor: Colors.indigo,

      // AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}
