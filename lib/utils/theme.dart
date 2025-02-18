import 'package:flutter/material.dart';

import 'size_constants.dart';
import 'texts_constants.dart';

class ThemeApp {
  ThemeApp._();

  //cores personalizadas
  static const Color _primaryColor = Colors.pink;
  static const MaterialColor _primaryMaterialColor = Colors.pink;
  static const Color _secondaryColor = Colors.amber;
  static const Color _switchHoveredColor = Colors.amber;
  static const Color _canvasColor = Color.fromRGBO(255, 254, 229, 1);
  static const Color _switchThumbColor =
      Colors.pink; // Cor do botão deslizante do Switch
  static Color switchTrackColor = Colors.grey.withValues(
    alpha: .5,
  ); // Cor da trilha do Switc

  //configuração do thema
  static final ThemeData themeApp = ThemeData(
    useMaterial3: true,

    visualDensity: VisualDensity.adaptivePlatformDensity,

    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: _primaryMaterialColor,
    ).copyWith(secondary: _secondaryColor),

    appBarTheme: AppBarTheme(
      backgroundColor: _primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _primaryColor,
      selectedItemColor: _secondaryColor,
      unselectedItemColor: Colors.grey,
    ),

    switchTheme: SwitchThemeData(
      splashRadius: 3.0,
      thumbColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return _switchThumbColor;
        } else if (states.contains(WidgetState.pressed)) {
          return _switchHoveredColor;
        }
        return _switchThumbColor.withValues(alpha: 0.5);
      }),

      trackColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return switchTrackColor;
        } else if (states.contains(WidgetState.hovered)) {
          return switchTrackColor;
        }
        return switchTrackColor.withValues(alpha: 0.8);
      }),
    ),

    fontFamily: TextsConstants.themeFontFamilyRaleway,

    canvasColor: _canvasColor,

    textTheme: ThemeData.light().textTheme.copyWith(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: SizeConstants.textSize20,
        fontFamily: TextsConstants.themeFontFamilyRobotoCondensed,
      ),
    ),
  );
}
