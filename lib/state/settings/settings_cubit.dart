import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_money/state/settings/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  static const String _seedColorKey = 'seed_color';

  SettingsCubit() : super(SettingsState()) {
    initialize();
  }

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt(_seedColorKey);
    
    if (colorValue != null) {
      emit(state.copyWith(seedColor: Color(colorValue)));
    }
  }

  Future<void> updateSeedColor(Color color) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_seedColorKey, color.value);
      emit(state.copyWith(seedColor: color));
    } catch (e) {
      // Handle error silently or show snackbar
      rethrow;
    }
  }
}

