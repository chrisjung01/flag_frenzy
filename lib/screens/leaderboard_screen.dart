import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Bestenliste'),
      ),
      body: const Center(child: Text('Bestenliste kommt bald!')),
    );
  }
} 