import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flag_frenzy/providers/settings_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Einstellungen'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Soundeffekte'),
            value: settings.soundEnabled,
            onChanged: (_) => ref.read(settingsNotifierProvider.notifier).toggleSound(),
          ),
          SwitchListTile(
            title: const Text('Musik'),
            value: settings.musicEnabled,
            onChanged: (_) => ref.read(settingsNotifierProvider.notifier).toggleMusic(),
          ),
          ListTile(
            title: const Text('Schwierigkeit'),
            trailing: DropdownButton<String>(
              value: settings.difficulty,
              items: ['leicht', 'normal', 'schwer']
                  .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                  .toList(),
              onChanged: (value) => ref
                  .read(settingsNotifierProvider.notifier)
                  .setDifficulty(value!),
            ),
          ),
          ListTile(
            title: const Text('Sprache'),
            trailing: DropdownButton<String>(
              value: settings.language,
              items: ['de', 'en']
                  .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                  .toList(),
              onChanged: (value) => ref
                  .read(settingsNotifierProvider.notifier)
                  .setLanguage(value!),
            ),
          ),
        ],
      ),
    );
  }
} 