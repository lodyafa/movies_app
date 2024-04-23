part of "theme.dart";

ThemeData createLightTheme() {
  return ThemeData(
    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.grey,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.grey,
    ),
    textTheme: createTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    hintColor: AppColors.grey,
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
    ],
    colorScheme: const ColorScheme.light(
      primary: AppColors.orange,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.orange,
      secondary: AppColors.grey,
      surface: AppColors.darkerGrey,
      error: AppColors.red,
      onBackground: AppColors.black,
    ),
    focusColor: Colors.white.withOpacity(0.2),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
  );
}
