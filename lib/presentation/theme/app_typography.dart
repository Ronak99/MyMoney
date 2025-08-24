import 'package:flutter/material.dart';

/// Typography tokens. If you use GoogleFonts, set fontFamily accordingly.
final class AppTypography {
  static const String fontFamily = 'SFUIText'; // or your custom font

  static TextTheme textTheme(ColorScheme scheme) {
    final base = Typography.material2021(platform: TargetPlatform.iOS)
        .black
        .apply(fontFamily: fontFamily);

    // Use copyWith to nudge weights/sizes for a fintech feel.
    return base.copyWith(
      displayLarge:  base.displayLarge?.copyWith(fontWeight: FontWeight.w700),
      displayMedium: base.displayMedium?.copyWith(fontWeight: FontWeight.w700),
      displaySmall:  base.displaySmall?.copyWith(fontWeight: FontWeight.w700),
      headlineLarge: base.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
      headlineMedium:base.headlineMedium?.copyWith(fontWeight: FontWeight.w700),
      headlineSmall: base.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
      titleLarge:    base.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      titleMedium:   base.titleMedium?.copyWith(letterSpacing: 0.1),
      titleSmall:    base.titleSmall?.copyWith(letterSpacing: 0.1),
      bodyLarge:     base.bodyLarge,
      bodyMedium:    base.bodyMedium,
      bodySmall:     base.bodySmall,
      labelLarge:    base.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      labelMedium:   base.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      labelSmall:    base.labelSmall?.copyWith(fontWeight: FontWeight.w600),
    ).apply(
      // Harmonize with scheme for better contrast
      bodyColor: scheme.onSurface,
      displayColor: scheme.onSurface,
    );
  }
}
