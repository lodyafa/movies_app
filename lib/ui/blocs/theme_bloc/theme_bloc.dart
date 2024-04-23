import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/storage/shared_prefs.dart';

part 'theme_event.dart';
part 'theme_state.dart';

extension ThemeModeX on ThemeMode {
  String asString() {
    switch (this) {
      case ThemeMode.system:
        return "system";
      case ThemeMode.dark:
        return "dark";
      case ThemeMode.light:
        return "light";
    }
  }

  static ThemeMode fromString(String value) {
    switch (value) {
      case 'system':
        return ThemeMode.system;
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const themeModeKey = "theme_mode";

  late final SharedPrefsStorage _storage;

  ThemeBloc({required SharedPrefsStorage storage})
      : _storage = storage,
        super(ThemeState(themeMode: ThemeMode.system)) {
    on<ThemeRestoreThemeEvent>(_onRestoreTheme);
    on<ThemeToggleDarkThemeEvent>(_onToggleDarkTheme);
    on<ThemeToggleLightThemeEvent>(_onToggleLightTheme);
    on<ThemeToggleSystemThemeEvent>(_onToggleSystemTheme);
  }

  Future<void> _onRestoreTheme(
    ThemeRestoreThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    final String? themeModeStr = await _storage.get<String>(themeModeKey);

    ThemeMode themeMode = ThemeModeX.fromString(themeModeStr ?? "system");
    
    emit(ThemeState(themeMode: themeMode));
  }

  Future<void> _onToggleDarkTheme(
    ThemeToggleDarkThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    await _storage.set<String>(
      themeModeKey,
      ThemeMode.dark.asString(),
    );

    emit(ThemeState(themeMode: ThemeMode.dark));
  }

  Future<void> _onToggleLightTheme(
    ThemeToggleLightThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    await _storage.set<String>(
      themeModeKey,
      ThemeMode.light.asString(),
    );

     emit(ThemeState(themeMode: ThemeMode.light));
  }

  Future<void> _onToggleSystemTheme(
    ThemeToggleSystemThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    await _storage.set<String>(
      themeModeKey,
      ThemeMode.system.asString(),
    );

     emit(ThemeState(themeMode: ThemeMode.system));
  }
}
