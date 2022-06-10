import 'package:flutter/material.dart';
import 'package:i_packages/utils/themes/app_theme.dart';
import 'package:i_packages/utils/themes/app_theme_set.dart';

class $IAppThemeHandler {
  final int selectedThemeSet;

  $IAppThemeHandler(this.selectedThemeSet);

  IAppThemeSet get selectedTheme =>
      IAppThemeSet.appThemeSets.length >= (selectedThemeSet + 1)
          ? IAppThemeSet.appThemeSets.elementAt(selectedThemeSet)
          : IAppThemeSet.appThemeSets.first;
}

class IThemes {
  IThemes._();

  static List<IAppThemeSet> get appThemeSets => IAppThemeSet.appThemeSets;

  static IAppTheme getAppTheme({
    required int savedTheme,
    required int themeSetIndex,
  }) {
    final appThemeHandler = $IAppThemeHandler(themeSetIndex);

    switch (savedTheme) {
      case 0:
        return IAppTheme(
          themeData: appThemeHandler.selectedTheme.lightTheme,
          themeMode: ThemeMode.light,
          theme: savedTheme,
          themeSetIndex: themeSetIndex,
        );
      case 1:
        return IAppTheme(
          themeData: appThemeHandler.selectedTheme.darkTheme,
          themeMode: ThemeMode.dark,
          theme: savedTheme,
          themeSetIndex: themeSetIndex,
        );
      case 2:
        return IAppTheme(
          themeData: appThemeHandler.selectedTheme.amoledDarkTheme,
          themeMode: ThemeMode.dark,
          theme: savedTheme,
          themeSetIndex: themeSetIndex,
        );
      default:
        return IAppTheme(
          themeData: appThemeHandler.selectedTheme.lightTheme,
          themeMode: ThemeMode.light,
          theme: savedTheme,
          themeSetIndex: themeSetIndex,
        );
    }
  }
}
