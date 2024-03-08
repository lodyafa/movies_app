part of "theme.dart";

ThemeData createDarkTheme() {
  return ThemeData(
    textTheme: createTextTheme(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    // extensions: <ThemeExtension<dynamic>>[
    //   ThemeColors.light,
    //   ThemeTextStyles.light,
    //   ThemeGradients.light,
    // ],
    // dialogTheme: DialogTheme(
    //   backgroundColor: AppColors.white,
    //   titleTextStyle: headline1.copyWith(
    //     color: AppColors.black,
    //     fontSize: 20,
    //     fontWeight: FontWeight.w500,
    //   ),
    //   contentTextStyle: headline1.copyWith(
    //     color: AppColors.black,
    //   ),
    // ),
    // focusColor: Colors.blue.withOpacity(0.2),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  );
}