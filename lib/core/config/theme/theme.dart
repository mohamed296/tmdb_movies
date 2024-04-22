import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_movies/core/config/theme/app_colors.dart';
import 'package:tmdb_movies/core/config/theme/size.dart';


/// this class is used to set the app theme data and colors for the app
class AppTheme {
  /// this method is used to get the app theme data
  static ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        brightness: Brightness.light,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            // systemNavigationBarContrastEnforced: true,
            // systemStatusBarContrastEnforced: true,
          ),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(AppColor.primaryColor),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: AppColor.primaryColor,
          applyThemeToAll: true,
          barBackgroundColor: AppColor.backgroundColor,
          primaryContrastingColor: AppColor.primaryColor,
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColor.primaryColor),
          overlayColor: MaterialStateProperty.all(AppColor.primaryColor),
          splashRadius: 24,
        ),
        scrollbarTheme: ScrollbarThemeData(
          radius: Radius.circular(designRadius),
          thickness: MaterialStateProperty.all(4),
          thumbColor: MaterialStateProperty.all(AppColor.primaryColor),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: AppColor.backgroundColor,
          enableFeedback: true,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          selectedIconTheme: IconThemeData(color: AppColor.primaryColor),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius),
            ),
            padding: const EdgeInsets.all(8),
            elevation: 0,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            foregroundColor: AppColor.backgroundColor,
            disabledBackgroundColor: AppColor.primaryColor.withOpacity(0.2),
            backgroundColor: AppColor.primaryColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: AppColor.primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius),
            ),
            padding: const EdgeInsets.all(8),
            elevation: 0,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            foregroundColor: AppColor.primaryColor,
            disabledBackgroundColor: AppColor.primaryColor.withOpacity(0.2),
          ),
        ),
        colorScheme: ColorScheme(
          primary: AppColor.primaryColor,
          secondary: AppColor.primaryColor,
          surface: AppColor.surfaceColor,
          background: AppColor.backgroundColor,
          error: AppColor.errorColor,
          onPrimary: Colors.black,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          // body
          bodyLarge: GoogleFonts.poppins(),
          bodyMedium: GoogleFonts.poppins(),
          bodySmall: GoogleFonts.poppins(),
          // headline
          headlineLarge: GoogleFonts.poppins(),
          headlineMedium: GoogleFonts.poppins(),
          headlineSmall: GoogleFonts.poppins(),
          // label
          labelLarge: GoogleFonts.poppins(),
          labelMedium: GoogleFonts.poppins(),
          labelSmall: GoogleFonts.poppins(),
          // display
          displayLarge: GoogleFonts.poppins(),
          displayMedium: GoogleFonts.poppins(),
          displaySmall: GoogleFonts.poppins(),
          // title
          titleLarge: GoogleFonts.poppins(),
          titleMedium: GoogleFonts.poppins(),
          titleSmall: GoogleFonts.poppins(),
        ),
      );
}
