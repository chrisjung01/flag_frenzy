import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_notifier_provider.g.dart';

sealed class GameState {}

class GameStateIdle extends GameState {}

class GameStateLoading extends GameState {}

class GameStateError extends GameState {
  final String message;
  GameStateError(this.message);
}

class GameStateLoaded extends GameState {
  final Widget game;
  GameStateLoaded(this.game);
}

@Riverpod(keepAlive: true)
class GameNotifier extends _$GameNotifier {
  @override
  GameState build() {
    return GameStateIdle();
  }

  void startGame() {
    state = GameStateLoading();
    // TODO: Implementiere Spielstart-Logik
  }

  void setError(String message) {
    state = GameStateError(message);
  }

  void setGame(Widget game) {
    state = GameStateLoaded(game);
  }
}
