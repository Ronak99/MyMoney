import 'package:flutter/material.dart';
import 'app_colors.dart';

final class AppComponents {
  /// Buttons
  static ElevatedButtonThemeData elevatedButtons(ColorScheme s) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: s.primary,
          foregroundColor: s.onPrimary,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      );

  static FilledButtonThemeData filledButtons(ColorScheme s) =>
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: s.secondaryContainer,
          foregroundColor: s.onSecondaryContainer,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      );

  static OutlinedButtonThemeData outlinedButtons(ColorScheme s) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: s.outline),
          foregroundColor: s.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      );

  static TextButtonThemeData textButtons(ColorScheme s) => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: s.primary,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      );

  /// Inputs
  static InputDecorationTheme inputTheme(ColorScheme s) => InputDecorationTheme(
        filled: true,
        fillColor: s.surfaceContainerHighest,
        hintStyle: TextStyle(color: s.onSurfaceVariant.withOpacity(.7)),
        labelStyle: TextStyle(color: s.onSurfaceVariant),
        helperStyle: TextStyle(color: s.onSurfaceVariant),
        errorStyle: TextStyle(color: s.error),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: s.outlineVariant, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: s.primary, width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: s.error, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: s.error, width: 1.4),
        ),
        prefixIconColor: s.onSurfaceVariant,
        suffixIconColor: s.onSurfaceVariant,
      );

  /// App bar
  static AppBarTheme appBar(ColorScheme s) => AppBarTheme(
        elevation: 0,
        backgroundColor: s.surface,
        foregroundColor: s.onSurface,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: s.onSurface,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(color: s.onSurface),
      );

  /// Cards, chips, dialogs, nav, etc.
  static CardTheme card(ColorScheme s) => CardTheme(
        color: s.surfaceContainerHigh,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.zero,
      );

  static ChipThemeData chips(ColorScheme s, TextTheme t) => ChipThemeData(
        backgroundColor: s.surfaceContainerHighest,
        labelStyle: t.labelLarge!,
        selectedColor: s.secondaryContainer,
        secondarySelectedColor: s.secondaryContainer,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: s.outlineVariant),
      );

  static BottomNavigationBarThemeData bottomNav(ColorScheme s) =>
      BottomNavigationBarThemeData(
        backgroundColor: s.surface,
        selectedItemColor: s.primary,
        unselectedItemColor: s.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        selectedIconTheme: const IconThemeData(
          size: 26,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 20,
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 10,
          color: s.onSecondaryContainer,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 10,
          color: s.onSurfaceVariant,
        ),
      );

  static NavigationBarThemeData navBar(ColorScheme s) => NavigationBarThemeData(
        backgroundColor: s.surface,
        elevation: 0,
        indicatorColor: s.secondaryContainer,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
              color: selected ? s.onSecondaryContainer : s.onSurfaceVariant);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontWeight: FontWeight.w600,
            color: selected ? s.onSecondaryContainer : s.onSurfaceVariant,
          );
        }),
      );

  static FloatingActionButtonThemeData fab(ColorScheme s) =>
      FloatingActionButtonThemeData(
        backgroundColor: s.primary,
        foregroundColor: s.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      );

  static DialogTheme dialog(ColorScheme s) => DialogTheme(
        backgroundColor: s.surfaceContainerHigh,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      );

  static SnackBarThemeData snackBar(ColorScheme s) => SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: s.inverseSurface,
        contentTextStyle: TextStyle(color: s.onInverseSurface),
        actionTextColor: s.tertiary,
        elevation: 0,
      );

  static DividerThemeData divider(ColorScheme s) =>
      DividerThemeData(color: s.outlineVariant, thickness: 1);

  static ListTileThemeData listTile(ColorScheme s) => ListTileThemeData(
        iconColor: s.onSurfaceVariant,
        textColor: s.onSurface,
        tileColor: s.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      );

  static CheckboxThemeData checkbox(ColorScheme s) =>
      CheckboxThemeData(fillColor: WidgetStatePropertyAll(s.primary));

  static RadioThemeData radio(ColorScheme s) =>
      RadioThemeData(fillColor: WidgetStatePropertyAll(s.primary));

  static SwitchThemeData switcher(ColorScheme s) => SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? s.onPrimary
              : s.onSurfaceVariant,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? s.primary
              : s.surfaceContainerHighest,
        ),
      );

  static SliderThemeData slider(ColorScheme s) => SliderThemeData(
        activeTrackColor: s.primary,
        inactiveTrackColor: s.outlineVariant,
        thumbColor: s.primary,
        overlayColor: s.primary.withOpacity(.1),
      );
}
