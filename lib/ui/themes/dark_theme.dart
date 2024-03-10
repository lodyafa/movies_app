part of "theme.dart";

ThemeData createDarkTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.orange,
      onPrimary: AppColors.white,
      secondary: AppColors.darkerGrey,
      onSecondary: AppColors.grey,
      background: AppColors.black,
      surface: AppColors.darkestGrey,
      error: AppColors.red,
      onError: AppColors.white,
      onBackground: AppColors.white,
      onSurface: AppColors.white,
    ),
    extensions: <ThemeExtension<dynamic>>[
      ThemeColors.light,
      // ThemeTextStyles.light,
      // ThemeGradients.light,
    ],
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  );
}
