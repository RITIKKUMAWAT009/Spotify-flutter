import 'package:flutter/material.dart';

extension DarkMode on BuildContext{
  bool get isDarkOrNot=>Theme.of(this).brightness==Brightness.dark;
}