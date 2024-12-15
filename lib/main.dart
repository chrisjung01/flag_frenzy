import 'dart:io';

import 'package:flag_frenzy/game/game_screen.dart';
import 'package:flag_frenzy/widgets/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'router/router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flag Frenzy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlue],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Flag Frenzy',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              MenuButton(
                text: 'Spielen',
                onPressed: () => context.go('/game-selection'),
              ),
              MenuButton(
                text: 'Einstellungen',
                onPressed: () => context.go('/settings'),
              ),
              MenuButton(
                text: 'Bestenliste',
                onPressed: () => context.go('/leaderboard'),
              ),
              MenuButton(
                text: 'Über',
                onPressed: () => context.go('/about'),
              ),
              MenuButton(
                text: 'Beenden',
                onPressed: () => exit(0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
