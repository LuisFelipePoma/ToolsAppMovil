import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.orangeAccent;
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
		//Icons
		
    //Textbutton theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),

    // FloatingAction
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5,
    ),
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Theme Appbar
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    //Textbutton theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),

    // FloatingAction
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5,
    ),

    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),

    //Input
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: primary,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(5),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(20),
        ),
      ),
    ),
  );
}
