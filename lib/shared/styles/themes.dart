import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darktheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    ));
ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark, statusBarColor: Colors.white),
    ));
