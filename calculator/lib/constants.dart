import 'package:flutter/material.dart';

const double buttonTextColorOpacity = 0.16;
const Color lightColorLight = Color(0x29000000);
const Color lightColorDark = Color(0x29FFFFFF);

const Color colorDark = Color(0xFFFFFFFF);
const Color colorLight = Color(0xFF000000);

const Color colorPrimary = Color(0xFFFF3E39);

const Color appbarColorLight = Color(0xFFFAFAFA);
const Color appbarColorDark = Color(0xFF151515);

const Color backgroundColorLight = Color(0xFFFFFFFF);
const Color backgroundColorDark = Color(0xFF1A1A1A);

ThemeData darkTheme = ThemeData.dark();
ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.white,
);
