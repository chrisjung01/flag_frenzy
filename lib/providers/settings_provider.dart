import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';

class Settings {
  final bool soundEnabled;
  final bool musicEnabled;
  final String difficulty;
  final String language;

  const Settings({
    this.soundEnabled = true,
    this.musicEnabled = true,
    this.difficulty = 'normal',
    this.language = 'de',
  });

  Settings copyWith({
    bool? soundEnabled,
    bool? musicEnabled,
    String? difficulty,
    String? language,
  }) {
    return Settings(
      soundEnabled: soundEnabled ?? this.soundEnabled,
      musicEnabled: musicEnabled ?? this.musicEnabled,
      difficulty: difficulty ?? this.difficulty,
      language: language ?? this.language,
    );
  }
}

@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Settings build() {
    return const Settings();
  }

  void toggleSound() {
    state = state.copyWith(soundEnabled: !state.soundEnabled);
  }

  void toggleMusic() {
    state = state.copyWith(musicEnabled: !state.musicEnabled);
  }

  void setDifficulty(String difficulty) {
    state = state.copyWith(difficulty: difficulty);
  }

  void setLanguage(String language) {
    state = state.copyWith(language: language);
  }
} 