import 'package:uikit/tokens/typhography/font.dart';
import 'package:flutter/material.dart';

final class Style {
  
  static TextStyle headline({Color? color}) =>
      TextStyle(fontSize: Font.lg, fontFamily: 'Martel Sans', color: color);

  static TextStyle title({Color? color}) =>
      TextStyle(fontSize: Font.md, fontFamily: 'Martel Sans', color: color);

  static TextStyle body({Color? color}) =>
      TextStyle(fontSize: Font.sm, fontFamily: 'Martel Sans', color: color);

  static TextStyle label({Color? color}) =>
      TextStyle(fontSize: Font.xs, fontFamily: 'Martel Sans', color: color);

  static TextStyle footer({Color? color}) =>
      TextStyle(fontSize: Font.xxs, fontFamily: 'Martel Sans', color: color);
}
