part of "theme.dart";

ThemeData createLightTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    // extensions: <ThemeExtension<dynamic>>[
    //   ThemeColors.light,
    //   ThemeTextStyles.light,
    //   ThemeGradients.light,
    // ],
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: displayMedium.copyWith(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      contentTextStyle: displayMedium.copyWith(
        color: AppColors.black,
      ),
    ),
    focusColor: Colors.blue.withOpacity(0.2),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  );
}

// seedColor: const Color(0xFFEC612A),
//             primary: const Color(0xFFEC612A),
//             onPrimary: const Color(0xFFFFFFFF),
//             secondary: const Color(0xFF262626),
//             onSecondary: const Color(0xFF939393),
//             background: const Color(0xFF000000),
//             surface: const Color(0xFF121212),