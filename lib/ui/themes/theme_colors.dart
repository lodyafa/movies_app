part of "theme.dart";

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color themeButtonColor;
  final Color searchAppBarColor;
  final Color btmNvgBarIconColor;
  final Color btmNvgBarActiveIconColor;
  final Color btmNvgBarBackgrdColor;

  const ThemeColors({
    required this.themeButtonColor,
    required this.searchAppBarColor,
    required this.btmNvgBarIconColor,
    required this.btmNvgBarActiveIconColor,
    required this.btmNvgBarBackgrdColor,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? themeButtonColor,
    Color? searchAppBarColor,
    Color? btmNvgBarIconColor,
    Color? btmNvgBarActiveIconColor,
    Color? btmNvgBarBackgrdColor,
  }) {
    return ThemeColors(
      themeButtonColor: themeButtonColor ?? this.themeButtonColor,
      searchAppBarColor: searchAppBarColor ?? this.searchAppBarColor,
      btmNvgBarIconColor: btmNvgBarIconColor ?? this.btmNvgBarIconColor,
      btmNvgBarActiveIconColor:
          btmNvgBarActiveIconColor ?? this.btmNvgBarActiveIconColor,
      btmNvgBarBackgrdColor:
          btmNvgBarBackgrdColor ?? this.btmNvgBarBackgrdColor,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      themeButtonColor:
          Color.lerp(themeButtonColor, other.themeButtonColor, t)!,
      searchAppBarColor:
          Color.lerp(searchAppBarColor, other.searchAppBarColor, t)!,
      btmNvgBarIconColor:
          Color.lerp(btmNvgBarIconColor, other.btmNvgBarIconColor, t)!,
      btmNvgBarActiveIconColor: Color.lerp(
          btmNvgBarActiveIconColor, other.btmNvgBarActiveIconColor, t)!,
      btmNvgBarBackgrdColor:
          Color.lerp(btmNvgBarBackgrdColor, other.btmNvgBarBackgrdColor, t)!,
    );
  }

  static get light => const ThemeColors(
        themeButtonColor: Color.fromARGB(255, 243, 106, 51),
        searchAppBarColor: Color.fromARGB(255, 180, 180, 180),
        btmNvgBarIconColor: Color.fromARGB(255, 55, 55, 55),
        btmNvgBarActiveIconColor: AppColors.orange,
        btmNvgBarBackgrdColor: Color.fromARGB(255, 229, 229, 229),
      );

  static get dark => const ThemeColors(
        themeButtonColor: AppColors.orange,
        searchAppBarColor: AppColors.darkerGrey,
        btmNvgBarIconColor: AppColors.white,
        btmNvgBarActiveIconColor: AppColors.orange,
        btmNvgBarBackgrdColor: AppColors.darkestGrey,
      );
}
