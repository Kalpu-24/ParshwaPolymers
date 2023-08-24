import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    cardColor: const Color.fromARGB(255, 220, 220, 220),
    primaryColor: const Color(0xff5075b2),
    primaryColorLight: const Color.fromARGB(44, 80, 118, 178),
    colorScheme: const ColorScheme.light(background: Color(0xffecf0e7)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0x00000000),
      foregroundColor: Color(0xff5075b2),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xffecf0e7),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStateProperty.all(const Color(0xff5075b2)),
      side:
          MaterialStateProperty.all(const BorderSide(color: Color(0xff5075b2))),
    )),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color(0xff5075b2),
      ),
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xffffffff),
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w200,
        color: Color(0x88dddddd),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xff5075b2),
        selectionColor: Color(0xff5075b2),
        selectionHandleColor: Color(0xff5075b2)),
    navigationRailTheme:
        const NavigationRailThemeData(indicatorColor: Color(0xff5075b2)),
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff5075b2),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff5075b2),
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Color(0xff5075b2),
        )));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    cardColor: const Color(0xff111111),
    primaryColor: const Color(0xff5075b2),
    primaryColorLight: const Color.fromARGB(44, 80, 118, 178),
    colorScheme: const ColorScheme.dark(background: Color(0xff0a0c07)),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0x00000000),
      foregroundColor: Color(0xff5075b2),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStateProperty.all(const Color(0xff5075b2)),
      side:
          MaterialStateProperty.all(const BorderSide(color: Color(0xff5075b2))),
    )),
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Color(0xff5075b2),
      ),
      displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xffffffff),
      ),
      displayMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w200,
        color: Color(0x88dddddd),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color(0xff5075b2)))),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff0a0c07),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xff5075b2),
        selectionColor: Color(0xff5075b2),
        selectionHandleColor: Color(0xff5075b2)),
    navigationRailTheme:
        const NavigationRailThemeData(indicatorColor: Color(0xff5075b2)),
    inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff5075b2),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff5075b2),
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          color: Color(0xff5075b2),
        )));
