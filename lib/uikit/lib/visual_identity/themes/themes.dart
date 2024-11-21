import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
part '../schemes/light_color_schemes.dart';

ThemeData get ligthTheme => ThemeData(
    useMaterial3: true,
    colorScheme: _lightColorScheme,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: _lightColorScheme.onPrimary,
      ),
      titleSpacing: 0,
      toolbarHeight: kToolbarHeight,
      backgroundColor: _lightColorScheme.onPrimaryContainer,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(
        _lightColorScheme.primary,
      ),
    ),
    cardTheme: CardTheme(
        elevation: 0.3,
        shadowColor: Colors.black.withOpacity(0.25),
        color: _lightColorScheme.surfaceTint),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0.3),
        shadowColor: WidgetStatePropertyAll(
          Colors.black.withOpacity(0.25),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: _lightColorScheme.onPrimary,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Scale.xl),
    )));
