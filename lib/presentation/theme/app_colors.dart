import 'package:flutter/material.dart';

/// Central place for brand colors + elevations.
/// Keep all hard-coded hex here.
final class AppColors {
  // Brand / seed
  static const Color seed = Color(0xFF22D3EE); // vibrant cyan/teal
  static const Color brand = seed;

  // Neutrals (ink-like dark)
  static const Color ink900 = Color(0xFF0B0F14);
  static const Color ink800 = Color(0xFF0E141C);
  static const Color ink700 = Color(0xFF121822);
  static const Color ink600 = Color(0xFF1B2532);

  // Accents
  static const Color purple = Color(0xFFA78BFA);
  static const Color green  = Color(0xFF34D399);
  static const Color red    = Color(0xFFFB7185);
  static const Color amber  = Color(0xFFF59E0B);

  // Semantic
  static const Color success = green;
  static const Color error   = red;
  static const Color warning = amber;
  static const Color info    = brand;

  // Gradients
  static const Gradient darkBgGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      ink900, // deep ink
      ink800,
      Color(0xFF0B1A1C), // subtle teal-tinted black
    ],
  );
}
