import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IAppThemeSet {
  final int indexNumber;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeData amoledDarkTheme;

  const IAppThemeSet({
    required this.indexNumber,
    required this.lightTheme,
    required this.darkTheme,
    required this.amoledDarkTheme,
  });

  static final String? _fontFamily = GoogleFonts.roboto().fontFamily;
  static final appThemeSets = List<IAppThemeSet>.from(
    [
      IAppThemeSet(
        indexNumber: 0,
        lightTheme: FlexThemeData.light(
          scheme: FlexScheme.aquaBlue,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 20,
          appBarStyle: FlexAppBarStyle.material,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            blendOnColors: false,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.aquaBlue,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        amoledDarkTheme: FlexThemeData.dark(
          scheme: FlexScheme.aquaBlue,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          darkIsTrueBlack: true,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
      ),
      IAppThemeSet(
        indexNumber: 1,
        lightTheme: FlexThemeData.light(
          scheme: FlexScheme.materialBaseline,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 20,
          appBarStyle: FlexAppBarStyle.material,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            blendOnColors: false,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.materialBaseline,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        amoledDarkTheme: FlexThemeData.dark(
          scheme: FlexScheme.materialBaseline,
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          darkIsTrueBlack: true,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
      ),
      IAppThemeSet(
        indexNumber: 2,
        lightTheme: FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: Color(0xff065808),
            primaryContainer: Color(0xff9bbc9c),
            secondary: Color(0xff365b37),
            secondaryContainer: Color(0xffaebdaf),
            tertiary: Color(0xff2c7e2e),
            tertiaryContainer: Color(0xffb8e6b9),
            appBarColor: Color(0xffb8e6b9),
            error: Color(0xffb00020),
          ),
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 20,
          appBarStyle: FlexAppBarStyle.material,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            blendOnColors: false,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xff629f80),
            primaryContainer: Color(0xff273f33),
            secondary: Color(0xff81b39a),
            secondaryContainer: Color(0xff4d6b5c),
            tertiary: Color(0xff88c5a6),
            tertiaryContainer: Color(0xff356c50),
            appBarColor: Color(0xff356c50),
            error: Color(0xffcf6679),
          ),
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        amoledDarkTheme: FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xff629f80),
            primaryContainer: Color(0xff273f33),
            secondary: Color(0xff81b39a),
            secondaryContainer: Color(0xff4d6b5c),
            tertiary: Color(0xff88c5a6),
            tertiaryContainer: Color(0xff356c50),
            appBarColor: Color(0xff356c50),
            error: Color(0xffcf6679),
          ),
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          darkIsTrueBlack: true,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
      ),
      IAppThemeSet(
        indexNumber: 3,
        lightTheme: FlexThemeData.light(
          colors: const FlexSchemeColor(
            primary: Color(0xff00296b),
            primaryContainer: Color(0xffa0c2ed),
            secondary: Color(0xffd26900),
            secondaryContainer: Color(0xffffd270),
            tertiary: Color(0xff5c5c95),
            tertiaryContainer: Color(0xffc8dbf8),
            appBarColor: Color(0xffc8dcf8),
          ),
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 20,
          appBarStyle: FlexAppBarStyle.material,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            blendOnColors: false,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        darkTheme: FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xffb1cff5),
            primaryContainer: Color(0xff3873ba),
            secondary: Color(0xffffd270),
            secondaryContainer: Color(0xffd26900),
            tertiary: Color(0xffc9cbfc),
            tertiaryContainer: Color(0xff535393),
            appBarColor: Color(0xff00102b),
          ),
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
        amoledDarkTheme: FlexThemeData.dark(
          colors: const FlexSchemeColor(
            primary: Color(0xffb1cff5),
            primaryContainer: Color(0xff3873ba),
            secondary: Color(0xffffd270),
            secondaryContainer: Color(0xffd26900),
            tertiary: Color(0xffc9cbfc),
            tertiaryContainer: Color(0xff535393),
            appBarColor: Color(0xff00102b),
          ),
          surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
          blendLevel: 15,
          appBarStyle: FlexAppBarStyle.background,
          appBarOpacity: 0.00,
          darkIsTrueBlack: true,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 30,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          // useMaterial3: true,
          fontFamily: _fontFamily,
        ),
      )
    ],
    growable: false,
  );
}
