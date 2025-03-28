import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meowdify/core/utilities/colors.dart'; // Ensure AppColors is imported

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimaryAccent,
      scaffoldBackgroundColor: AppColors.lightBackground,
      useMaterial3: true,
      fontFamily: GoogleFonts.notoSansSc().fontFamily,
      textTheme: textThemes(Brightness.light),
      colorScheme: const ColorScheme.light(
          primary: AppColors.lightPrimaryAccent,
          secondary: AppColors.lightSecondaryAccent,
          surface: AppColors.lightSurface,
          onPrimary: AppColors.lightPrimaryText,
          onSecondary: AppColors.lightSecondaryText),
      elevatedButtonTheme: elevatedButtonThemes(Brightness.light),
      inputDecorationTheme: inputDecorationThemes(Brightness.light),
      outlinedButtonTheme: outlinedButtonThemes(Brightness.light));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      primaryColor: AppColors.darkPrimaryAccent,
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: textThemes(Brightness.dark),
      fontFamily: GoogleFonts.notoSansSc().fontFamily,
      colorScheme: const ColorScheme.dark(
          primary: AppColors.darkPrimaryAccent,
          secondary: AppColors.darkSecondaryAccent,
          surface: AppColors.darkSurface,
          onPrimary: AppColors.darkPrimaryText,
          onSecondary: AppColors.darkSecondaryText),
      inputDecorationTheme: inputDecorationThemes(Brightness.dark),
      outlinedButtonTheme: outlinedButtonThemes(Brightness.dark));

  static ElevatedButtonThemeData elevatedButtonThemes(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: isDark
                ? AppColors.darkPrimaryAccent
                : AppColors.lightPrimaryAccent,
            foregroundColor:
                isDark ? AppColors.darkPrimaryText : AppColors.lightPrimaryText,
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5))));
  }

  static OutlinedButtonThemeData outlinedButtonThemes(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: BorderSide(
              color: isDark
                  ? AppColors.darkPrimaryAccent
                  : AppColors.lightPrimaryAccent),
          elevation: 0,
          foregroundColor:
              isDark ? AppColors.darkPrimaryText : AppColors.lightPrimaryText,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  static InputDecorationTheme inputDecorationThemes(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    return InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.darkSurface : Colors.white,
        hintStyle: TextStyle(
            color: isDark
                ? AppColors.darkSecondaryText
                : AppColors.lightSecondaryText),
        prefixIconColor:
            isDark ? AppColors.darkPrimaryAccent : AppColors.lightPrimaryAccent,
        suffixIconColor:
            isDark ? AppColors.darkPrimaryAccent : AppColors.lightPrimaryAccent,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isDark
                    ? AppColors.darkPrimaryAccent
                    : AppColors.lightPrimaryAccent,
                width: 2)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: isDark
                    ? AppColors.darkPrimaryAccent
                    : AppColors.lightPrimaryAccent,
                width: 1)),
        labelStyle: TextStyle(
            color: isDark
                ? AppColors.darkPrimaryText
                : AppColors.lightPrimaryText));
  }

  static TextTheme textThemes(Brightness brightness) {
    return GoogleFonts.notoSansScTextTheme(ThemeData.light().textTheme)
        .copyWith(
      displayLarge: displayLargeTextStyle(brightness),
      displayMedium: displayMediumTextStyle(brightness),
      displaySmall: displaySmallTextStyle(brightness),
      headlineLarge: headlineLargeTextStyle(brightness),
      headlineMedium: headlineMediumTextStyle(brightness),
      headlineSmall: headlineSmallTextStyle(brightness),
      titleLarge: titleLargeTextStyle(brightness),
      titleMedium: titleMediumTextStyle(brightness),
      titleSmall: titleSmallTextStyle(brightness),
      bodyLarge: bodyLargeTextStyle(brightness),
      bodyMedium: bodyMediumTextStyle(brightness),
      bodySmall: bodySmallTextStyle(brightness),
      labelLarge: labelLargeTextStyle(brightness),
      labelMedium: labelMediumTextStyle(brightness),
      labelSmall: labelSmallTextStyle(brightness),
    );
  }

  static TextStyle primaryGenericStyle(Brightness brightness) {
    return TextStyle(
      color: brightness == Brightness.dark
          ? AppColors.darkPrimaryText
          : AppColors.lightPrimaryText,
    );
  }

  static TextStyle displayLargeTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 57.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle displayMediumTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle displaySmallTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle headlineLargeTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 32.0,
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle headlineMediumTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle headlineSmallTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle titleLargeTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle titleMediumTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle titleSmallTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bodyLargeTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      height: 1.5,
    );
  }

  static TextStyle bodyMediumTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      height: 1.4,
    );
  }

  static TextStyle bodySmallTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle labelLargeTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle labelMediumTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle labelSmallTextStyle(Brightness brightness) {
    return primaryGenericStyle(brightness).copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.w300,
    );
  }
}
