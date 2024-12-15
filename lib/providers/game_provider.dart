import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_provider.g.dart';

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

@riverpod
class GameNotifier extends _$GameNotifier {
  @override
  GameState build() {
    return GameStateIdle();
  }
} 