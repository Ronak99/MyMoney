import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_components.dart';

/// Public entry points: [AppTheme.light] and [AppTheme.dark]
class AppTheme {
  // static ThemeData light = _buildTheme(brightness: Brightness.light);
  // static ThemeData dark = _buildTheme(brightness: Brightness.dark);

  ThemeData buildTheme({required Brightness brightness}) {
    final scheme = _colorScheme(brightness);
    final text = AppTypography.textTheme(scheme);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      fontFamily: AppTypography.fontFamily,
      textTheme: text,

      // Components
      appBarTheme: AppComponents.appBar(scheme),
      elevatedButtonTheme: AppComponents.elevatedButtons(scheme),
      filledButtonTheme: AppComponents.filledButtons(scheme),
      outlinedButtonTheme: AppComponents.outlinedButtons(scheme),
      textButtonTheme: AppComponents.textButtons(scheme),
      inputDecorationTheme: AppComponents.inputTheme(scheme),
      cardTheme: AppComponents.card(scheme),
      chipTheme: AppComponents.chips(scheme, text),
      bottomNavigationBarTheme: AppComponents.bottomNav(scheme),
      navigationBarTheme: AppComponents.navBar(scheme),
      floatingActionButtonTheme: AppComponents.fab(scheme),
      dialogTheme: AppComponents.dialog(scheme),
      snackBarTheme: AppComponents.snackBar(scheme),
      dividerTheme: AppComponents.divider(scheme),
      listTileTheme: AppComponents.listTile(scheme),
      checkboxTheme: AppComponents.checkbox(scheme),
      radioTheme: AppComponents.radio(scheme),
      switchTheme: AppComponents.switcher(scheme),
      sliderTheme: AppComponents.slider(scheme),
      iconTheme: IconThemeData(color: scheme.onSurfaceVariant),
      primaryIconTheme: IconThemeData(color: scheme.onPrimary),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: scheme.primary),

      // Material elevations & surfaces
      splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
      splashColor: scheme.primary.withOpacity(.05),
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.standard,
    );
  }

  /// Material 3 native scheme, harmonized from a seed and adjusted for fintech.
  ColorScheme _colorScheme(Brightness b) {
    final base = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: b,
    );

    if (b == Brightness.dark) {
      // Intoxicating dark variant; richer surfaces and crisp contrast.
      return base.copyWith(
        surface: AppColors.ink900,
        onSurface: Colors.white,
        inverseSurface: Colors.black,
        surfaceContainerHighest: AppColors.ink700,
        surfaceContainerHigh: AppColors.ink700,
        surfaceContainer: AppColors.ink800,
        surfaceTint: Colors.transparent,
        primary: AppColors.brand,
        secondary: AppColors.purple,
        tertiary: AppColors.green,
        error: AppColors.error,
        outlineVariant: AppColors.ink600,
      );
    }

    // Light scheme: soft but vibrant accents.
    return base.copyWith(
      surface: const Color(0xFFF8FAFC),
      surfaceContainerHighest: const Color(0xFFFFFFFF),
      surfaceContainerHigh: const Color(0xFFF2F5F8),
      surfaceContainer: const Color(0xFFF5F7FA),
      primary: AppColors.brand,
      secondary: AppColors.purple,
      tertiary: AppColors.green,
      error: AppColors.error,
      outlineVariant: const Color(0xFFE2E8F0),
    );
  }
}
