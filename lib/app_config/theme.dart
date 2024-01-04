import 'package:portfolio/core.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    // useMaterial3: true,
    primaryColor: Constants.kPrimaryColor,
    scaffoldBackgroundColor: Constants.kBackgroundDark,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: Constants.kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Constants.kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: Constants.kPrimaryColor,
      secondary: Constants.kSecondaryColor,
      error: Constants.kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Constants.kBackgroundDark,
      selectedItemColor: Constants.kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: Constants.kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: Constants.kPrimaryColor),
      showUnselectedLabels: true,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Constants.kPrimaryColor),
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: Constants.kPrimaryColor,
    scaffoldBackgroundColor: Constants.kBackgroundDark,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: Constants.kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Constants.kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: Constants.kPrimaryColor,
      secondary: Constants.kSecondaryColor,
      error: Constants.kErrorColor,
      background: Constants.kBackgroundDark,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Constants.kBackgroundDark,
      selectedItemColor: Colors.white70,
      unselectedItemColor: Constants.kContentColorDarkTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: Constants.kPrimaryColor),
      showUnselectedLabels: true,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => Constants.kPrimaryColor),
    ),
  );
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
