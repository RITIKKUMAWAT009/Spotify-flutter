import 'package:flutter/material.dart';
import 'package:spotify_lite/core/configs/themes/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
      fontFamily: 'Satoshi',
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.all(30),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 0.4),
            borderRadius: BorderRadius.all(Radius.circular(30))),
         focusedBorder:OutlineInputBorder(
             borderSide: BorderSide(color: Colors.black,width: 0.4),
             borderRadius: BorderRadius.all(Radius.circular(30))),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black,width: 0.4),
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))));

  static final darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.all(30),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white,width: 0.4),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 0.4),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,width: 0.4),
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))));
}
