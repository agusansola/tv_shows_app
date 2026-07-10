import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const Color silver = Color(0xFFBEBBBB);
  static const Color vintageGrape = Color(0xFF444054);
  static const Color midnightViolet = Color(0xFF2F243A);
  static const Color almondSilk = Color(0xFFFFEDE7);
  static const Color salmon = Color(0xFFDB8A74);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      //TODO: for coherence with Material 3, colorScheme should be ColorScheme.fromSeed
      //TODO: better use of color palette, colors should be distributed better with a specific role for each one. External colors shouldn't be used, not because it causes error, but because it isn't coherent. 
      //TODO: in depth personalizzation of text dimension and weight.
      colorScheme: const ColorScheme.light(
        primary: midnightViolet,
        onPrimary: Colors.white,

        secondary: vintageGrape,
        onSecondary: Colors.white,

        tertiary: salmon,
        onTertiary: midnightViolet,

        surface: Colors.white,
        onSurface: midnightViolet,

        error: Colors.red,
        onError: Colors.white,
      ),

      scaffoldBackgroundColor: almondSilk,

      appBarTheme: const AppBarTheme(
        backgroundColor: midnightViolet,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: silver,
        selectedColor: salmon,
        labelStyle: const TextStyle(
          color: midnightViolet,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: salmon,
          foregroundColor: midnightViolet,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: midnightViolet,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: midnightViolet,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: vintageGrape,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: midnightViolet),
        bodyMedium: TextStyle(color: vintageGrape),
      ),

      iconTheme: const IconThemeData(color: salmon),

      progressIndicatorTheme: const ProgressIndicatorThemeData(color: salmon),
    );
  }
}
