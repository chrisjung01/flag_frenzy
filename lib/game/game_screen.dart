import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flag_frenzy/providers/game_notifier_provider.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: switch (gameState) {
        GameStateIdle() => const Center(
            child: Text('Bereit zum Spielen'),
          ),
        GameStateLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        GameStateError(:final message) => Center(
            child: Text('Fehler: $message'),
          ),
        GameStateLoaded(:final game) => game,
      },
    );
  }
}
