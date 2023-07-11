// packages pubspec.yaml
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// https://coolors.co/7c0000-ff0097-71004e-ff0000
class CoreTheme {
  static const Color colorMainAccent = Color.fromARGB(255, 255, 0, 151);
  static const Color colorMainIcon = Color.fromARGB(255, 255, 0, 151);
  static const Color colorMain = Color.fromARGB(255, 113, 0, 78);
  static const Color colorMainDark = Color.fromARGB(255, 0, 0, 0);
  static const Color colorMainLightForThemeDefault = Color.fromARGB(255, 255, 255, 255);
  static const Color colorMainLightForThemeDark = Color.fromARGB(255, 0, 0, 0);
  static const Color colorBorderForThemeDefault = Color.fromARGB(255, 0, 0, 0);
  static const Color colorBorderForThemeDark = Color.fromARGB(255, 255, 255, 255);

  static ThemeData get themeDataDefault => ThemeData.light().copyWith(
        backgroundColor: colorMainLightForThemeDefault,
        scaffoldBackgroundColor: colorMainLightForThemeDefault,
        brightness: Brightness.light,
        primaryColor: CoreTheme.colorMain,
        canvasColor: CoreTheme.colorMainLightForThemeDefault,
        indicatorColor: CoreTheme.colorMainAccent,
        dividerColor: const Color.fromARGB(255, 110, 110, 110),
        shadowColor: Colors.black,
        selectedRowColor: CoreTheme.colorMain.withAlpha(155),
        unselectedWidgetColor: CoreTheme.colorMain.withAlpha(155),
        toggleableActiveColor: CoreTheme.colorMain.withAlpha(155),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: CoreTheme.colorMain,
            side: const BorderSide(
              color: CoreTheme.colorMain,
            ),
          ),
        ),
        dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        dataTableTheme: DataTableThemeData(
          headingRowColor: MaterialStateProperty.all<Color>(CoreTheme.colorMain),
          horizontalMargin: 32,
        ),
        tabBarTheme: const TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 4.0,
              color: CoreTheme.colorMain,
            ),
          ),
          labelColor: Colors.white,
        ),
        primaryTextTheme: const TextTheme(
          caption: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
            height: 1.5,
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          caption: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
            height: 1.5,
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: CoreTheme.colorMain,
          selectionColor: CoreTheme.colorMainAccent,
          selectionHandleColor: CoreTheme.colorMainAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: CoreTheme.colorMain,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: CoreTheme.colorMainIcon,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(
            fontSize: 10,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: CoreTheme.colorMainAccent,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CoreTheme.colorMainIcon,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          prefixStyle: TextStyle(
            color: Colors.black26,
          ),
          suffixStyle: TextStyle(
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Colors.black38,
          ),
          labelStyle: TextStyle(
            color: Colors.black38,
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: CoreTheme.colorMain,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: CoreTheme.colorMain,
              width: 4,
            ),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: CoreTheme.colorMain,
              width: 2,
            ),
          ),
          filled: true,
          focusColor: Colors.black,
          hoverColor: Colors.black,
          fillColor: CoreTheme.colorMainLightForThemeDefault,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: CoreTheme.colorMain,
          circularTrackColor: CoreTheme.colorMainAccent,
          linearTrackColor: CoreTheme.colorMainAccent,
          refreshBackgroundColor: Colors.white,
          linearMinHeight: 4,
        ),
        cardColor: Colors.white70,
      );
  static ThemeData get themeDataDark => ThemeData.dark().copyWith(
        backgroundColor: colorMainLightForThemeDark,
        scaffoldBackgroundColor: colorMainLightForThemeDark,
        brightness: Brightness.dark,
        primaryColor: CoreTheme.colorMain,
        canvasColor: CoreTheme.colorMainLightForThemeDark,
        indicatorColor: CoreTheme.colorMainAccent,
        dividerColor: const Color.fromARGB(255, 110, 110, 110),
        shadowColor: Colors.black,
        selectedRowColor: CoreTheme.colorMain.withAlpha(155),
        unselectedWidgetColor: CoreTheme.colorMain.withAlpha(155),
        toggleableActiveColor: CoreTheme.colorMain.withAlpha(155),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: CoreTheme.colorMain,
            side: const BorderSide(
              color: CoreTheme.colorMain,
            ),
          ),
        ),
        dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        dataTableTheme: DataTableThemeData(
          headingRowColor: MaterialStateProperty.all<Color>(colorMain),
          horizontalMargin: 32,
        ),
        tabBarTheme: const TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 4.0,
              color: CoreTheme.colorMainDark,
            ),
          ),
          labelColor: Colors.white,
        ),
        primaryTextTheme: const TextTheme(
          caption: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            height: 1.5,
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
        ),
        textTheme: const TextTheme(
          caption: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            height: 1.5,
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: CoreTheme.colorMain,
          selectionColor: CoreTheme.colorMainAccent,
          selectionHandleColor: CoreTheme.colorMainAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: CoreTheme.colorMainDark,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: CoreTheme.colorMainIcon,
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
            fontSize: 10,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: CoreTheme.colorMainAccent,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CoreTheme.colorMainIcon,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          prefixStyle: TextStyle(
            color: Colors.white30,
          ),
          suffixStyle: TextStyle(
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white38,
          ),
          labelStyle: TextStyle(
            color: Colors.white38,
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: CoreTheme.colorMain,
              width: 2,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: CoreTheme.colorMain,
              width: 4,
            ),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: CoreTheme.colorMain,
              width: 2,
            ),
          ),
          filled: true,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          fillColor: CoreTheme.colorMainLightForThemeDark,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: CoreTheme.colorMain,
          circularTrackColor: CoreTheme.colorMainAccent,
          linearTrackColor: CoreTheme.colorMainAccent,
          refreshBackgroundColor: Colors.white,
          linearMinHeight: 4,
        ),
        cardColor: Colors.grey[850],
      );

  static Future<void> changeThemeMode() async {
    ThemeMode themeMode = Get.isDarkMode ? ThemeMode.light : ThemeMode.dark;

    Get.changeThemeMode(themeMode);
  }

  static ThemeMode getThemeMode() {
    ThemeMode themeMode = ThemeMode.light;

    return themeMode;
  }

  static Color colorForBorder() {
    return Get.isDarkMode ? colorBorderForThemeDark : colorBorderForThemeDefault;
  }
}
