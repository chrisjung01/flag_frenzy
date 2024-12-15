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
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        title: const Text('Einstellungen'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange, Colors.deepOrange],
          ),
        ),
        child: ListView(
          children: [
            _buildSettingsTile(
              child: SwitchListTile(
                title: const Text('Soundeffekte', style: TextStyle(color: Colors.white)),
                value: settings.soundEnabled,
                onChanged: (_) => ref.read(settingsNotifierProvider.notifier).toggleSound(),
              ),
            ),
            _buildSettingsTile(
              child: SwitchListTile(
                title: const Text('Musik', style: TextStyle(color: Colors.white)),
                value: settings.musicEnabled,
                onChanged: (_) => ref.read(settingsNotifierProvider.notifier).toggleMusic(),
              ),
            ),
            _buildSettingsTile(
              child: ListTile(
                title: const Text('Schwierigkeit', style: TextStyle(color: Colors.white)),
                trailing: DropdownButton<String>(
                  dropdownColor: Colors.orange,
                  value: settings.difficulty,
                  items: ['leicht', 'normal', 'schwer']
                      .map((d) => DropdownMenuItem(
                            value: d,
                            child: Text(d, style: const TextStyle(color: Colors.white)),
                          ))
                      .toList(),
                  onChanged: (value) => ref
                      .read(settingsNotifierProvider.notifier)
                      .setDifficulty(value!),
                ),
              ),
            ),
            _buildSettingsTile(
              child: ListTile(
                title: const Text('Sprache', style: TextStyle(color: Colors.white)),
                trailing: DropdownButton<String>(
                  dropdownColor: Colors.orange,
                  value: settings.language,
                  items: ['de', 'en']
                      .map((l) => DropdownMenuItem(
                            value: l,
                            child: Text(l, style: const TextStyle(color: Colors.white)),
                          ))
                      .toList(),
                  onChanged: (value) => ref
                      .read(settingsNotifierProvider.notifier)
                      .setLanguage(value!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
} 